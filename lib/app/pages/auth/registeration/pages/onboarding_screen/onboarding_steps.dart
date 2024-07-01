import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/app/pages/auth/registeration/pages/documentation_screen/docs_info.dart';
import 'package:yumi/app/pages/auth/registeration/pages/onboarding_screen/onboarding_step.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_cubit.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/pages/rides_screen/rides_screen.dart';
import 'package:yumi/app/pages/auth/registeration/pages/contract_screen/contract_screen.dart';
import 'package:yumi/app/pages/auth/registeration/pages/documentation_screen/documentation_screen.dart';
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/cubit/schedule_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/schedule_screen.dart';
import 'package:yumi/app/pages/auth/registeration/pages/bio_sheet/bio_sheet.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/global.dart';
import 'package:yumi/app/components/dialog.dart';
import 'package:yumi/app/pages/menu/widgets/menu_template.dart';
import 'package:yumi/app/components/snack_bar.dart';

List<OnboardingStep> chefOnboardingSteps(
  BuildContext context,
  RegState state,
) =>
    [
      // profile
      OnboardingStep(
        icon: "profile",
        stepTitle: "Profile",
        stepDesc: "First, you should complete your profile",
        onTap: () async {
          final regCubit = G.rd<RegCubit>();

          if (regCubit.state.onboarding.profileSheetDone &&
              regCubit.state.onboarding.approvalDone) return;

          G.rd<RegCubit>().setLoading();

          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => EditBioSheet(),
          );

          G.rd<RegCubit>().setLoading(false);
        },
        isActive: () => true,
        isDone: () => state.onboarding.profileSheetDone,
      ),
      // your menu
      OnboardingStep(
        icon: "menu",
        stepTitle: "Your Menu",
        stepDesc: "Secondly, add your meals on menu and schedule it",
        onTap: () async {
          final regCubit = G.rd<RegCubit>();

          if (regCubit.state.onboarding.stepTwoDone &&
              regCubit.state.onboarding.approvalDone) return;

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
                if (G.rd<MealCubit>().state.pagination.data.isEmpty) {
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
        isActive: () => state.onboarding.mealsActive,
        isDone: () => G.rd<RegCubit>().state.onboarding.mealsDone,
      ),
      // documentation
      OnboardingStep(
        icon: "documentation",
        stepTitle: "Documentation",
        stepDesc: "Third, attach your documents",
        onTap: () async {
          final regCubit = G.rd<RegCubit>();

          if (regCubit.state.onboarding.docsDone &&
              regCubit.state.onboarding.approvalDone) return;

          G.rd<RegCubit>().setLoading();

          await showAlertDialog(
            context: context,
            content: const DocumentationScreen(),
            actions: {
              'Ok': (context) {
                final List<DocInfo> docsInfo =
                    G.isChefApp ? chefDocsInfo : driverDocsInfo;

                final List<String?> notUploadedDocs = docsInfo
                    .filter((t) =>
                        t.getdata(G.rd<ProfileCubit>().state.form) == null)
                    .map((e) => e.title)
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
        isActive: () => state.onboarding.docsActive,
        isDone: () => G.rd<RegCubit>().state.onboarding.docsDone,
      ),
      // get approval
      OnboardingStep(
        icon: "approval",
        stepTitle: "Get Approval",
        stepDesc: "Then, waiting for approval within 72 hours",
        onTap: () async {
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
        isActive: () => state.onboarding.approvalActive,
        isDone: () => G.rd<RegCubit>().state.onboarding.approvalDone,
      ),
      // get contract
      OnboardingStep(
        icon: "contract",
        stepTitle: "Get Contract",
        stepDesc: "Fourth, download the contract to sign and upload it",
        onTap: () async {
          final regCubit = G.rd<RegCubit>();

          if (regCubit.state.onboarding.contractDone &&
              regCubit.state.onboarding.contractApprovalDone) return;

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
        isActive: () => state.onboarding.contractActive,
        isDone: () => G.rd<RegCubit>().state.onboarding.contractDone,
      ),
      // contract approval
      OnboardingStep(
        icon: "approval",
        stepTitle: "Contract Approval",
        stepDesc: "Finally, waiting for approval within 72 hours",
        onTap: () async {
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
        isActive: () => state.onboarding.contractApprovalActive,
        isDone: () => G.rd<RegCubit>().state.onboarding.contractApprovalDone,
      ),
    ];

List<OnboardingStep> driverOnboardingSteps(
  BuildContext context,
  RegState state,
) {
  final chefSteps = chefOnboardingSteps(context, state);

  return [
    // profile
    chefSteps[0],
    // rides
    OnboardingStep(
      icon: "rides",
      stepTitle: "Your Rides",
      stepDesc:
          "Secondly, add your vechile type and schedule your working days",
      onTap: () async {
        final regCubit = G.rd<RegCubit>();

        if (regCubit.state.onboarding.stepTwoDone &&
            regCubit.state.onboarding.approvalDone) return;

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
      isActive: () => state.onboarding.ridesActive,
      isDone: () => G.rd<RegCubit>().state.onboarding.ridesDone,
    ),
    // documentation
    chefSteps[2],
    // get approval
    chefSteps[3],
    // get contract
    chefSteps[4],
    // contract approval
    chefSteps[5],
  ];
}
