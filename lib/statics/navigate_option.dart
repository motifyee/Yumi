import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/screens/menu.dart';
import 'package:yumi/screens/news.dart';
import 'package:yumi/screens/pre_order.dart';
import 'package:yumi/screens/profile.dart';
import 'package:yumi/screens/setting.dart';
import 'package:yumi/statics/theme_statics.dart';

class NavigateOptions {
  static List<NavigateListItem> navigateList = [
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/home.svg'),
        selectedIcon: SvgPicture.asset('assets/images/home_white.svg'),
        title: S.current.yumi,
        page: const News()),
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/profile.svg'),
        selectedIcon: SvgPicture.asset('assets/images/profile_white.svg'),
        title: S.current.yumi,
        page: const Profile()),
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/menu.svg'),
        selectedIcon: SvgPicture.asset('assets/images/menu.svg'),
        title: S.current.yumi,
        page: const Menu()),
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/pre_order.svg'),
        selectedIcon: SvgPicture.asset('assets/images/pre_order.svg'),
        title: S.current.yumi,
        page: const PreOrder()),
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/setting.svg'),
        selectedIcon: SvgPicture.asset('assets/images/setting.svg'),
        title: S.current.yumi,
        page: const Setting()),
  ];

  static List<Widget> navigationDestination(BuildContext context) {
    return navigateList
        .map((e) => NavigationDestination(
            icon: e.icon,
            label: '',
            selectedIcon: AnimatedPositioned(
              duration: ThemeStatics.animationDuration,
              child: Container(
                padding: EdgeInsets.only(bottom: 15),
                child: Container(
                  width: 50,
                  height: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius:
                        BorderRadius.circular(ThemeStatics.buttonBorderRadius),
                  ),
                  child: Center(
                    child: e.selectedIcon,
                  ),
                ),
              ),
            )))
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
  String title;

  NavigateListItem(
      {required this.title,
      required this.page,
      required this.icon,
      required this.selectedIcon});
}
