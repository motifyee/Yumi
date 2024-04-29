import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/bloc/basket/basket_form_bloc.dart';
import 'package:yumi/bloc/navigator/navigator_bloc.dart';
import 'package:yumi/statics/navigate_option.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/navigation_bottom_bar.dart';
import 'package:yumi/template/screen_container.dart';
import 'package:yumi/template/side_bar.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageController navPageController = PageController(initialPage: 0);
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  bool isInit = false;

  @override
  Widget build(BuildContext context) {
    if (AppTarget.user == AppTargetUser.customers) {
      context.read<BasketFormBloc>().add(BasketFormGetNotFinishedEvent());
    }

    return BlocConsumer<NavigatorBloc, NavigatesState>(
      listener: (context, state) {
        if (state.selectedIndex != navPageController.page) {
          navPageController.jumpToPage(state.selectedIndex);
        }
      },
      builder: (context, state) {
        if (!isInit) {
          isInit = true;
          Timer(Duration(milliseconds: 100), () {
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
              leading: TextButton(
                onPressed: () {
                  _scaffoldState.currentState?.openDrawer();
                },
                child: SvgPicture.asset(
                  'assets/images/side_bar.svg',
                  width: ThemeSelector.statics.iconSizeSmall,
                  height: ThemeSelector.statics.iconSizeSmall,
                ),
              ),
              actions: [
                NavigateOptions.navigateList[state.selectedIndex].pageAction !=
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
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeSelector.statics.defaultBorderRadius,
                  vertical: 0),
              decoration: BoxDecoration(
                  color: ThemeSelector.colors.backgroundTant,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                        ThemeSelector.statics.defaultBorderRadius),
                    topLeft: Radius.circular(
                        ThemeSelector.statics.defaultBorderRadius),
                  )),
              child: NavigationBottomBar(),
            ),
            body: PageView(
              controller: navPageController,
              children: NavigateOptions.navigationPages(),
              onPageChanged: (page) {
                context
                    .read<NavigatorBloc>()
                    .add(NavigatorEvent(selectedIndex: page));
              },
            ),
            drawer: Drawer(
              backgroundColor: ThemeSelector.colors.background,
              surfaceTintColor: Colors.transparent,
              child: SideBar(),
            ),
          ),
        );
      },
    );
  }
}
