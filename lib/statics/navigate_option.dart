import 'dart:math';

import 'package:common_code/common_code.dart';
import 'package:common_code/core/setup/signalr.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/pages/menu/chef/menu.dart';
import 'package:yumi/app/pages/notification/cubit/notification_cubit.dart';
import 'package:yumi/app/pages/notification/notification_screen.dart';
import 'package:yumi/app/pages/order/chef/news.dart';
import 'package:yumi/app/pages/order/chef/pre_order.dart';
import 'package:yumi/app/pages/order/customer/customer_order.dart';
import 'package:yumi/app/pages/order/driver/driver_order.dart';
import 'package:yumi/app/pages/profile/profile_screen.dart';
import 'package:yumi/app/pages/settings/settings_screen.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/routes/routes.gr.dart';
import 'package:yumi/app/pages/menu/customer/customer_menu_pre.dart';
import 'package:yumi/app/pages/menu/customer/cutomer_menu.dart';
import 'package:yumi/app/pages/menu/customer/favorites.dart';
import 'package:yumi/app/pages/order/driver/driver_history.dart';

class NavigateOptions {
  static List<NavigateListItem> navigateList = getNavigateList();

  static List<NavigateListItem> getNavigateList() {
    if (AppTarget.user == YumiApp.chefs) return navigateListChefs;
    if (AppTarget.user == YumiApp.drivers) return navigateListDrivers;
    return navigateListCustomer;
  }

  static List<NavigateListItem> navigateListChefs = [
    NavigateListItem(
      icon: SvgPicture.asset('assets/images/home.svg'),
      selectedIcon:
          SvgPicture.asset('assets/images/home1.svg', fit: BoxFit.fitWidth),
      title: S.current.yumi,
      page: NewsScreen(),
      pageAction: const _ChefAction(),
    ),
    NavigateListItem(
      icon: SvgPicture.asset('assets/images/profile.svg'),
      selectedIcon:
          SvgPicture.asset('assets/images/profile1.svg', fit: BoxFit.fitWidth),
      title: S.current.profile,
      page: const ProfileScreen(),
      isBackGroundGradient: true,
      pageAction: const _ChefAction(),
    ),
    NavigateListItem(
      icon: SvgPicture.asset('assets/images/menu.svg'),
      selectedIcon:
          SvgPicture.asset('assets/images/menu1.svg', fit: BoxFit.fitWidth),
      title: S.current.menus,
      page: const MenuScreen(),
      pageAction: const _ChefAction(),
    ),
    NavigateListItem(
      icon: SvgPicture.asset('assets/images/pre_order.svg'),
      selectedIcon: SvgPicture.asset('assets/images/pre_order1.svg',
          fit: BoxFit.fitWidth),
      title: S.current.preOrder,
      page: PreOrderScreen(),
      pageAction: const _ChefAction(),
    ),
    NavigateListItem(
      icon: SvgPicture.asset('assets/images/setting.svg'),
      selectedIcon:
          SvgPicture.asset('assets/images/setting1.svg', fit: BoxFit.fitWidth),
      title: S.current.settings,
      page: const SettingsScreen(),
      pageAction: const _ChefAction(),
    ),
  ];
  static List<NavigateListItem> navigateListDrivers = [
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/home.svg'),
        selectedIcon:
            SvgPicture.asset('assets/images/home1.svg', fit: BoxFit.fitWidth),
        title: S.current.yumi,
        page: DriverOrderScreen(
          menuTarget: MenuTarget.order,
        )),
    NavigateListItem(
      icon: SvgPicture.asset('assets/images/profile.svg'),
      selectedIcon:
          SvgPicture.asset('assets/images/profile1.svg', fit: BoxFit.fitWidth),
      title: S.current.profile,
      page: const ProfileScreen(),
      isBackGroundGradient: true,
    ),
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/history.svg'),
        selectedIcon: SvgPicture.asset('assets/images/history1.svg',
            fit: BoxFit.fitWidth),
        title: S.current.history,
        page: DriverHistoryScreen()),
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/pre_order.svg'),
        selectedIcon: SvgPicture.asset('assets/images/pre_order1.svg',
            fit: BoxFit.fitWidth),
        title: S.current.preOrder,
        page: DriverOrderScreen(
          menuTarget: MenuTarget.preOrder,
        )),
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/setting.svg'),
        selectedIcon: SvgPicture.asset('assets/images/setting1.svg',
            fit: BoxFit.fitWidth),
        title: S.current.settings,
        page: const SettingsScreen()),
  ];
  static List<NavigateListItem> navigateListCustomer = [
    NavigateListItem(
      icon: SvgPicture.asset('assets/images/home.svg'),
      selectedIcon:
          SvgPicture.asset('assets/images/home1.svg', fit: BoxFit.fitWidth),
      title: S.current.menus,
      page: const CustomerMenuScreen(),
    ),
    NavigateListItem(
      icon: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          return Stack(clipBehavior: Clip.none, children: [
            SvgPicture.asset('assets/images/bell.svg'),
            Positioned(
              bottom: 0,
              right: -5,
              child: BlocBuilder<NotificationCubit, NotificationState>(
                builder: (context, state) {
                  return Container(
                    width: CommonDimens.defaultInputGap,
                    height: CommonDimens.defaultInputGap,
                    decoration: BoxDecoration(
                        color: state.isNewNotification
                            ? CommonColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          CommonDimens.defaultInputGap,
                        )),
                  );
                },
              ),
            )
          ]);
        },
      ),
      selectedIcon:
          SvgPicture.asset('assets/images/bell1.svg', fit: BoxFit.fitWidth),
      title: S.current.notification,
      page: const NotificationScreen(isScreen: true),
    ),
    NavigateListItem(
      icon: SvgPicture.asset('assets/images/heart.svg'),
      selectedIcon:
          SvgPicture.asset('assets/images/heart1.svg', fit: BoxFit.fitWidth),
      title: S.current.favorites,
      page: FavoritesScreen(),
    ),
    NavigateListItem(
      icon: SvgPicture.asset('assets/images/bag.svg'),
      selectedIcon:
          SvgPicture.asset('assets/images/bag1.svg', fit: BoxFit.fitWidth),
      title: S.current.myOrders,
      page: MyOrdersScreen(),
      pageAction: const _CustomerAction(),
    ),
    NavigateListItem(
      icon: SvgPicture.asset('assets/images/featured.svg'),
      selectedIcon:
          SvgPicture.asset('assets/images/featured1.svg', fit: BoxFit.fitWidth),
      title: S.current.preOrder,
      page: const CustomerMenuPreScreen(),
    ),
  ];

  static List<Widget> navigationDestination(
      BuildContext context, int index, double navWidth) {
    return navigateList
        .asMap()
        .map((i, e) => MapEntry(
              i,
              NavigationDestination(
                icon: AnimatedAlign(
                  duration: CommonDimens.animationDuration,
                  alignment:
                      index == i ? Alignment.topCenter : Alignment.center,
                  child: index == i
                      ? SizedBox(
                          width: min(23, max(23, navWidth - 45)),
                          height: min(23, max(23, navWidth - 45)),
                          child: e.selectedIcon,
                        )
                      : e.icon,
                ),
                label: '',
              ),
            ))
        .values
        .toList();
  }

  static List<Widget> navigationPages() {
    return navigateList.map((e) => e.page).toList();
  }
}

