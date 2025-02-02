import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yumi/app/pages/auth/registeration/pages/onboarding_screen/onboarding_step.dart';
import 'package:yumi/app/pages/auth/registeration/pages/onboarding_screen/onboarding_steps.dart';
import 'package:yumi/app/pages/auth/registeration/registeration_screen/registeration_screen.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_cubit.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/pages/documentation_screen/cubit/docs_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/cubit/schedule_cubit.dart';
import 'package:yumi/core/resources/app_assets.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';

part 'onboarding_curve.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
// double deviceWidth = MediaQuery.of(context).size.width;
// double deviceHeight = MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    final regCubit = context.read<RegCubit>();
    // if (!regCubit.state.registerationStarted && !regCubit.state.finished) {
    //   context.read<RegCubit>().initReg();
    // }

    context.watch<ProfileCubit>();
    context.watch<RegCubit>();
    if (G().isChefApp) context.watch<MealCubit>();
    context.watch<ScheduleCubit>();
    context.watch<DocsCubit>();

    return PopScope(
      canPop: regCubit.state.partialFlow ? true : false,
      onPopInvoked: (didPop) {
        if (!regCubit.state.partialFlow) askToLogout(context);
      },
      child: ScreenContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                // Onboarding top image

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 250,
                        alignment: Alignment.topLeft,
                        child: Image(
                          image: G().isChefApp
                              ? const AssetImage(AppAssets.vegiesIcon)
                              : const AssetImage(AppAssets.driverFlowIcon),
                        ),
                      ),
                    ),
                    // if (G().isChefApp) Expanded(child: Container()),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Onboarding steps
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Center(
                    child: BlocBuilder<RegCubit, RegState>(
                      builder: (_, state) => _buildOnboardingStackWidget(state),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Next button
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        G().rd<RegCubit>().nextButtonPressed();
                      },
                      onLongPress: () {
                        if (kDebugMode) G().rd<RegCubit>().finish(true);
                      },
                      child: Text(S.of(context).next),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildOnboardingStackWidget(RegState state) {
  // decoration: BoxDecoration(border: Border.all()),
  return LayoutBuilder(
    builder: (context, constraints) {
      final buildTile = _getTileBuilder(constraints);

      final steps = G().isChefApp
          ? chefOnboardingSteps(context, state)
          : driverOnboardingSteps(context, state);

      return Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          // Curve
          Positioned.fill(
            child: CustomPaint(
              painter: CurvePainter(),
            ),
          ),

          // Step Tiles
          buildTile(steps[0], 0, 0.15),
          buildTile(steps[1], 1, 1.15),
          buildTile(steps[2], 2.8, 2.15, alignRight: true),
          buildTile(steps[3], 3.8, 3.15, alignRight: true),
          buildTile(steps[4], 4.8, 4.15, alignRight: true),
          buildTile(steps[5], 5.8, 5.15, alignRight: true),

          // Loading
          if (state.status.isLoading)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(.4),
                      Colors.white.withOpacity(.2),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const SizedBox(
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.amber),
                  ),
                ),
              ),
            ),
        ],
      );
    },
  );
}

Widget Function(
  OnboardingStep step,
  num x,
  num y, {
  bool alignRight,
}) _getTileBuilder(BoxConstraints constraints) {
  final hs = constraints.maxWidth / 6;
  final vs = constraints.maxHeight / 6;

  return (OnboardingStep step, num x, num y, {bool alignRight = false}) {
    final tileChildren = _buildTileChildren(step, alignRight);
    final isActive = step.isActive(); // i > state.activeIdx;

    final foregroundDecoration = isActive
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
          onTap: () => isActive ? step.onTap() : null,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: tileChildren,
          ),
        ),
      ),
    );
  };
  // ColorFiltered
  // colorFilter: const ColorFilter.mode(
  //   Colors.white,
  //   BlendMode.saturation,
  // ),
}

/// returns a function that creates a row of step's children widgets ..
/// (icon + text) (rtl | ltr)
Widget _buildTileChildren(OnboardingStep step, [bool alignRight = false]) {
  final isRightAligned = CommonLocale.isRTL ? !alignRight : alignRight;

  final icon =
      SvgPicture.asset(AppAssets.onboardingStepIcon(step.icon, step.isDone()));

  final title = Text(
    step.stepTitle,
    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
  );

  final description = Text(
    step.stepDesc,
    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
    // overflow: TextOverflow.ellipsis,
  );

  final children = [
    SizedBox(child: icon),
    Flexible(
      fit: FlexFit.loose,
      child: Column(
        crossAxisAlignment:
            isRightAligned ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          FittedBox(child: title),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: description,
          ),
        ],
      ),
    ),
  ];

  return Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment:
        isRightAligned ? MainAxisAlignment.end : MainAxisAlignment.start,
    children: isRightAligned ? children.reversed.toList() : children,
  );
}
