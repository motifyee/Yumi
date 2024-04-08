import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/driver/driver_reg_cubit.dart';
import 'package:yumi/driver/rides_screen.dart';
import 'package:yumi/features/chef_application/bloc.dart';
import 'package:yumi/features/chef_application/contract/contract_screen.dart';
import 'package:yumi/features/chef_application/documentation/documentation_screen.dart';
import 'package:yumi/features/schedule/bloc/schedule_bloc.dart';
import 'package:yumi/features/schedule/schedule_screen.dart';
import 'package:yumi/features/settings/profile/bio_sheet.dart';
import 'package:yumi/features/settings/profile/bloc/profile_bloc.dart';
import 'package:yumi/features/settings/profile/model/profile_model.dart';
import 'package:yumi/global.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/route/route.gr.dart';
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
          G.read<ScheduleBloc>().add(const ScheduleEvent.init());
          // context.read<MealListBloc>().add(
          //       MealListUpdateEvent(
          //         context: context,
          //         chefId: context.read<UserBloc>().state.user.chefId,
          //       ),
          //     );

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
        () => G.router.push(const DocumentationRoute()),
        () => state.onboarding.docsActive,
      ],
      [
        "approval",
        ["Get Approval", "Then, waiting for approval within 72 hours"],
        () => showAlertDialog(
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
            ),
        () => state.onboarding.approvalActive,
      ],
      [
        "contract",
        [
          "Get Contract",
          "Finally, download the contract to sign and upload it"
        ],
        () => G.router.push(const ContractRoute()),
        () => state.onboarding.contractActive,
      ],
    ];

List driverStepsInfo(BuildContext context, NRegState state) => [
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
        "rides",
        [
          "Your Rides",
          "Secondly, add your vechile type and schedule your working days"
        ],
        () {
          G.read<ScheduleBloc>().add(const ScheduleEvent.init());
          showAlertDialog(
            context: context,
            content: const RidesScreen(),
            actions: {
              'Save': (ctx) async {
                // if (G.cread<RegCubit>().state.vehicleType?.isEmpty ?? true) {
                var regCubit = G.rd<RegCubit>();

                if (regCubit.state.vehicle.vehicleName()?.isEmpty ?? true) {
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
        () => showAlertDialog(
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
            ),
        () => state.onboarding.approvalActive,
      ],
      [
        "contract",
        [
          "Get Contract",
          "Finally, download the contract to sign and upload it"
        ],
        () => showAlertDialog(
                context: context,
                content: const ContractScreen(),
                insetPadding: 0,
                actions: {
                  'Ok': (ctx) {
                    var photo =
                        G.read<ProfileBloc>().state.profile.contractPhoto;
                    if (photo?.isEmpty ?? true) return;

                    G.pop();
                  },
                }),
        () => state.onboarding.contractActive,
      ],
    ];
