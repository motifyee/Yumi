import 'dart:async';

import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:yumi/app/pages/home/cubit/navigator_cubit.dart';
import 'package:yumi/app/pages/home/widget/side_bar_button.dart';
import 'package:yumi/statics/navigate_option.dart';
import 'package:yumi/app/pages/home/widget/navigation_bottom_bar.dart';
import 'package:yumi/app/pages/home/widget/side_bar.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageController navPageController = PageController(initialPage: 0);
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    bool isInit = false;

    return Builder(builder: (context) {
      return BlocConsumer<NavigatorCubit, NavigatorStates>(
        listener: (context, state) {
          if (state.selectedIndex != navPageController.page) {
            navPageController.jumpToPage(state.selectedIndex);
          }
        },
        builder: (context, state) {
          if (!isInit) {
            isInit = true;
            Timer(const Duration(milliseconds: 100), () {
              navPageController.jumpToPage(state.selectedIndex);
            });
          }
          return ScreenContainer(
            isColored: NavigateOptions
                    .navigateList[state.selectedIndex].isBackGroundGradient ??
                false,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              key: _scaffoldState,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                bottomOpacity: 0,
                scrolledUnderElevation: 0,
                leading: SideBarButton(
                  onPressed: () {
                    _scaffoldState.currentState?.openDrawer();
                  },
                ),
                actions: [
                  NavigateOptions
                              .navigateList[state.selectedIndex].pageAction !=
                          null
                      ? NavigateOptions
                          .navigateList[state.selectedIndex].pageAction!
                      : const SizedBox(
                          width: 1,
                        ),
                ],
                title: Text(
                  NavigateOptions.navigateList[state.selectedIndex].title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              bottomNavigationBar: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                    horizontal: CommonDimens.defaultBorderRadius, vertical: 0),
                decoration: BoxDecoration(
                    color: CommonColors.backgroundTant,
                    borderRadius: const BorderRadius.only(
                      topRight:
                          Radius.circular(CommonDimens.defaultBorderRadius),
                      topLeft:
                          Radius.circular(CommonDimens.defaultBorderRadius),
                    )),
                child: const NavigationBottomBar(),
              ),
              body: PageView(
                controller: navPageController,
                children: NavigateOptions.navigationPages(),
                onPageChanged: (page) {
                  context.read<NavigatorCubit>().navigate(selectedIndex: page);
                },
              ),
              drawer: Drawer(
                backgroundColor: CommonColors.background,
                surfaceTintColor: Colors.transparent,
                child: const SideBar(),
              ),
            ),
          );
        },
      );
    });
  }
}
