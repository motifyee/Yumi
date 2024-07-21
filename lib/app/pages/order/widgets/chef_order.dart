import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/pages/order/cubit/order_cubit.dart';
import 'package:common_code/core/setup/signalr.dart';
import 'package:yumi/bloc/news/news_bloc.dart';
import 'package:common_code/domain/food_delivery/meal/entities/meal.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:common_code/domain/food_delivery/order/entity/order.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/app/pages/order/widgets/action_button.dart';
import 'package:yumi/app/pages/order/widgets/news_orders.dart';

class ChefOrder extends StatelessWidget {
  ChefOrder({super.key, required this.controller, required this.menuTarget});

  PageController controller;
  MenuTarget menuTarget;

  @override
  Widget build(BuildContext context) {
    context
        .read<NewsBloc>()
        .add(NewsEvent(selectedList: menuTarget == MenuTarget.order ? 1 : 0));
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
                        isNotificationIconShow: states.isSignalTriggered(
                            signal: [Signal.neworderreceived],
                            isPreOrder: menuTarget == MenuTarget.preOrder),
                        onPressed: () {
                          context
                              .read<NewsBloc>()
                              .add(const NewsEvent(selectedList: 0));
                          controller.jumpToPage(0);
                          context
                              .read<SignalRCubit>()
                              .removeSignals(signal: [Signal.neworderreceived]);
                        },
                      ),
                    ActionButton(
                      key: key,
                      label: S.of(context).received,
                      isActive: state.selectedList == 1,
                      isNotificationIconShow: states.isSignalTriggered(signal: [
                        Signal.driveraccept,
                        if (menuTarget == MenuTarget.order)
                          Signal.neworderreceived,
                      ], isPreOrder: menuTarget == MenuTarget.preOrder),
                      onPressed: () {
                        context
                            .read<NewsBloc>()
                            .add(const NewsEvent(selectedList: 1));
                        controller.jumpToPage(1);
                        context.read<SignalRCubit>().removeSignals(signal: [
                          Signal.driveraccept,
                          if (menuTarget == MenuTarget.order)
                            Signal.neworderreceived,
                        ]);
                      },
                    ),
                    ActionButton(
                      key: key,
                      label: S.of(context).preparing,
                      isActive: state.selectedList == 2,
                      onPressed: () {
                        context
                            .read<NewsBloc>()
                            .add(const NewsEvent(selectedList: 2));
                        controller.jumpToPage(2);
                      },
                    ),
                    ActionButton(
                      key: key,
                      label: S.of(context).ready,
                      isActive: state.selectedList == 3,
                      onPressed: () {
                        context
                            .read<NewsBloc>()
                            .add(const NewsEvent(selectedList: 3));
                        controller.jumpToPage(3);
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<NewsBloc>()
                            .add(const NewsEvent(selectedList: 4));
                        controller.jumpToPage(4);
                      },
                      child: SvgPicture.asset(
                        'assets/images/history.svg',
                        colorFilter: ColorFilter.mode(
                            state.selectedList == 4
                                ? CommonColors.primary
                                : CommonColors.secondary,
                            BlendMode.srcIn),
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
                  apiKey: EndPoints.preOrderChefReceived,
                  orderCardTargetPage: OrderCardTargetPage.chefPending,
                  signals: const [Signal.neworderreceived, Signal.driveraccept],
                  navFun: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent(selectedList: 1));
                    controller.jumpToPage(1);
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: menuTarget == MenuTarget.order
                      ? EndPoints.orderChefReceived
                      : EndPoints.preOrderChefAccepted,
                  orderCardTargetPage: OrderCardTargetPage.chefReceived,
                  signals: [
                    Signal.driveraccept,
                    if (menuTarget == MenuTarget.order) Signal.neworderreceived,
                  ],
                  navFun: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent(selectedList: 2));
                    controller.jumpToPage(2);
                    if (context.read<UserCubit>().state.user.status == 1) {
                      G().rd<UserCubit>().updateStatus(UserStatus.busy);
                    }
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: menuTarget == MenuTarget.order
                      ? EndPoints.orderChefPreparing
                      : EndPoints.preOrderChefPreparing,
                  orderCardTargetPage: OrderCardTargetPage.chefPreparing,
                  signals: const [Signal.chefstart, Signal.clientcancel],
                  navFun: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent(selectedList: 3));
                    controller.jumpToPage(3);
                    if (context.read<UserCubit>().state.user.status == 2) {
                      G().rd<UserCubit>().updateStatus(UserStatus.online);
                    }
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: menuTarget == MenuTarget.order
                      ? EndPoints.orderChefReady
                      : EndPoints.preOrderChefReady,
                  orderCardTargetPage: OrderCardTargetPage.chefReady,
                  signals: const [Signal.cheffinished],
                  navFun: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent(selectedList: 1));
                    controller.jumpToPage(1);
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: menuTarget == MenuTarget.order
                      ? EndPoints.orderChefClosed
                      : EndPoints.preOrderChefClosed,
                  orderCardTargetPage: OrderCardTargetPage.chefHistory,
                  signals: const [Signal.clientreceived, Signal.driverreceived],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
