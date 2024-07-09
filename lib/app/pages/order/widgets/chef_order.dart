import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/pages/order/cubit/order_cubit.dart';
import 'package:yumi/core/setup/signalr.dart';
import 'package:yumi/bloc/news/news_bloc.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';

import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/domain/user/entity/user.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/pages/order/widgets/action_button.dart';
import 'package:yumi/app/pages/order/widgets/news_orders.dart';

class ChefOrder extends StatelessWidget {
  ChefOrder({super.key, required this.controller, required this.menuTarget});

  PageController controller;
  MenuTarget menuTarget;

  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(NewsEvent(selectedList: menuTarget == MenuTarget.order ? 1 : 0));
    return Column(
      children: [
        BlocBuilder<SignalRCubit, SignalRState>(
          builder: (context, states) {
            return BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (menuTarget == MenuTarget.preOrder)
                      ActionButton(
                        key: key,
                        label: S.of(context).pending,
                        isActive: state.selectedList == 0,
                        isNotificationIconShow: states.isSignalTriggered(signal: [Signals.neworderreceived], isPreOrder: menuTarget == MenuTarget.preOrder),
                        onPressed: () {
                          context.read<NewsBloc>().add(const NewsEvent(selectedList: 0));
                          controller.animateToPage(0, duration: ThemeSelector.statics.animationDuration, curve: Curves.easeOut);
                          context.read<SignalRCubit>().removeSignals(signal: [Signals.neworderreceived]);
                        },
                      ),
                    ActionButton(
                      key: key,
                      label: S.of(context).received,
                      isActive: state.selectedList == 1,
                      isNotificationIconShow: states.isSignalTriggered(signal: [
                        Signals.driveraccept,
                        if (menuTarget == MenuTarget.order) Signals.neworderreceived,
                      ], isPreOrder: menuTarget == MenuTarget.preOrder),
                      onPressed: () {
                        context.read<NewsBloc>().add(const NewsEvent(selectedList: 1));
                        controller.animateToPage(1, duration: ThemeSelector.statics.animationDuration, curve: Curves.easeOut);
                        context.read<SignalRCubit>().removeSignals(signal: [
                          Signals.driveraccept,
                          if (menuTarget == MenuTarget.order) Signals.neworderreceived,
                        ]);
                      },
                    ),
                    ActionButton(
                      key: key,
                      label: S.of(context).preparing,
                      isActive: state.selectedList == 2,
                      onPressed: () {
                        context.read<NewsBloc>().add(const NewsEvent(selectedList: 2));
                        controller.animateToPage(2, duration: ThemeSelector.statics.animationDuration, curve: Curves.easeOut);
                      },
                    ),
                    ActionButton(
                      key: key,
                      label: S.of(context).ready,
                      isActive: state.selectedList == 3,
                      onPressed: () {
                        context.read<NewsBloc>().add(const NewsEvent(selectedList: 3));
                        controller.animateToPage(3, duration: ThemeSelector.statics.animationDuration, curve: Curves.easeOut);
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<NewsBloc>().add(const NewsEvent(selectedList: 4));
                        controller.animateToPage(4, duration: ThemeSelector.statics.animationDuration, curve: Curves.easeOut);
                      },
                      child: SvgPicture.asset(
                        'assets/images/history.svg',
                        colorFilter: ColorFilter.mode(state.selectedList == 4 ? ThemeSelector.colors.primary : ThemeSelector.colors.secondary, BlendMode.srcIn),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              BlocProvider(
                create: (context) => OrderCubit(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: ApiKeys.preOrderChefReceived,
                  orderCardTargetPage: OrderCardTargetPage.chefPending,
                  signals: const [Signals.neworderreceived, Signals.driveraccept],
                  navFun: () {
                    context.read<NewsBloc>().add(const NewsEvent(selectedList: 1));
                    controller.animateToPage(1, duration: ThemeSelector.statics.animationDuration, curve: Curves.easeOut);
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: menuTarget == MenuTarget.order ? ApiKeys.orderChefReceived : ApiKeys.preOrderChefAccepted,
                  orderCardTargetPage: OrderCardTargetPage.chefReceived,
                  signals: [
                    Signals.driveraccept,
                    if (menuTarget == MenuTarget.order) Signals.neworderreceived,
                  ],
                  navFun: () {
                    context.read<NewsBloc>().add(const NewsEvent(selectedList: 2));
                    controller.animateToPage(2, duration: ThemeSelector.statics.animationDuration, curve: Curves.easeOut);
                    if (context.read<UserCubit>().state.user.status == 1) {
                      G.rd<UserCubit>().updateStatus(UserStatus.busy);
                    }
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: menuTarget == MenuTarget.order ? ApiKeys.orderChefPreparing : ApiKeys.preOrderChefPreparing,
                  orderCardTargetPage: OrderCardTargetPage.chefPreparing,
                  signals: const [Signals.chefstart, Signals.clientcancel],
                  navFun: () {
                    context.read<NewsBloc>().add(const NewsEvent(selectedList: 3));
                    controller.animateToPage(3, duration: ThemeSelector.statics.animationDuration, curve: Curves.easeOut);
                    if (context.read<UserCubit>().state.user.status == 2) {
                      G.rd<UserCubit>().updateStatus(UserStatus.online);
                    }
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: menuTarget == MenuTarget.order ? ApiKeys.orderChefReady : ApiKeys.preOrderChefReady,
                  orderCardTargetPage: OrderCardTargetPage.chefReady,
                  signals: const [Signals.cheffinished],
                  navFun: () {
                    context.read<NewsBloc>().add(const NewsEvent(selectedList: 1));
                    controller.animateToPage(1, duration: ThemeSelector.statics.animationDuration, curve: Curves.easeOut);
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: menuTarget == MenuTarget.order ? ApiKeys.orderChefClosed : ApiKeys.preOrderChefClosed,
                  orderCardTargetPage: OrderCardTargetPage.chefHistory,
                  signals: const [Signals.clientreceived, Signals.driverreceived],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
