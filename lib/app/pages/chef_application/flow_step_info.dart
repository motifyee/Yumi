import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/app/pages/chef_application/documentation/cubit/docs_info.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/app/pages/driver/reg_cubit.dart';
import 'package:yumi/app/pages/driver/rides_screen.dart';
import 'package:yumi/app/pages/chef_application/contract/contract_screen.dart';
import 'package:yumi/app/pages/chef_application/documentation/documentation_screen.dart';
import 'package:yumi/app/pages/schedule/cubit/schedule_cubit.dart';
import 'package:yumi/app/pages/schedule/schedule_screen.dart';
import 'package:yumi/app/pages/settings/profile/bio_sheet.dart';
import 'package:yumi/global.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/menu_template.dart';
import 'package:yumi/template/snack_bar.dart';

List chefStepsInfo(BuildContext context, NRegState state) => [
      // profile
      [
        "profile",
        ["Profile", "First, you should complete your profile"],
        () async {
          if (G.rd<RegCubit>().state.onboarding.approvalDone) return;

          G.rd<RegCubit>().setLoading();

          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => EditBioSheet(),
          );

          G.rd<RegCubit>().setLoading(false);
        },
        () => true,
        () => G.rd<RegCubit>().state.onboarding.profileSheetDone,
      ],
      // your menu
      [
        "menu",
        ["Your Menu", "Secondly, add your meals on menu and schedule it"],
        () async {
          if (G.rd<RegCubit>().state.onboarding.approvalDone) return;

          G.rd<ScheduleCubit>().loadSchedule();

          G.rd<RegCubit>().setLoading();

          await showAlertDialog(
            context: context,
            // title: Container(),
            content: const MenuTemplate(
              menuTarget: MenuTarget.order,
            ),
            actions: {
              'Next': (ctx) {
                if (G.read<MealListBloc>().state.meals.isEmpty) {
                  return addYourMealsDialog(context);
                }
                G.pop();
                return sheduleDialog(context);

                // Navigator.of(context, rootNavigator: true).pop();
              },
            },
            insetPadding: 0,
          );

          G.rd<RegCubit>().setLoading(false);
        },
        () => state.onboarding.mealsActive,
        () => G.rd<RegCubit>().state.onboarding.mealsDone,
      ],
      // documentation
      [
        "documentation",
        ["Documentation", "Third, attach your documents"],
        // () => G.router.push(const DocumentationRoute()),
        () async {
          if (G.rd<RegCubit>().state.onboarding.approvalDone) return;

          G.rd<RegCubit>().setLoading();

          await showAlertDialog(
            context: context,
            content: const DocumentationScreen(),
            actions: {
              'Ok': (context) {
                final List<DocInfo> docsInfo =
                    G.isChefApp ? chefDocsInfo : driverDocsInfo;

                final List<String> notUploadedDocs = docsInfo
                    .filter((t) =>
                        t.getdata(G.rd<ProfileCubit>().state.form) == null)
                    .map((e) => e.title as String)
                    .toList();

                if (notUploadedDocs.isEmpty) return G.pop();

                showAlertDialog(
                  context: context,
                  actions: {'Ok': null},
                  content: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Text(
                      'You have not uploaded the following documents: \n\n${notUploadedDocs.join('\n')}',
                    ),
                  ),
                );
              }
            },
            insetPadding: 0,
          );

          G.rd<RegCubit>().setLoading(false);
        },
        () => state.onboarding.docsActive,

        () => G.rd<RegCubit>().state.onboarding.docsDone,
      ],
      // get approval
      [
        "approval",
        ["Get Approval", "Then, waiting for approval within 72 hours"],
        () async {
          G.rd<RegCubit>().setLoading();

          await context
              .read<ProfileCubit>()
              .getProfileForm()
              .then((value) async {
            await showAlertDialog(
              context: context,
              title: Container(),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(!state.onboarding.approvalDone
                    ? "Waiting for approval within 72 hours..."
                    : "Your application has been approved"),
              ),
              actions: {'Ok': null},
              dismissible: true,
            );

            G.rd<RegCubit>().setLoading(false);
          });
        },
        () => state.onboarding.approvalActive,
        () => G.rd<RegCubit>().state.onboarding.approvalDone,
      ],
      // get contract
      [
        "contract",
        ["Get Contract", "Fourth, download the contract to sign and upload it"],
        // () => G.router.push(const ContractRoute()),
        () async {
          G.rd<RegCubit>().setLoading();

          await showAlertDialog(
              context: context,
              content: const ContractScreen(),
              insetPadding: 0,
              actions: {
                'Ok': (ctx) {
                  var photo = G.rd<ProfileCubit>().state.form.contractPhoto;
                  if (photo?.isEmpty ?? true) return;

                  G.pop();
                },
              });

          G.rd<RegCubit>().setLoading(false);
        },
        () => state.onboarding.contractActive,
        () => G.rd<RegCubit>().state.onboarding.contractDone,
      ],
      // contract approval
      [
        "approval",
        ["Contract Approval", "Finally, waiting for approval within 72 hours"],
        // () => G.router.push(const ContractRoute()),
        () async {
          G.rd<RegCubit>().setLoading();

          await context.read<ProfileCubit>().getProfileForm().then((value) {
            showAlertDialog(
              context: context,
              title: Container(),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(!state.onboarding.contractApprovalDone
                    ? "Waiting for approval within 72 hours..."
                    : "Your Contract has been approved"),
              ),
              actions: {'Ok': null},
              dismissible: true,
            );
          });

          G.rd<RegCubit>().setLoading(false);
        },
        () => state.onboarding.contractApprovalActive,
        () => G.rd<RegCubit>().state.onboarding.contractApprovalDone,
      ],
    ];

List driverStepsInfo(BuildContext context, NRegState state) => [
      chefStepsInfo(context, state)[0],
      // rides
      [
        "rides",
        [
          "Your Rides",
          "Secondly, add your vechile type and schedule your working days"
        ],
        () async {
          if (G.rd<RegCubit>().state.onboarding.approvalDone) return;

          G.rd<RegCubit>().setLoading();

          G.rd<ScheduleCubit>().loadSchedule();
          await showAlertDialog(
            context: context,
            content: const RidesScreen(),
            actions: {
              'Save': (ctx) async {
                // if (G.cread<RegCubit>().state.vehicleType?.isEmpty ?? true) {
                var regCubit = G.rd<RegCubit>();

                if ((regCubit.state.vehicle.vehicleName()?.length ?? 0) < 3) {
                  return addYourVehicleDialog(context, firstTime: false);
                }

                regCubit.state.canAddVehicle.then((value) async {
                  if (!value) {
                    G.pop();
                    return sheduleDialog(context);
                  }

                  await regCubit.saveVehicleType().then((_) {
                    G.pop();
                    sheduleDialog(context);
                  }).catchError((msg) {
                    ScaffoldMessenger.of(G.context).showSnackBar(
                      SnackBar(
                        content: SnackBarMassage(
                          massage: msg.toString(),
                        ),
                      ),
                    );

                    G.pop();
                    sheduleDialog(context);

                    return;
                  });
                });
              },
            },
            insetPadding: 0,
          );

          G.rd<RegCubit>().setLoading(false);
        },
        () => state.onboarding.ridesActive,
        () => G.rd<RegCubit>().state.onboarding.ridesDone,
      ],
      chefStepsInfo(context, state)[2],
      chefStepsInfo(context, state)[3],
      chefStepsInfo(context, state)[4],
      chefStepsInfo(context, state)[5],
    ];
