import 'package:common_code/common_code.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:yumi/app/components/login_to_continue/login_to_continue.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/pages/order/cubit/order_cubit.dart';
import 'package:common_code/core/setup/signalr.dart';
import 'package:yumi/app/pages/order/widgets/order_card.dart';
import 'package:yumi/generated/l10n.dart';

class OrdersCardList extends StatelessWidget {
  const OrdersCardList({
    super.key,
    required this.orderType,
    required this.apiKey,
    required this.orderCardType,
    this.navFun,
    this.signals = const [],
  });

  final OrderType orderType;
  final String apiKey;
  final OrderCardType orderCardType;
  final Function()? navFun;
  final List<Signal> signals;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (!state.isLoggedIn) return const LoginToContinue();

        return BlocBuilder<SignalRCubit, SignalRState>(
          buildWhen: (previous, signalrState) {
            final isSignalTriggered = signalrState.hasAnySignalTriggered(
              watchedSignals: signals,
              isPreOrder: orderType == OrderType.preOrder,
            );

            if (!isSignalTriggered) return false;

            final isLoading =
                context.read<OrderCubit>().state.ordersPage.isLoading;

            context.read<OrderCubit>().resetOrders(loading: isLoading);
            context.read<OrderCubit>().getOrders(apiKeys: apiKey);

            return true;
          },
          builder: (context, state) {
            context.read<SignalRCubit>().removeSignals(signal: signals);

            return PaginationTemplate(
              scrollDirection: Axis.vertical,
              loadDate: () {
                context.read<OrderCubit>().getOrders(apiKeys: apiKey);
              },
              child: BlocBuilder<OrderCubit, OrderState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      for (Order order in state.ordersPage.data)
                        OrderCard(
                          order: order,
                          orderCardType: orderCardType,
                          getApiKey: apiKey,
                          orderType: orderType,
                          navFun: navFun,
                        ),
                      if (state.ordersPage.isLoading)
                        const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: PacmanLoadingWidget(),
                        ),
                      if (!state.ordersPage.isLoading &&
                          state.ordersPage.data.isEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Text(
                            S.of(context).empty,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: CommonColors.secondaryFaint,
                                ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
