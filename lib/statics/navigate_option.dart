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
        selectedIcon: SvgPicture.asset('assets/images/home1.svg'),
        title: S.current.yumi,
        page: News()),
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/profile.svg'),
        selectedIcon: SvgPicture.asset('assets/images/profile1.svg'),
        title: S.current.yumi,
        page: const Profile()),
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/menu.svg'),
        selectedIcon: SvgPicture.asset('assets/images/menu1.svg'),
        title: S.current.yumi,
        page: const Menu()),
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/pre_order.svg'),
        selectedIcon: SvgPicture.asset('assets/images/pre_order1.svg'),
        title: S.current.yumi,
        page: const PreOrder()),
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/setting.svg'),
        selectedIcon: SvgPicture.asset('assets/images/setting1.svg'),
        title: S.current.yumi,
        page: const Setting()),
  ];

  static List<Widget> navigationDestination(BuildContext context, int index) {
    return navigateList
        .asMap()
        .map((i, e) => MapEntry(
              i,
              NavigationDestination(
                icon: AnimatedContainer(
                  duration: ThemeSelector.statics.animationDuration,
                  padding: index == i
                      ? EdgeInsets.only(bottom: 55)
                      : EdgeInsets.zero,
                  child: index == i ? e.selectedIcon : e.icon,
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
  String title;

  NavigateListItem(
      {required this.title,
      required this.page,
      required this.icon,
      required this.selectedIcon});
}
