import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/core/setup/signalr.dart';
import 'package:yumi/bloc/order/order_bloc.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/model/order_model/order_model.dart';
import 'package:yumi/template/order_card.dart';
import 'package:yumi/template/pagination_template.dart';

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
        print(current.signals);

        if (current.isSignalTriggered(
            signal: signals, isPreOrder: menuTarget == MenuTarget.preOrder)) {
          print(
              '  isSignalTriggered  true --------------00000000---------------');
          context.read<OrderBloc>().add(const OrderEvent.reset());
          context.read<OrderBloc>().add(OrderEvent.getRequest(apiKey: apiKey));
          return true;
        }
        return false;
      },
      builder: (context, state) {
        context.read<SignalRCubit>().removeSignals(signal: signals);
        print(' re rendered ........33.33.3.3.3.3.3 ');
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
                  if (state.paginationHelper.isLoading) Loading(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
