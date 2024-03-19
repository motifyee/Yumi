import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/navigator/navigator_bloc.dart';
import 'package:yumi/statics/navigate_option.dart';
import 'package:yumi/statics/theme_statics.dart';

class NavigationBottomBar extends StatelessWidget {
  NavigationBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigatorBloc, NavigatesState>(
      listener: (context, state) {},
      builder: (context, state) {
        double selectedPageIndicator = (MediaQuery.of(context).size.width -
                (ThemeSelector.statics.defaultBorderRadius * 2)) /
            5;
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: ThemeSelector.statics.animationDuration,
              top: 0,
              left: selectedPageIndicator * state.selectedIndex,
              child: Container(
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
                          color: ThemeSelector.colors.primary,
                          borderRadius: BorderRadius.circular(
                              ThemeSelector.statics.buttonBorderRadius),
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
              overlayColor: MaterialStateProperty.resolveWith(
                (states) => Colors.transparent,
              ),
              animationDuration: ThemeSelector.statics.animationDuration,
              destinations: NavigateOptions.navigationDestination(
                  context, state.selectedIndex, selectedPageIndicator),
              selectedIndex: state.selectedIndex,
              onDestinationSelected: (index) {
                context
                    .read<NavigatorBloc>()
                    .add(NavigatorEvent(selectedIndex: index));
              },
            )
          ],
        );
      },
    );
  }
}
