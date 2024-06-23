import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/pages/order/cubit/order/order_bloc.dart';
import 'package:yumi/core/setup/signalr.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/app/pages/menu/meal_model.dart';
import 'package:yumi/app/pages/order/widgets/order_card.dart';
import 'package:yumi/app/components/pagination_template.dart';

class NewsOrders extends StatelessWidget {
  NewsOrders({
    super.key,
    required this.menuTarget,
    required this.apiKey,
    required this.orderCardTargetPage,
    this.navFun,
    this.signals = const [],
  });

  final MenuTarget menuTarget;
  final String apiKey;
  final OrderCardTargetPage orderCardTargetPage;
  final Function()? navFun;
  List<Signals> signals;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignalRCubit, SignalRState>(
      buildWhen: (previous, current) {
        if (current.isSignalTriggered(
            signal: signals, isPreOrder: menuTarget == MenuTarget.preOrder)) {
          context.read<OrderBloc>().add(const OrderEvent.reset());
          context.read<OrderBloc>().add(OrderEvent.getRequest(apiKey: apiKey));
          return true;
        }
        return false;
      },
      builder: (context, state) {
        context.read<SignalRCubit>().removeSignals(signal: signals);

        return PaginationTemplate(
          scrollDirection: Axis.vertical,
          loadDate: () {
            context
                .read<OrderBloc>()
                .add(OrderEvent.getRequest(apiKey: apiKey));
          },
          child: BlocConsumer<OrderBloc, OrderState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                children: [
                  for (var order in state.orders)
                    OrderCard(
                      order: order,
                      orderCardTargetPage: orderCardTargetPage,
                      getApiKey: apiKey,
                      menuTarget: menuTarget,
                      navFun: navFun,
                    ),
                  if (state.pagination.isLoading) Loading(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
