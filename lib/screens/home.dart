import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/navigator/navigator_bloc.dart';
import 'package:yumi/statics/navigate_option.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/screen_container.dart';
import 'package:yumi/template/side_bar.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageController navPageController = PageController(initialPage: 0);
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigatorBloc, NavigatesState>(
      listener: (context, state) {
        if (state.selectedIndex != navPageController.page) {
          navPageController.jumpToPage(state.selectedIndex);
        }
      },
      builder: (context, state) {
        return ScreenContainer(
          isColored: state.selectedIndex == 1,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            key: _scaffoldState,
            appBar: AppBar(
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
                TextButton(
                  onPressed: () {},
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset(
                        'assets/images/notification.svg',
                        height: ThemeSelector.statics.iconSizeSmall,
                        width: ThemeSelector.statics.iconSizeSmall,
                      ),
                      Positioned(
                        bottom: 0,
                        right: -5,
                        child: Container(
                          width: 15,
                          height: 15,
                          padding: const EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: ThemeSelector.colors.primary,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                  color: ThemeSelector.colors.onPrimary,
                                  fontSize: ThemeSelector.fonts.font_9),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              title: Center(
                child: Text(
                  NavigateOptions.navigateList[state.selectedIndex].title,
                  style: TextStyle(
                    color: ThemeSelector.colors.primary,
                    fontSize: ThemeSelector.fonts.font_14,
                  ),
                ),
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
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  AnimatedPositioned(
                    duration: ThemeSelector.statics.animationDuration,
                    top: 0,
                    left: (((MediaQuery.of(context).size.width -
                                    (ThemeSelector.statics.defaultBorderRadius *
                                        2)) /
                                5) *
                            state.selectedIndex) -
                        10,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset('assets/images/menu_back_icon.svg'),
                        Positioned(
                          top: -8,
                          child: Container(
                            width: 45,
                            height: 45,
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
                  NavigationBar(
                    labelBehavior:
                        NavigationDestinationLabelBehavior.alwaysHide,
                    backgroundColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.transparent),
                    animationDuration: ThemeSelector.statics.animationDuration,
                    destinations: NavigateOptions.navigationDestination(
                        context, state.selectedIndex),
                    selectedIndex: state.selectedIndex,
                    onDestinationSelected: (index) {
                      context
                          .read<NavigatorBloc>()
                          .add(NavigatorEvent(selectedIndex: index));
                    },
                  )
                ],
              ),
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
              child: SideBar(),
            ),
          ),
        );
      },
    );
  }
}
