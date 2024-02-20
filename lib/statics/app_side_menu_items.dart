import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/navigator/navigator_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/menu_button.dart';

class AppMenuList {
  static List<AppMenuItem> appList(BuildContext context) {
    return [
      AppMenuItem(
        icon: 'assets/images/notification_menu.svg',
        label: S.of(context).notification,
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
          context.router.push(NotificationRoute());
        },
      ),
      AppMenuItem(
        icon: 'assets/images/schedule_menu.svg',
        label: S.of(context).mySchedule,
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
          context.router.push(MyScheduleRoute());
        },
      ),
      AppMenuItem(
        icon: 'assets/images/menus_menu.svg',
        label: S.of(context).menus,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Center(
              child: DialogContainer(
                child: BlocConsumer<NavigatorBloc, NavigatesState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return FractionallySizedBox(
                      widthFactor: .85,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: ThemeSelector.statics.defaultGap,
                            horizontal: ThemeSelector.statics.defaultGap),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MenuButton(
                                menuItem: AppMenuItem(
                                    icon: 'assets/images/menus_order_menu.svg',
                                    label: S.of(context).menuOrders,
                                    onPressed: () {
                                      context.read<NavigatorBloc>().add(
                                          NavigatorEvent(selectedIndex: 2));
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                    })),
                            MenuButton(
                                menuItem: AppMenuItem(
                                    icon:
                                        'assets/images/menus_pre_order_menu.svg',
                                    label: S.of(context).menuPreOrders,
                                    onPressed: () {
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                      Navigator.of(context, rootNavigator: true)
                                          .pop();
                                      context.router.push(MenuPreOrderRoute());
                                    })),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
          // context.read<NavigatorBloc>().add(NavigatorEvent(selectedIndex: 2));
          // context.router.pop();
        },
      ),
      AppMenuItem(
        icon: 'assets/images/calories_menu.svg',
        label: S.of(context).caloriesReference,
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
          context.router.push(CaloriesReferenceRoute());
        },
      ),
      AppMenuItem(
        icon: 'assets/images/documentation_menu.svg',
        label: S.of(context).documentation,
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
          context.router.push(DocumentationRoute());
        },
      ),
      AppMenuItem(
        icon: 'assets/images/performance_menu.svg',
        label: S.of(context).performanceAnalysis,
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
          context.router.push(PerformanceAnalysisRoute());
        },
      ),
      AppMenuItem(
        icon: 'assets/images/financial_menu.svg',
        label: S.of(context).financialView,
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
          context.router.push(FinancialViewRoute());
        },
      ),
      AppMenuItem(
        icon: 'assets/images/get_help_menu.svg',
        label: S.of(context).getHelp,
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
          context.router.push(ChatRoute());
        },
      ),
      AppMenuItem(
        icon: 'assets/images/transaction_menu.svg',
        label: S.of(context).transactions,
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
          context.router.push(TransactionsRoute());
        },
      ),
      AppMenuItem(
        icon: 'assets/images/setting_menu.svg',
        label: S.of(context).setting,
        onPressed: () {
          context.read<NavigatorBloc>().add(NavigatorEvent(selectedIndex: 4));
          context.router.pop();
        },
      ),
    ];
  }
}

class AppMenuItem {
  String icon;
  String label;
  Function() onPressed;

  AppMenuItem(
      {required this.icon, required this.label, required this.onPressed});
}