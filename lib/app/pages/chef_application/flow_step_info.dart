import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/driver/model/vehicle.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/app/pages/driver/driver_reg_cubit.dart';
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
      [
        "profile",
        ["Profile", "First, you should complete your profile"],
        () => showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => const EditBioSheet(),
            ),
        () => true,
      ],
      [
        "menu",
        ["Your Menu", "Secondly, add your meals on menu and schedule it"],
        () {
          // G.read<ScheduleBloc>().add(const ScheduleEvent.init());
          G.rd<ScheduleCubit>().loadSchedule();

          showAlertDialog(
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
                // G.read<ChefFlowBloc>().add(ChefFlowEventNext(idx: 2));
              },
            },
            insetPadding: 0,
            // onDismissed: () {
            //   context.read<ChefFlowBloc>().add(ChefFlowEventNext(idx: 2));
            // },
          );
        },
        () => state.onboarding.mealsActive,
      ],
      [
        "documentation",
        ["Documentation", "Third, attach your documents"],
        // () => G.router.push(const DocumentationRoute()),
        () => showAlertDialog(
              context: context,
              content: const DocumentationScreen(),
              actions: {'Ok': null},
              insetPadding: 0,
            ),
        () => state.onboarding.docsActive,
      ],
      [
        "approval",
        ["Get Approval", "Then, waiting for approval within 72 hours"],
        () async {
          await context.read<ProfileCubit>().getProfileForm().then((value) {
            showAlertDialog(
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
          });
        },
        () => state.onboarding.approvalActive,
      ],
      [
        "contract",
        [
          "Get Contract",
          "Finally, download the contract to sign and upload it"
        ],
        // () => G.router.push(const ContractRoute()),
        () => showAlertDialog(
                context: context,
                content: const ContractScreen(),
                insetPadding: 0,
                actions: {
                  'Ok': (ctx) {
                    var photo = G.rd<ProfileCubit>().state.form.contractPhoto;
                    if (photo?.isEmpty ?? true) return;

                    G.pop();
                  },
                }),
        () => state.onboarding.contractActive,
      ],
    ];

List driverStepsInfo(BuildContext context, NRegState state) => [
      chefStepsInfo(context, state)[0],
      [
        "rides",
        [
          "Your Rides",
          "Secondly, add your vechile type and schedule your working days"
        ],
        () {
          // G.read<ScheduleBloc>().add(const ScheduleEvent.init());
          G.rd<ScheduleCubit>().loadSchedule();
          showAlertDialog(
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
        },
        () => state.onboarding.ridesActive,
      ],
      chefStepsInfo(context, state)[2],
      chefStepsInfo(context, state)[3],
      chefStepsInfo(context, state)[4],
    ];
