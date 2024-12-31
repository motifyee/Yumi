import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
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
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/app/pages/menu/widgets/menu_template.dart';

List<OnboardingStep> chefOnboardingSteps(
  BuildContext context,
  RegState state,
) =>
    [
      // profile
      OnboardingStep(
        icon: 'profile',
        stepTitle: S.of(context).profile,
        stepDesc: S.of(context).firstYouShouldCompleteYourProfile,
        onTap: () async {
          final regCubit = G().rd<RegCubit>();

          if (regCubit.state.onboarding.profileSheetDone &&
              regCubit.state.onboarding.approvalDone) return;

          G().rd<RegCubit>().setStatus(Status.loading);

          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => EditBioSheet(),
          );

          G().rd<RegCubit>().setStatus(Status.idle);
        },
        isActive: () => true,
        isDone: () => state.onboarding.profileSheetDone,
      ),
      // your menu
      OnboardingStep(
        icon: 'menu',
        stepTitle: S.of(context).yourMenu,
        stepDesc: S.of(context).secondlyAddYourMealsOnMenuAndScheduleIt,
        onTap: () async {
          final regCubit = G().rd<RegCubit>();

          if (regCubit.state.onboarding.stepTwoDone &&
              regCubit.state.onboarding.approvalDone) return;

          G().rd<ScheduleCubit>().loadSchedule();

          G().rd<RegCubit>().setStatus(Status.loading);

          await showAlertDialog(
            context: context,
            // title: Container(),
            content: const MenuTemplate(
              menuTarget: OrderType.order,
            ),
            actions: {
              S.of(context).next: (ctx) {
                if (G().rd<MealCubit>().state.pagination.data.isEmpty) {
                  return addYourMealsDialog(context);
                }
                G().pop();
                return sheduleDialog(context);

                // Navigator.of(context, rootNavigator: true).pop();
              },
            },
            insetPadding: 0,
          );

          G().rd<RegCubit>().setStatus(Status.idle);
        },
        isActive: () => state.onboarding.mealsActive,
        isDone: () => G().rd<RegCubit>().state.onboarding.mealsDone,
      ),
      // documentation
      OnboardingStep(
        icon: 'documentation',
        stepTitle: S.of(context).documentation,
        stepDesc: S.of(context).thirdAttachYourDocuments,
        onTap: () async {
          final regCubit = G().rd<RegCubit>();

          if (regCubit.state.onboarding.docsDone &&
              regCubit.state.onboarding.approvalDone) return;

          G().rd<RegCubit>().setStatus(Status.loading);

          await showAlertDialog(
            context: context,
            content: const DocumentationScreen(),
            actions: {
              S.of(context).ok: (context) {
                final List<DocInfo> docsInfo =
                    G().isChefApp ? chefDocsInfo : driverDocsInfo;

                final List<String?> notUploadedDocs = docsInfo
                    .filter(
                      (t) =>
                          t.getdata(G().rd<ProfileCubit>().state.form) == null,
                    )
                    .map((e) => e.title)
                    .toList();

                if (notUploadedDocs.isEmpty) return G().pop();

                showAlertDialog(
                  context: context,
                  actions: {S.of(context).ok: null},
                  content: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Text(
                      '${S.of(context).youHaveNotUploadedTheFollowingDocuments}: \n\n${notUploadedDocs.join('\n')}',
                    ),
                  ),
                );
              },
            },
            insetPadding: 0,
          );

          G().rd<RegCubit>().setStatus(Status.idle);
        },
        isActive: () => state.onboarding.docsActive,
        isDone: () => G().rd<RegCubit>().state.onboarding.docsDone,
      ),
      // get approval
      OnboardingStep(
        icon: 'approval',
        stepTitle: S.of(context).getApproval,
        stepDesc: S.of(context).thenWaitingForApprovalWithin72Hours,
        onTap: () async {
          G().rd<RegCubit>().setStatus(Status.loading);

          await context
              .read<ProfileCubit>()
              .getProfileForm()
              .then((value) async {
            await showAlertDialog(
              context: context,
              title: Container(),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  !state.onboarding.approvalDone
                      ? S.of(context).waitingforapprovalWithin72Hours
                      : S.of(context).yourApplicationHasBeenApproved,
                ),
              ),
              actions: {S.of(context).ok: null},
              dismissible: true,
            );

            G().rd<RegCubit>().setStatus(Status.idle);
          });
        },
        isActive: () => state.onboarding.approvalActive,
        isDone: () => G().rd<RegCubit>().state.onboarding.approvalDone,
      ),
      // get contract
      OnboardingStep(
        icon: 'contract',
        stepTitle: S.of(context).getContract,
        stepDesc: S.of(context).fourthDownloadTheContractToSignAndUploadIt,
        onTap: () async {
          final regCubit = G().rd<RegCubit>();

          if (regCubit.state.onboarding.contractDone &&
              regCubit.state.onboarding.contractApprovalDone) return;

          G().rd<RegCubit>().setStatus(Status.loading);

          await showAlertDialog(
            context: context,
            content: const ContractScreen(),
            insetPadding: 0,
            actions: {
              S.of(context).ok: (ctx) {
                final photo = G().rd<ProfileCubit>().state.form.contractPhoto;
                if (photo?.isEmpty ?? true) return;

                G().pop();
              },
            },
          );

          G().rd<RegCubit>().setStatus(Status.idle);
        },
        isActive: () => state.onboarding.contractActive,
        isDone: () => G().rd<RegCubit>().state.onboarding.contractDone,
      ),
      // contract approval
      OnboardingStep(
        icon: 'approval',
        stepTitle: S.of(context).contractApproval,
        stepDesc: S.of(context).finallyWaitingForApprovalWithin72Hours,
        onTap: () async {
          G().rd<RegCubit>().setStatus(Status.loading);

          await context.read<ProfileCubit>().getProfileForm().then((value) {
            showAlertDialog(
              context: context,
              title: Container(),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  !state.onboarding.contractApprovalDone
                      ? S.of(context).waitingforapprovalWithin72Hours
                      : S.of(context).yourContractHasBeenApproved,
                ),
              ),
              actions: {S.of(context).ok: null},
              dismissible: true,
            );
          });

          G().rd<RegCubit>().setStatus(Status.idle);
        },
        isActive: () => state.onboarding.contractApprovalActive,
        isDone: () => G().rd<RegCubit>().state.onboarding.contractApprovalDone,
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
      icon: 'rides',
      stepTitle: S.of(context).yourRides,
      stepDesc:
          S.of(context).secondlyAddYourVechileTypeAndScheduleYourWorkingDays,
      onTap: () async {
        final regCubit = G().rd<RegCubit>();

        if (regCubit.state.onboarding.stepTwoDone &&
            regCubit.state.onboarding.approvalDone) return;

        G().rd<RegCubit>().setStatus(Status.loading);

        G().rd<ScheduleCubit>().loadSchedule();
        await showAlertDialog(
          context: context,
          content: const RidesScreen(),
          actions: {
            S.of(context).save: (ctx) async {
              // if (G.cread<RegCubit>().state.vehicleType?.isEmpty ?? true) {
              final regCubit = G().rd<RegCubit>();

              if ((regCubit.state.vehicle.vehicleName()?.length ?? 0) < 3) {
                return addYourVehicleDialog(context, firstTime: false);
              }

              regCubit.state.canAddVehicle.then((value) async {
                if (!value) {
                  G().pop();
                  return sheduleDialog(context);
                }

                final task = await regCubit.saveVehicleType();
                task.fold(
                  (l) {
                    G().snackBar(l.toString());

                    G().pop();
                    sheduleDialog(context);
                  },
                  (r) {
                    G().pop();
                    sheduleDialog(context);
                  },
                );
              });
            },
          },
          insetPadding: 0,
        );

        G().rd<RegCubit>().setStatus(Status.idle);
      },
      isActive: () => state.onboarding.ridesActive,
      isDone: () => G().rd<RegCubit>().state.onboarding.ridesDone,
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
