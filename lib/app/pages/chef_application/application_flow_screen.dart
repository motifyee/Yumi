import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/app/pages/driver/driver_reg_cubit.dart';
import 'package:yumi/app/pages/chef_application/documentation/cubit/docs_cubit.dart';
import 'package:yumi/app/pages/chef_application/flow_step_info.dart';
import 'package:yumi/app/pages/schedule/cubit/schedule_cubit.dart';
import 'package:yumi/global.dart';
import 'package:yumi/template/screen_container.dart';

part "curve.dart";

@RoutePage()
class ChefApplicationFlowScreen extends StatelessWidget {
  const ChefApplicationFlowScreen({super.key});
// double deviceWidth = MediaQuery.of(context).size.width;
// double deviceHeight = MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    final regCubit = context.read<RegCubit>();
    if (!regCubit.state.registerationStarted && !regCubit.state.finished) {
      context.read<RegCubit>().init();
    }
    context.watch<ProfileCubit>();
    context.watch<RegCubit>();
    context.watch<MealListBloc>();
    context.watch<ScheduleCubit>();
    context.watch<DocsCubit>();

    return ScreenContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      // decoration: BoxDecoration(border: Border.all()),
                      height: 250,
                      alignment: Alignment.topLeft,
                      child: Image(
                        image: G.isChefApp
                            ? const AssetImage('assets/images/vegies.png')
                            : const AssetImage(
                                'assets/images/flow/driver-flow.png'),
                      ),
                    ),
                  ),
                  if (G.isChefApp) Expanded(child: Container()),
                ],
              ),
            ),
            const SizedBox(height: 75),
            Expanded(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                // padding: const EdgeInsets.all(10),
                // decoration: BoxDecoration(border: Border.all()),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 800,
                      minHeight: 520,
                      minWidth: 400,
                    ),
                    child: BlocBuilder<RegCubit, NRegState>(
                      builder: (context, state) => stepStack(context, state),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      G.rd<RegCubit>().nextButtonPressed();
                    },
                    onLongPress: () {
                      if (kDebugMode) G.rd<RegCubit>().finish();
                    },
                    child: const Text("Next"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget stepStack(BuildContext context, NRegState state) {
  var stepsInfo = G.isChefApp
      ? chefStepsInfo(context, state)
      : driverStepsInfo(context, state);

  var tileChildrenBuilders = stepsInfo.map(tileChildrenFn).toList();

  Function(int, num, num, {bool alignRight}) tileBuilderFn(
      BoxConstraints constraints) {
    var hs = constraints.maxWidth / 4.9;
    var vs = constraints.maxHeight / 5;

    return (int i, num x, num y, {bool alignRight = false}) {
      var items = tileChildrenBuilders[i](alignRight);
      var isActive = stepsInfo[i][3](); // i > state.activeIdx;

      var foregroundDecoration = isActive
          ? null
          : const BoxDecoration(
              color: Colors.grey,
              backgroundBlendMode: BlendMode.saturation,
            );

      return Positioned(
        left: !alignRight ? hs * x : 0,
        width: alignRight ? hs * x + 7 : null,
        right: alignRight ? null : 0,
        top: vs * y,
        child: Container(
          padding: const EdgeInsets.all(4),
          foregroundDecoration: foregroundDecoration,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => isActive ? stepsInfo[i][2]() : null,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: items,
            ),
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
      var step = tileBuilderFn(constraints);

      return Stack(
        fit: StackFit.expand,
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

Function(bool alignRight) tileChildrenFn(info) {
  return (bool alignRight) {
    var tileChildren = [
      SizedBox(
        // height: vs,
        child: SvgPicture.asset(
          "assets/images/flow/${info[0] + (info[4]() ? "-done" : "")}.svg",
        ),
      ),
      Flexible(
        fit: FlexFit.loose,
        child: Column(
          crossAxisAlignment:
              alignRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              info[1][0],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
        // padding: EdgeInsets.only(
        //     left: 4.0,
        //     right: 4.0,
        //     top: alignRight ? 8 : 0,
        //     bottom: alignRight ? 0 : 12),
        // alignment: alignRight ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:
                alignRight ? MainAxisAlignment.end : MainAxisAlignment.start,
            children:
                alignRight ? tileChildren.reversed.toList() : tileChildren));
  };
}
