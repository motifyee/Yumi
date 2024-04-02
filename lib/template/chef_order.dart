import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/news/news_bloc.dart';
import 'package:yumi/bloc/order/order_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/model/order_model/order_model.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/template/action_button.dart';
import 'package:yumi/template/news_orders.dart';

class ChefOrder extends StatelessWidget {
  ChefOrder({super.key, required this.controller, required this.menuTarget});

  PageController controller;
  MenuTarget menuTarget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ActionButton(
                  key: key,
                  label: S.of(context).pending,
                  isActive: state.selectedList == 0,
                  onPressed: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent(selectedList: 0));
                    controller.jumpToPage(0);
                  },
                ),
                ActionButton(
                  key: key,
                  label: S.of(context).received,
                  isActive: state.selectedList == 1,
                  onPressed: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent(selectedList: 1));
                    controller.jumpToPage(1);
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
                  label: S.of(context).history,
                  isActive: state.selectedList == 3,
                  onPressed: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent(selectedList: 3));
                    controller.jumpToPage(3);
                  },
                ),
              ],
            );
          },
        ),
        Expanded(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              BlocProvider(
                create: (context) => OrderBloc(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: menuTarget == MenuTarget.order
                      ? ApiKeys.orderChefReceived
                      : ApiKeys.preOrderChefReceived,
                  orderCardTargetPage: OrderCardTargetPage.chefReceived,
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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
