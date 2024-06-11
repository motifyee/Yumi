import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/notification/cubit/notification_cubit.dart';
import 'package:yumi/app/pages/wallet/wallet_cubit/wallet_cubit.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/bloc/navigator/navigator_bloc.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/menu_button.dart';
import 'package:yumi/template/text_currency.dart';

class AppMenuList {
  static List<AppMenuItem> appList(BuildContext context) {
    if (AppTarget.user == AppTargetUser.customers) {
      return _AppMenuList.customerList(context: context);
    }

    if (AppTarget.user == AppTargetUser.chefs) {
      return _AppMenuList.chefList(context: context);
    }

    return _AppMenuList.driverList(context: context);
  }
}

class _AppMenuList {
  static List<AppMenuItem> chefList({required BuildContext context}) => [
        AppMenuItem(
          icon: 'assets/images/notification_menu.svg',
          label: S.of(context).notification,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(NotificationRoute(isScreen: false));
          },
          textLabel: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              return Container(
                width: ThemeSelector.statics.defaultInputGap,
                height: ThemeSelector.statics.defaultInputGap,
                decoration: BoxDecoration(
                    color: state.isNewNotification
                        ? ThemeSelector.colors.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      ThemeSelector.statics.defaultInputGap,
                    )),
              );
            },
          ),
        ),
        AppMenuItem(
          icon: 'assets/images/schedule_menu.svg',
          label: S.of(context).mySchedule,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const MyScheduleRoute());
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
                    listener: (context, state) {},
                    builder: (context, state) {
                      return FractionallySizedBox(
                        widthFactor: .85,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: ThemeSelector.statics.defaultGap,
                              horizontal: ThemeSelector.statics.defaultGap),
                          decoration: BoxDecoration(
                            color: ThemeSelector.colors.background,
                            borderRadius: BorderRadius.circular(ThemeSelector
                                .statics.defaultBorderRadiusMedium),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MenuButton(
                                  menuItem: AppMenuItem(
                                      icon:
                                          'assets/images/menus_order_menu.svg',
                                      label: S.of(context).menuOrders,
                                      onPressed: () {
                                        context.read<NavigatorBloc>().add(
                                            NavigatorEvent(selectedIndex: 2));
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      })),
                              MenuButton(
                                  menuItem: AppMenuItem(
                                      icon:
                                          'assets/images/menus_pre_order_menu.svg',
                                      label: S.of(context).menuPreOrders,
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                        context.router
                                            .push(const MenuPreOrderRoute());
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
            context.router.push(const CaloriesReferenceRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/schedule_menu.svg',
          label: S.of(context).yourWallet,
          textLabel: BlocBuilder<WalletCubit, WalletState>(
            builder: (context, state) {
              return state.isLoading
                  ? Loading(size: ThemeSelector.statics.defaultBlockGap)
                  : TextCurrency(
                      value: state.wallet.money ?? 0,
                      fontSize: ThemeSelector.fonts.font_14);
            },
          ),
          onRender: () {
            if (context.read<UserCubit>().state.user.accessToken.isNotEmpty) {
              context.read<WalletCubit>().getWallet();
            }
          },
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const WalletRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/documentation_menu.svg',
          label: S.of(context).documentation,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const DocumentationRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/performance_menu.svg',
          label: S.of(context).performanceAnalysis,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const PerformanceAnalysisRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/financial_menu.svg',
          label: S.of(context).financialView,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const FinancialViewRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/get_help_menu.svg',
          label: S.of(context).getHelp,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const ChatRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/transaction_menu.svg',
          label: S.of(context).transactions,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const TransactionsRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/setting_menu.svg',
          label: S.of(context).setting,
          onPressed: () {
            context.read<NavigatorBloc>().add(NavigatorEvent(selectedIndex: 4));
            // context.router.pop();
            G.pop();
          },
        ),
      ];

  static List<AppMenuItem> customerList({required BuildContext context}) => [
        AppMenuItem(
          icon: 'assets/images/notification_menu.svg',
          label: S.of(context).notification,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(NotificationRoute(isScreen: false));
          },
          textLabel: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              return Container(
                width: ThemeSelector.statics.defaultInputGap,
                height: ThemeSelector.statics.defaultInputGap,
                decoration: BoxDecoration(
                    color: state.isNewNotification
                        ? ThemeSelector.colors.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      ThemeSelector.statics.defaultInputGap,
                    )),
              );
            },
          ),
        ),
        AppMenuItem(
          icon: 'assets/images/schedule_menu.svg',
          label: S.of(context).yourOrders,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.read<NavigatorBloc>().add(NavigatorEvent(selectedIndex: 3));
          },
        ),
        AppMenuItem(
          icon: 'assets/images/schedule_menu.svg',
          label: S.of(context).offers,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
        AppMenuItem(
          icon: 'assets/images/schedule_menu.svg',
          label: S.of(context).vouchers,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
        AppMenuItem(
          icon: 'assets/images/schedule_menu.svg',
          label: S.of(context).yourWallet,
          textLabel: BlocBuilder<WalletCubit, WalletState>(
            builder: (context, state) {
              return state.isLoading
                  ? Loading(size: ThemeSelector.statics.defaultBlockGap)
                  : TextCurrency(
                      value: state.wallet.money ?? 0,
                      fontSize: ThemeSelector.fonts.font_14);
            },
          ),
          onRender: () {
            if (context.read<UserCubit>().state.user.accessToken.isNotEmpty) {
              context.read<WalletCubit>().getWallet();
            }
          },
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const WalletRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/get_help_menu.svg',
          label: S.of(context).getHelp,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const ChatRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/transaction_menu.svg',
          label: S.of(context).transactions,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const TransactionsRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/setting_menu.svg',
          label: S.of(context).setting,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const SettingRoute());
            // context.read<NavigatorBloc>().add(NavigatorEvent(selectedIndex: 4));
            // context.router.pop();
            // G.pop();
          },
        ),
      ];

  static List<AppMenuItem> driverList({required BuildContext context}) => [
        AppMenuItem(
          icon: 'assets/images/notification_menu.svg',
          label: S.of(context).notification,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(NotificationRoute(isScreen: false));
          },
          textLabel: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              return Container(
                width: ThemeSelector.statics.defaultInputGap,
                height: ThemeSelector.statics.defaultInputGap,
                decoration: BoxDecoration(
                    color: state.isNewNotification
                        ? ThemeSelector.colors.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(
                      ThemeSelector.statics.defaultInputGap,
                    )),
              );
            },
          ),
        ),
        AppMenuItem(
          icon: 'assets/images/schedule_menu.svg',
          label: S.of(context).yourWallet,
          textLabel: BlocBuilder<WalletCubit, WalletState>(
            builder: (context, state) {
              return state.isLoading
                  ? Loading(size: ThemeSelector.statics.defaultBlockGap)
                  : TextCurrency(
                      value: state.wallet.money ?? 0,
                      fontSize: ThemeSelector.fonts.font_14);
            },
          ),
          onRender: () {
            if (context.read<UserCubit>().state.user.accessToken.isNotEmpty) {
              context.read<WalletCubit>().getWallet();
            }
          },
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const WalletRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/schedule_menu.svg',
          label: S.of(context).mySchedule,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const MyScheduleRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/documentation_menu.svg',
          label: S.of(context).documentation,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const DocumentationRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/performance_menu.svg',
          label: S.of(context).performanceAnalysis,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const PerformanceAnalysisRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/financial_menu.svg',
          label: S.of(context).financialView,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const FinancialViewRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/get_help_menu.svg',
          label: S.of(context).getHelp,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const ChatRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/transaction_menu.svg',
          label: S.of(context).transactions,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const TransactionsRoute());
          },
        ),
        AppMenuItem(
          icon: 'assets/images/setting_menu.svg',
          label: S.of(context).setting,
          onPressed: () {
            context.read<NavigatorBloc>().add(NavigatorEvent(selectedIndex: 4));
            G.pop();
          },
        ),
      ];
}

class AppMenuItem {
  String icon;
  String label;
  Widget? textLabel;
  Function() onPressed;
  Function()? onRender;

  AppMenuItem({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.textLabel,
    this.onRender,
  });
}
