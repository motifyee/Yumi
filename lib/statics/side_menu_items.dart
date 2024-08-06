import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:yumi/app/pages/home/cubit/navigator_cubit.dart';
import 'package:yumi/app/pages/notification/cubit/notification_cubit.dart';
import 'package:yumi/app/pages/wallet/wallet_cubit/wallet_cubit.dart';
import 'package:yumi/app_target.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/routes/routes.gr.dart';
import 'package:yumi/app/pages/home/menu_button.dart';

class AppMenuList {
  static List<AppMenuItem> appList(BuildContext context) {
    if (AppTarget.user == YumiApp.customers) {
      return _AppMenuList.customerList(context: context);
    }

    if (AppTarget.user == YumiApp.chefs) {
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
        ),
        AppMenuItem(
          icon: 'assets/images/schedule_menu.svg',
          label: S.of(context).mySchedule,
          onPressed: () async {
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
                  child: BlocConsumer<NavigatorCubit, NavigatorStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return FractionallySizedBox(
                        widthFactor: .85,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: CommonDimens.defaultGap,
                              horizontal: CommonDimens.defaultGap),
                          decoration: BoxDecoration(
                            color: CommonColors.background,
                            borderRadius: BorderRadius.circular(
                                CommonDimens.defaultBorderRadiusMedium),
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
                                        context
                                            .read<NavigatorCubit>()
                                            .navigate(selectedIndex: 2);
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
                  ? const PacmanLoadingWidget(
                      size: CommonDimens.defaultBlockGap)
                  : TextCurrency(
                      value: state.wallet.money ?? 0,
                      fontSize: CommonFontSize.font_14);
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
          label: S.of(context).settings,
          onPressed: () {
            context.read<NavigatorCubit>().navigate(selectedIndex: 4);
            // context.router.pop();
            G().pop();
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
        ),
        AppMenuItem(
          icon: 'assets/images/schedule_menu.svg',
          label: S.of(context).yourOrders,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.read<NavigatorCubit>().navigate(selectedIndex: 3);
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
                  ? const PacmanLoadingWidget(
                      size: CommonDimens.defaultBlockGap)
                  : TextCurrency(
                      value: -1 * (state.wallet.money ?? 0),
                      fontSize: CommonFontSize.font_14);
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
          label: S.of(context).settings,
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
            context.router.push(const SettingsRoute());
            // context.read<NavigatorBloc>().add(NavigatorEvent(selectedIndex: 4));
            // context.router.pop();
            G().pop();
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
        ),
        AppMenuItem(
          icon: 'assets/images/schedule_menu.svg',
          label: S.of(context).yourWallet,
          textLabel: BlocBuilder<WalletCubit, WalletState>(
            builder: (context, state) {
              return state.isLoading
                  ? const PacmanLoadingWidget(
                      size: CommonDimens.defaultBlockGap)
                  : TextCurrency(
                      value: state.wallet.money ?? 0,
                      fontSize: CommonFontSize.font_14);
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
          label: S.of(context).settings,
          onPressed: () {
            context.read<NavigatorCubit>().navigate(selectedIndex: 4);
            G().pop();
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
