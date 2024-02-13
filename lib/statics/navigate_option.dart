import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/screens/menu.dart';
import 'package:yumi/screens/news.dart';
import 'package:yumi/screens/pre_order.dart';
import 'package:yumi/screens/profile.dart';
import 'package:yumi/screens/setting.dart';

class NavigateOptions {
  static List<NavigateListItem> navigateList = [
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/home.svg'),
        title: S.current.yumi,
        page: News()),
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/profile.svg'),
        title: S.current.yumi,
        page: Profile()),
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/menu.svg'),
        title: S.current.yumi,
        page: Menu()),
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/pre_order.svg'),
        title: S.current.yumi,
        page: PreOrder()),
    NavigateListItem(
        icon: SvgPicture.asset('assets/images/setting.svg'),
        title: S.current.yumi,
        page: Setting()),
  ];

  static List<Widget> navigationDestination() {
    return navigateList
        .map((e) => NavigationDestination(icon: e.icon, label: ''))
        .toList();
  }
}

class NavigateListItem {
  Widget icon;
  Widget page;
  String title;

  NavigateListItem(
      {required this.title, required this.page, required this.icon});
}
