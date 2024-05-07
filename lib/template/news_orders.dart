import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  });

  final MenuTarget menuTarget;
  final String apiKey;
  final OrderCardTargetPage orderCardTargetPage;
  final Function()? navFun;

  @override
  Widget build(BuildContext context) {
    return PaginationTemplate(
        scrollDirection: Axis.vertical,
        loadDate: () {
          context.read<OrderBloc>().add(OrderEvent.getRequest(apiKey: apiKey));
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
              ],
            );
          },
        ));
  }
}
