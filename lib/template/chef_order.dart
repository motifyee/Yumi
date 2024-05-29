import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/core/setup/signalr.dart';
import 'package:yumi/bloc/news/news_bloc.dart';
import 'package:yumi/bloc/order/order_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/model/order_model/order_model.dart';
import 'package:yumi/model/user/user_model.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/action_button.dart';
import 'package:yumi/template/news_orders.dart';

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
                            signal: [Signals.neworderreceived],
                            isPreOrder: menuTarget == MenuTarget.preOrder),
                        onPressed: () {
                          context
                              .read<NewsBloc>()
                              .add(const NewsEvent(selectedList: 0));
                          controller.jumpToPage(0);
                          context.read<SignalRCubit>().removeSignals(
                              signal: [Signals.neworderreceived]);
                        },
                      ),
                    ActionButton(
                      key: key,
                      label: S.of(context).received,
                      isActive: state.selectedList == 1,
                      isNotificationIconShow: states.isSignalTriggered(
                          signal: [Signals.driveraccept],
                          isPreOrder: menuTarget == MenuTarget.preOrder),
                      onPressed: () {
                        context
                            .read<NewsBloc>()
                            .add(const NewsEvent(selectedList: 1));
                        controller.jumpToPage(1);
                        context
                            .read<SignalRCubit>()
                            .removeSignals(signal: [Signals.driveraccept]);
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
                                ? ThemeSelector.colors.primary
                                : ThemeSelector.colors.secondary,
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
                create: (context) => OrderBloc(),
                child: Builder(builder: (context) {
                  return NewsOrders(
                    menuTarget: menuTarget,
                    apiKey: ApiKeys.preOrderChefReceived,
                    orderCardTargetPage: OrderCardTargetPage.chefPending,
                    signalRListener: const [
                      Signals.neworderreceived,
                      Signals.driveraccept
                    ],
                    signalRFun: (p0) {
                      bool isUpdate = p0.any((e) =>
                          e['chef_ID'] ==
                          context.read<UserBloc>().state.user.id);
                      if (isUpdate) {
                        context.read<OrderBloc>().add(const OrderEvent.reset());
                      }
                      return isUpdate;
                    },
                    navFun: () {
                      context
                          .read<NewsBloc>()
                          .add(const NewsEvent(selectedList: 1));
                      controller.jumpToPage(1);
                    },
                  );
                }),
              ),
              BlocProvider(
                create: (context) => OrderBloc(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: menuTarget == MenuTarget.order
                      ? ApiKeys.orderChefReceived
                      : ApiKeys.preOrderChefAccepted,
                  orderCardTargetPage: OrderCardTargetPage.chefReceived,
                  signalRListener: const [Signals.driveraccept],
                  signalRFun: (p0) {
                    bool isUpdate = p0.any((e) =>
                        e['chef_ID'] == context.read<UserBloc>().state.user.id);
                    if (isUpdate) {
                      context.read<OrderBloc>().add(const OrderEvent.reset());
                    }
                    return isUpdate;
                  },
                  navFun: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent(selectedList: 2));
                    controller.jumpToPage(2);
                    if (context.read<UserBloc>().state.user.status == 1) {
                      context.read<UserBloc>().add(
                          UserStatusUpdateEvent(statusEnum: StatusEnum.busy));
                    }
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderBloc(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: menuTarget == MenuTarget.order
                      ? ApiKeys.orderChefPreparing
                      : ApiKeys.preOrderChefPreparing,
                  orderCardTargetPage: OrderCardTargetPage.chefPreparing,
                  signalRListener: const [
                    Signals.chefstart,
                    Signals.clientcancel
                  ],
                  signalRFun: (p0) {
                    bool isUpdate = p0.any((e) =>
                        e['chef_ID'] == context.read<UserBloc>().state.user.id);
                    if (isUpdate) {
                      context.read<OrderBloc>().add(const OrderEvent.reset());
                    }
                    return isUpdate;
                  },
                  navFun: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent(selectedList: 3));
                    controller.jumpToPage(3);
                    if (context.read<UserBloc>().state.user.status == 2) {
                      context.read<UserBloc>().add(
                          UserStatusUpdateEvent(statusEnum: StatusEnum.online));
                    }
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderBloc(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: menuTarget == MenuTarget.order
                      ? ApiKeys.orderChefReady
                      : ApiKeys.preOrderChefReady,
                  orderCardTargetPage: OrderCardTargetPage.chefReady,
                  signalRListener: const [Signals.cheffinished],
                  signalRFun: (p0) {
                    bool isUpdate = p0.any((e) =>
                        e['chef_ID'] == context.read<UserBloc>().state.user.id);
                    if (isUpdate) {
                      context.read<OrderBloc>().add(const OrderEvent.reset());
                    }
                    return isUpdate;
                  },
                  navFun: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent(selectedList: 1));
                    controller.jumpToPage(1);
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderBloc(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: menuTarget == MenuTarget.order
                      ? ApiKeys.orderChefClosed
                      : ApiKeys.preOrderChefClosed,
                  orderCardTargetPage: OrderCardTargetPage.chefHistory,
                  signalRListener: const [
                    Signals.clientreceived,
                    Signals.driverreceived
                  ],
                  signalRFun: (p0) {
                    bool isUpdate = p0.any((e) =>
                        e['chef_ID'] == context.read<UserBloc>().state.user.id);
                    if (isUpdate) {
                      context.read<OrderBloc>().add(const OrderEvent.reset());
                    }
                    return isUpdate;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
