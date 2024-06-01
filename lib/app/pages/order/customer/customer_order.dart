import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/core/setup/signalr.dart';
import 'package:yumi/bloc/order/order_bloc.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/action_button.dart';
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
        BlocBuilder<SignalRCubit, SignalRState>(
          builder: (context, state) {
            return Row(
              children: [
                SizedBox(width: ThemeSelector.statics.defaultGap),
                ActionButton(
                  onPressed: () {
                    setState(() {
                      _controller.jumpToPage(widget.isHistory ? 1 : 0);
                      _index = widget.isHistory ? 1 : 0;
                    });
                    context.read<SignalRCubit>().removeSignals(signal: [
                      Signals.neworderreceived,
                      Signals.chefaccept,
                      Signals.driveraccept,
                      Signals.chefstart,
                      Signals.cheffinished,
                      Signals.driverreceived,
                      Signals.clientreceived,
                    ]);
                  },
                  label: S.of(context).myOrders,
                  isActive: _index == 0 || _index == 1,
                  isNotificationIconShow: state.isSignalTriggered(signal: [
                    Signals.neworderreceived,
                    Signals.chefaccept,
                    Signals.driveraccept,
                    Signals.chefstart,
                    Signals.cheffinished,
                    Signals.driverreceived,
                    Signals.clientreceived,
                  ], isPreOrder: false),
                ),
                SizedBox(width: ThemeSelector.statics.defaultGap),
                ActionButton(
                  onPressed: () {
                    setState(() {
                      _controller.jumpToPage(widget.isHistory ? 3 : 2);
                      _index = widget.isHistory ? 3 : 2;
                    });
                    context.read<SignalRCubit>().removeSignals(signal: [
                      Signals.neworderreceived,
                      Signals.chefaccept,
                      Signals.driveraccept,
                      Signals.chefstart,
                      Signals.cheffinished,
                      Signals.driverreceived,
                      Signals.clientreceived,
                    ]);
                  },
                  label: S.of(context).myPreOrder,
                  isActive: _index == 2 || _index == 3,
                  isNotificationIconShow: state.isSignalTriggered(signal: [
                    Signals.neworderreceived,
                    Signals.chefaccept,
                    Signals.driveraccept,
                    Signals.chefstart,
                    Signals.cheffinished,
                    Signals.driverreceived,
                    Signals.clientreceived,
                  ], isPreOrder: true),
                ),
              ],
            );
          },
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
                  signals: const [
                    Signals.driveraccept,
                    Signals.chefaccept,
                    Signals.chefstart,
                    Signals.cheffinished,
                    Signals.driverreceived,
                    Signals.clientreceived,
                  ],
                ),
              ),
              BlocProvider(
                create: (context) => OrderBloc(),
                child: NewsOrders(
                  menuTarget: MenuTarget.order,
                  apiKey: ApiKeys.orderCustomerClosed,
                  orderCardTargetPage: OrderCardTargetPage.customerHistory,
                  signals: const [Signals.clientreceived],
                ),
              ),
              BlocProvider(
                create: (context) => OrderBloc(),
                child: NewsOrders(
                  menuTarget: MenuTarget.preOrder,
                  apiKey: ApiKeys.preOrderCustomerActive,
                  orderCardTargetPage: OrderCardTargetPage.customerPreOrders,
                  signals: const [
                    Signals.driveraccept,
                    Signals.chefaccept,
                    Signals.chefstart,
                    Signals.cheffinished,
                    Signals.driverreceived,
                    Signals.clientreceived,
                  ],
                ),
              ),
              BlocProvider(
                create: (context) => OrderBloc(),
                child: NewsOrders(
                  menuTarget: MenuTarget.preOrder,
                  apiKey: ApiKeys.preOrderCustomerClosed,
                  orderCardTargetPage: OrderCardTargetPage.customerHistory,
                  signals: const [Signals.clientreceived],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
