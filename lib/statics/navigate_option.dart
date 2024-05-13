import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/notification/notification.dart';
import 'package:yumi/app/pages/settings/profile/profile_screen.dart';
import 'package:yumi/app/pages/settings/settings_screen.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/screens/chef/menu.dart';
import 'package:yumi/screens/chef/news.dart';
import 'package:yumi/screens/chef/pre_order.dart';
import 'package:yumi/screens/customer/customer_menu_pre.dart';
import 'package:yumi/screens/customer/cutomer_menu.dart';
import 'package:yumi/screens/customer/favorites.dart';
import 'package:yumi/screens/customer/my_order.dart';
import 'package:yumi/screens/driver/chef_history.dart';
import 'package:yumi/screens/driver/driver_order.dart';
import 'package:yumi/statics/theme_statics.dart';

class NavigateOptions {
  static List<NavigateListItem> navigateList = getNavigateList();

  static List<NavigateListItem> getNavigateList() {
    if (AppTarget.user == AppTargetUser.chefs) return navigateListChefs;
    if (AppTarget.user == AppTargetUser.drivers) return navigateListDrivers;
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
      title: S.current.setting,
      page: const SettingScreen(),
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
        title: S.current.setting,
        page: const SettingScreen()),
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
      icon: SvgPicture.asset('assets/images/bell.svg'),
      selectedIcon:
          SvgPicture.asset('assets/images/bell1.svg', fit: BoxFit.fitWidth),
      title: S.current.notification,
      page: const NotificationScreen(),
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
                  duration: ThemeSelector.statics.animationDuration,
                  alignment:
                      index == i ? Alignment.topCenter : Alignment.center,
                  child: index == i
                      ? SizedBox(
                          width: min(23, navWidth - 45),
                          height: min(23, navWidth - 45),
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
  const _CustomerAction({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        G.context.router.push(MyOrdersRoute(isHistory: true));
      },
      child: SvgPicture.asset(
        'assets/images/history.svg',
        height: ThemeSelector.statics.iconSizeDefault,
        width: ThemeSelector.statics.iconSizeDefault,
      ),
    );
  }
}

class _ChefAction extends StatelessWidget {
  const _ChefAction({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        G.context.router.push(const NotificationRoute());
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(
            'assets/images/notification.svg',
            height: ThemeSelector.statics.iconSizeSmall,
            width: ThemeSelector.statics.iconSizeSmall,
          ),
          if (false)
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
                    style: Theme.of(G.context).textTheme.displaySmall?.copyWith(
                          fontSize: ThemeSelector.fonts.font_9,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
