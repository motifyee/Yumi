import 'dart:math';

import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/home/cubit/navigator_cubit.dart';

import 'package:yumi/statics/navigate_option.dart';

class NavigationBottomBar extends StatelessWidget {
  const NavigationBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigatorCubit, NavigatorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        double selectedPageIndicator = (MediaQuery.of(context).size.width - (CommonDimens.defaultBorderRadius * 2)) / 5;
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: CommonDimens.animationDuration,
              top: 0,
              left: selectedPageIndicator * state.selectedIndex,
              child: SizedBox(
                width: selectedPageIndicator,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/menu_back_icon.svg',
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                    Positioned(
                      top: -8,
                      child: Container(
                        width: min(45, selectedPageIndicator - 30),
                        height: min(45, selectedPageIndicator - 30),
                        decoration: BoxDecoration(
                          color: CommonColors.primary,
                          borderRadius: BorderRadius.circular(CommonDimens.buttonBorderRadius),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            NavigationBar(
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              overlayColor: WidgetStateProperty.resolveWith(
                (states) => Colors.transparent,
              ),
              animationDuration: CommonDimens.animationDuration,
              destinations: NavigateOptions.navigationDestination(context, state.selectedIndex, selectedPageIndicator),
              selectedIndex: state.selectedIndex,
              onDestinationSelected: (index) {
                context.read<NavigatorCubit>().navigate(selectedIndex: index);
              },
            )
          ],
        );
      },
    );
  }
}
