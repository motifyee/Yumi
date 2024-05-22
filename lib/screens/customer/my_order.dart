import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/order/order_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/model/order_model/order_model.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/news_orders.dart';

@RoutePage()
class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({super.key, this.isHistory = false});

  bool isHistory;

  @override
  Widget build(BuildContext context) {
    return isHistory
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              bottomOpacity: 0,
              scrolledUnderElevation: 0,
              title: Text(
                S.of(context).history,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            body: _MyOrderTemplate(isHistory: isHistory),
          )
        : _MyOrderTemplate(isHistory: isHistory);
  }
}

class _MyOrderTemplate extends StatefulWidget {
  _MyOrderTemplate({this.isHistory = false});

  bool isHistory;

  @override
  State<_MyOrderTemplate> createState() => _MyOrderTemplateState();
}

class _MyOrderTemplateState extends State<_MyOrderTemplate> {
  late PageController _controller;
  late int _index;

  @override
  void initState() {
    _controller = PageController(initialPage: widget.isHistory ? 1 : 0);
    _index = widget.isHistory ? 1 : 0;

    super.initState();
  }

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
                  _controller.jumpToPage(widget.isHistory ? 1 : 0);
                  _index = widget.isHistory ? 1 : 0;
                });
              },
              child: Text(
                S.of(context).myOrders,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ThemeSelector.colors.primary
                        .withAlpha((_index == 0 || _index == 1) ? 255 : 150)),
              ),
            ),
            SizedBox(width: ThemeSelector.statics.defaultGap),
            TextButton(
              onPressed: () {
                setState(() {
                  _controller.jumpToPage(widget.isHistory ? 3 : 2);
                  _index = widget.isHistory ? 3 : 2;
                });
              },
              child: Text(
                S.of(context).myPreOrder,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ThemeSelector.colors.primary
                        .withAlpha((_index == 2 || _index == 3) ? 255 : 150)),
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
                child: NewsOrders(
                  menuTarget: MenuTarget.order,
                  apiKey: ApiKeys.orderCustomerActive,
                  orderCardTargetPage: OrderCardTargetPage.customerOrders,
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
                  orderCardTargetPage: OrderCardTargetPage.customerPreOrders,
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
