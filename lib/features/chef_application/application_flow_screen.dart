import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/features/chef_application/bloc.dart';
import 'package:yumi/features/settings/profile/profile_form.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/menu_template.dart';
import 'package:yumi/template/screen_container.dart';

part "curve.dart";

@RoutePage()
class ChefApplicationFlowScreen extends StatelessWidget {
  const ChefApplicationFlowScreen({super.key});
// double deviceWidth = MediaQuery.of(context).size.width;
// double deviceHeight = MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              // padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      // decoration: BoxDecoration(border: Border.all()),
                      alignment: Alignment.topLeft,
                      child: const Image(
                        image: AssetImage('assets/images/vegies.png'),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            const SizedBox(height: 75),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20),
                // padding: const EdgeInsets.all(10),
                // decoration: BoxDecoration(border: Border.all()),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: BlocBuilder<ChefFlowBloc, ChefFlowState>(
                      builder: (context, state) {
                        return stepStack(context, state.activeIdx);
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

Widget stepStack(BuildContext context, int activeIdx) {
  List stepsInfo = [
    [
      "profile",
      ["Profile", "First, you should complete your profile"],
      () => showAlertDialog(
            context: context,
            title: Container(),
            content: const ProfileForm(),
            // actions: {'Cancel': null},
            actionWidgets: [const ProfileFormSubmitButton()],
          ),
    ],
    [
      "menu",
      ["Your Menu", "Secondly, add your meals on menu and schedule it"],
      () => showAlertDialog(
            context: context,
            title: Container(),
            content: BlocProvider(
              create: (context) => MealListBloc(),
              child: const MenuTemplate(
                menuTarget: MenuTarget.order,
              ),
            ),
            actions: {'Ok': null},
            // onDismissed: () {
            //   context.read<ChefFlowBloc>().add(ChefFlowEventNext(idx: 2));
            // },
          ),
    ],
    [
      "documentation",
      ["Documentation", "Third, attach your documents"],
      () => context.router.push(const DocumentationRoute()),
    ],
    [
      "approval",
      ["Get Approval", "Then, waiting for approval within 72 hours"],
      () => showAlertDialog(
          context: context,
          title: Container(),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(activeIdx == 3
                ? "Waiting for approval within 72 hours..."
                : "Your application has been approved"),
          ),
          actions: {'Ok': null},
          dismissible: true),
    ],
    [
      "contract",
      ["Get Contract", "Finally, download the contract to sign and upload it"],
      () => context.router.push(const ContractRoute()),
    ],
  ];

  Function(int, num, num, {bool alignRight}) stepperFn(
      BoxConstraints constraints) {
    var hs = constraints.maxWidth / 4.9;
    var vs = constraints.maxHeight / 5;
    var iconBuilders = stepsInfo
        .map((info) => (bool alignRight) {
              var items = [
                SizedBox(
                  // height: vs,

                  child: SvgPicture.asset(
                    "assets/images/flow/${info[0]}.svg",
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    crossAxisAlignment: alignRight
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        info[1][0],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          info[1][1],
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )
              ];

              return Container(
                  padding: EdgeInsets.only(
                      left: 4.0,
                      right: 4.0,
                      top: alignRight ? 8 : 0,
                      bottom: alignRight ? 0 : 12),
                  alignment:
                      alignRight ? Alignment.centerRight : Alignment.centerLeft,
                  child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: alignRight
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: alignRight ? items.reversed.toList() : items));
            })
        .toList();

    return (int i, num x, num y, {bool alignRight = false}) {
      var items = iconBuilders[i](alignRight);
      var foregroundDecoration = i > activeIdx
          ? const BoxDecoration(
              color: Colors.grey,
              backgroundBlendMode: BlendMode.saturation,
            )
          : null;

      return Positioned(
        left: !alignRight ? hs * x : 0,
        width: alignRight ? hs * x : null,
        right: alignRight ? null : 0,
        top: vs * y,
        child: Container(
          foregroundDecoration: foregroundDecoration,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => i > activeIdx ? null : stepsInfo[i][2](),
            child: items,
          ),
        ),
      );
    };
  }

  // ColorFiltered
  // colorFilter: const ColorFilter.mode(
  //   Colors.white,
  //   BlendMode.saturation,
  // ),
  // decoration: BoxDecoration(border: Border.all()),
  return LayoutBuilder(
    builder: (context, constraints) {
      var step = stepperFn(constraints);

      return Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: CurvePainter(),
            ),
          ),
          step(0, 0, 0.25),
          step(1, 1, 1.25),
          step(2, 2.83, 2.25, alignRight: true),
          step(3, 3.83, 3.25, alignRight: true),
          step(4, 4.83, 4.25, alignRight: true),
        ],
      );
    },
  );
}

// MultiBlocListener blocListeners() {
//   void next(c, s, i) => c.read<ChefFlowBloc>().add(ChefFlowEventNext(idx: i));

//   return MultiBlocListener(
//     listeners: [
//       BlocListener<ProfileBloc, ProfileState>(
//         listener: (c, s) => s.status.isSuccess ? next(c, s, 1) : null,
//       ),
//       BlocListener<MealListBloc, MealListState>(
//         listener: (c, s) => s.status.isSuccess ? next(c, s, 2) : null,
//       ),
//       BlocListener<MealListBloc, MealListState>(
//         listener: (c, s) => s.status.isSuccess ? next(c, s, 2) : null,
//       ),
//     ],
//     child: const Text(""),
//   );
// }
