import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/order/order_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/model/order_model/order_model.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/news_orders.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final PageController _controller = PageController(initialPage: 0);
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: ThemeSelector.statics.defaultGap),
            TextButton(
              onPressed: () {
                setState(() {
                  _controller.jumpToPage(0);
                  _index = 0;
                });
              },
              child: Text(
                S.of(context).myOrders,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ThemeSelector.colors.primary
                        .withAlpha(_index == 0 ? 255 : 150)),
              ),
            ),
            SizedBox(width: ThemeSelector.statics.defaultGap),
            TextButton(
              onPressed: () {
                setState(() {
                  _controller.jumpToPage(2);
                  _index = 2;
                });
              },
              child: Text(
                S.of(context).myPreOrder,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ThemeSelector.colors.primary
                        .withAlpha(_index == 1 ? 255 : 150)),
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: ThemeSelector.statics.defaultGap),
            TextButton(
              onPressed: () {
                setState(() {
                  if (_index > 1) {
                    _controller.jumpToPage(2);
                    _index = 2;
                  } else {
                    _controller.jumpToPage(0);
                    _index = 0;
                  }
                });
              },
              child: Text(
                S.of(context).orders,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ThemeSelector.colors.primary
                        .withAlpha(_index == 0 || _index == 2 ? 255 : 150)),
              ),
            ),
            SizedBox(width: ThemeSelector.statics.defaultGap),
            TextButton(
              onPressed: () {
                setState(() {
                  if (_index > 1) {
                    _controller.jumpToPage(3);
                    _index = 3;
                  } else {
                    _controller.jumpToPage(1);
                    _index = 1;
                  }
                });
              },
              child: Text(
                S.of(context).ordersHistory,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ThemeSelector.colors.primary
                        .withAlpha(_index == 1 || _index == 3 ? 255 : 150)),
              ),
            ),
          ],
        ),
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            children: [
              BlocProvider(
                create: (context) => OrderBloc(),
                child: Column(
                  children: [
                    NewsOrders(
                      menuTarget: MenuTarget.order,
                      apiKey: ApiKeys.orderCustomerActive,
                      orderCardTargetPage: OrderCardTargetPage.customerHistory,
                    ),
                  ],
                ),
              ),
              BlocProvider(
                create: (context) => OrderBloc(),
                child: NewsOrders(
                  menuTarget: MenuTarget.order,
                  apiKey: ApiKeys.orderCustomerClosed,
                  orderCardTargetPage: OrderCardTargetPage.customerHistory,
                ),
              ),
              BlocProvider(
                create: (context) => OrderBloc(),
                child: NewsOrders(
                  menuTarget: MenuTarget.preOrder,
                  apiKey: ApiKeys.preOrderCustomerActive,
                  orderCardTargetPage: OrderCardTargetPage.customerHistory,
                ),
              ),
              BlocProvider(
                create: (context) => OrderBloc(),
                child: NewsOrders(
                  menuTarget: MenuTarget.preOrder,
                  apiKey: ApiKeys.preOrderCustomerClosed,
                  orderCardTargetPage: OrderCardTargetPage.customerHistory,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
