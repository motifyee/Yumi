import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:yumi/app/components/page_view/cubit/page_view_cubit.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/pages/order/cubit/order_cubit.dart';
import 'package:common_code/core/setup/signalr.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/app/pages/order/widgets/action_button.dart';
import 'package:yumi/app/pages/order/widgets/orders_card_list.dart';

class ChefOrders extends StatelessWidget {
  ChefOrders({super.key, required this.controller, required this.orderType});

  PageController controller;
  OrderType orderType;

  @override
  Widget build(BuildContext context) {
    context
        .read<PageViewCubit>()
        .updateSelect(selectedList: orderType == OrderType.order ? 1 : 0);
    return Column(
      children: [
        BlocBuilder<SignalRCubit, SignalRState>(
          builder: (context, states) {
            return BlocBuilder<PageViewCubit, PageViewState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (orderType == OrderType.preOrder)
                      ActionButton(
                        key: key,
                        label: S.of(context).pending,
                        isActive: state.selectedList == 0,
                        showNotifIcon: states.hasAnySignalTriggered(
                          watchedSignals: [
                            Signal.neworderreceived,
                            Signal.driveraccept,
                          ],
                          isPreOrder: orderType == OrderType.preOrder,
                        ),
                        onPressed: () {
                          context
                              .read<PageViewCubit>()
                              .updateSelect(selectedList: 0);
                          controller.jumpToPage(0);
                          context.read<SignalRCubit>().removeSignals(
                            signal: [
                              Signal.neworderreceived,
                              Signal.driveraccept,
                            ],
                          );
                        },
                      ),
                    ActionButton(
                      key: key,
                      label: S.of(context).received,
                      isActive: state.selectedList == 1,
                      showNotifIcon: states.hasAnySignalTriggered(
                        watchedSignals: [
                          Signal.driveraccept,
                          if (orderType == OrderType.order)
                            Signal.neworderreceived,
                          Signal.clientcancel,
                        ],
                        isPreOrder: orderType == OrderType.preOrder,
                      ),
                      onPressed: () {
                        context
                            .read<PageViewCubit>()
                            .updateSelect(selectedList: 1);
                        controller.jumpToPage(1);
                        context.read<SignalRCubit>().removeSignals(
                          signal: [
                            Signal.driveraccept,
                            if (orderType == OrderType.order)
                              Signal.neworderreceived,
                            Signal.clientcancel,
                          ],
                        );
                      },
                    ),
                    ActionButton(
                      key: key,
                      label: S.of(context).preparing,
                      isActive: state.selectedList == 2,
                      showNotifIcon: states.hasAnySignalTriggered(
                        watchedSignals: [Signal.clientcancel],
                        isPreOrder: orderType == OrderType.preOrder,
                      ),
                      onPressed: () {
                        context
                            .read<PageViewCubit>()
                            .updateSelect(selectedList: 2);
                        controller.jumpToPage(2);
                        context
                            .read<SignalRCubit>()
                            .removeSignals(signal: [Signal.clientcancel]);
                      },
                    ),
                    ActionButton(
                      key: key,
                      label: S.of(context).ready,
                      isActive: state.selectedList == 3,
                      showNotifIcon: states.hasAnySignalTriggered(
                        watchedSignals: [Signal.clientreceived],
                        isPreOrder: orderType == OrderType.preOrder,
                      ),
                      onPressed: () {
                        context
                            .read<PageViewCubit>()
                            .updateSelect(selectedList: 3);
                        controller.jumpToPage(3);
                        context
                            .read<SignalRCubit>()
                            .removeSignals(signal: [Signal.clientreceived]);
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<PageViewCubit>()
                            .updateSelect(selectedList: 4);
                        controller.jumpToPage(4);
                      },
                      child: SvgPicture.asset(
                        'assets/images/history.svg',
                        colorFilter: ColorFilter.mode(
                          state.selectedList == 4
                              ? CommonColors.primary
                              : CommonColors.secondary,
                          BlendMode.srcIn,
                        ),
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
                child: OrdersCardList(
                  orderType: orderType,
                  apiKey: Endpoints().preOrderChefReceived,
                  orderCardType: OrderCardType.chefPending,
                  signals: const [Signal.neworderreceived, Signal.driveraccept],
                  navFun: () {
                    context.read<PageViewCubit>().updateSelect(selectedList: 1);
                    controller.jumpToPage(1);
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
                child: OrdersCardList(
                  orderType: orderType,
                  apiKey: orderType == OrderType.order
                      ? Endpoints().orderChefReceived
                      : Endpoints().preOrderChefAccepted,
                  orderCardType: OrderCardType.chefReceived,
                  signals: [
                    Signal.driveraccept,
                    if (orderType == OrderType.order) Signal.neworderreceived,
                    Signal.clientcancel,
                  ],
                  navFun: () {
                    context.read<PageViewCubit>().updateSelect(selectedList: 2);
                    controller.jumpToPage(2);
                    if (context.read<UserCubit>().state.user.status == 1) {
                      G().rd<UserCubit>().updateStatus(UserStatus.busy);
                    }
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
                child: OrdersCardList(
                  orderType: orderType,
                  apiKey: orderType == OrderType.order
                      ? Endpoints().orderChefPreparing
                      : Endpoints().preOrderChefPreparing,
                  orderCardType: OrderCardType.chefPreparing,
                  signals: const [Signal.chefstart, Signal.clientcancel],
                  navFun: () {
                    context.read<PageViewCubit>().updateSelect(selectedList: 3);
                    controller.jumpToPage(3);
                    if (context.read<UserCubit>().state.user.status == 2) {
                      G().rd<UserCubit>().updateStatus(UserStatus.online);
                    }
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
                child: OrdersCardList(
                  orderType: orderType,
                  apiKey: orderType == OrderType.order
                      ? Endpoints().orderChefReady
                      : Endpoints().preOrderChefReady,
                  orderCardType: OrderCardType.chefReady,
                  signals: const [Signal.cheffinished],
                  navFun: () {
                    context.read<PageViewCubit>().updateSelect(selectedList: 1);
                    controller.jumpToPage(1);
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
                child: OrdersCardList(
                  orderType: orderType,
                  apiKey: orderType == OrderType.order
                      ? Endpoints().orderChefClosed
                      : Endpoints().preOrderChefClosed,
                  orderCardType: OrderCardType.chefHistory,
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