class NavigateListItem {
  Widget icon;
  Widget selectedIcon;
  Widget page;
  Widget? pageAction;
  String title;
  bool isBackGroundGradient;

  NavigateListItem({
    required this.title,
    required this.page,
    required this.icon,
    required this.selectedIcon,
    this.pageAction,
    this.isBackGroundGradient = false,
  });
}

class _CustomerAction extends StatelessWidget {
  const _CustomerAction();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        G().router.push(MyOrdersRoute(isHistory: true));
      },
      child: BlocBuilder<SignalRCubit, SignalRState>(
        builder: (context, state) {
          return Stack(
            children: [
              SvgPicture.asset(
                'assets/images/history.svg',
                height: CommonDimens.iconSizeDefault,
                width: CommonDimens.iconSizeDefault,
              ),
              if (state.isSignalTriggered(signal: [
                    Signal.clientreceived,
                    Signal.chefcancel,
                  ], isPreOrder: false) ||
                  state.isSignalTriggered(signal: [
                    Signal.clientreceived,
                    Signal.chefcancel,
                  ], isPreOrder: true))
                Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: CommonDimens.defaultInputGap,
                      height: CommonDimens.defaultInputGap,
                      decoration: BoxDecoration(
                          color: CommonColors.primary,
                          borderRadius: BorderRadius.circular(
                              CommonDimens.defaultInputGap)),
                    ))
            ],
          );
        },
      ),
    );
  }
}

class _ChefAction extends StatelessWidget {
  const _ChefAction();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        G().router.push(NotificationRoute(isScreen: false));
      },
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(
                'assets/images/notification.svg',
                height: CommonDimens.iconSizeSmall,
                width: CommonDimens.iconSizeSmall,
              ),
              if (state.isNewNotification)
                Positioned(
                  bottom: 0,
                  right: -5,
                  child: Container(
                    width: CommonDimens.defaultInputGap,
                    height: CommonDimens.defaultInputGap,
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: CommonColors.primary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
