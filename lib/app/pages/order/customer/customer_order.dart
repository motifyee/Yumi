import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/pages/order/cubit/order_cubit.dart';
import 'package:common_code/core/setup/signalr.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/app/pages/order/widgets/action_button.dart';
import 'package:yumi/app/pages/order/widgets/news_orders.dart';

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
                const SizedBox(width: CommonDimens.defaultGap),
                ActionButton(
                  onPressed: () {
                    setState(() {
                      _controller.animateToPage(widget.isHistory ? 1 : 0,
                          duration: CommonDimens.animationDuration,
                          curve: Curves.easeOut);
                      _index = widget.isHistory ? 1 : 0;
                    });
                    context.read<SignalRCubit>().removeSignals(signal: [
                      Signal.neworderreceived,
                      Signal.chefaccept,
                      Signal.driveraccept,
                      Signal.chefstart,
                      Signal.cheffinished,
                      Signal.driverreceived,
                      Signal.clientreceived,
                      Signal.chefcancel,
                    ]);
                  },
                  label: S.of(context).myOrders,
                  isActive: _index == 0 || _index == 1,
                  isNotificationIconShow: state.isSignalTriggered(signal: [
                    Signal.neworderreceived,
                    Signal.chefaccept,
                    Signal.driveraccept,
                    Signal.chefstart,
                    Signal.cheffinished,
                    Signal.driverreceived,
                    Signal.clientreceived,
                    Signal.chefcancel,
                  ], isPreOrder: false),
                ),
                const SizedBox(width: CommonDimens.defaultGap),
                ActionButton(
                  onPressed: () {
                    setState(() {
                      _controller.animateToPage(widget.isHistory ? 3 : 2,
                          duration: CommonDimens.animationDuration,
                          curve: Curves.easeOut);
                      _index = widget.isHistory ? 3 : 2;
                    });
                    context.read<SignalRCubit>().removeSignals(signal: [
                      Signal.neworderreceived,
                      Signal.chefaccept,
                      Signal.driveraccept,
                      Signal.chefstart,
                      Signal.cheffinished,
                      Signal.driverreceived,
                      Signal.clientreceived,
                      Signal.chefcancel,
                    ]);
                  },
                  label: S.of(context).myPreOrder,
                  isActive: _index == 2 || _index == 3,
                  isNotificationIconShow: state.isSignalTriggered(signal: [
                    Signal.neworderreceived,
                    Signal.chefaccept,
                    Signal.driveraccept,
                    Signal.chefstart,
                    Signal.cheffinished,
                    Signal.driverreceived,
                    Signal.clientreceived,
                    Signal.chefcancel,
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
                create: (context) => OrderCubit(),
                child: NewsOrders(
                  menuTarget: MenuTarget.order,
                  apiKey: EndPoints.orderCustomerActive,
                  orderCardTargetPage: OrderCardTargetPage.customerOrders,
                  signals: const [
                    Signal.driveraccept,
                    Signal.chefaccept,
                    Signal.chefstart,
                    Signal.cheffinished,
                    Signal.driverreceived,
                    Signal.clientreceived,
                    Signal.chefcancel,
                  ],
                ),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
                child: NewsOrders(
                  menuTarget: MenuTarget.order,
                  apiKey: EndPoints.orderCustomerClosed,
                  orderCardTargetPage: OrderCardTargetPage.customerHistory,
                  signals: const [
                    Signal.clientreceived,
                    Signal.chefcancel,
                  ],
                ),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
                child: NewsOrders(
                  menuTarget: MenuTarget.preOrder,
                  apiKey: EndPoints.preOrderCustomerActive,
                  orderCardTargetPage: OrderCardTargetPage.customerPreOrders,
                  signals: const [
                    Signal.driveraccept,
                    Signal.chefaccept,
                    Signal.chefstart,
                    Signal.cheffinished,
                    Signal.driverreceived,
                    Signal.clientreceived,
                    Signal.chefcancel,
                  ],
                ),
              ),
              BlocProvider(
                create: (context) => OrderCubit(),
                child: NewsOrders(
                  menuTarget: MenuTarget.preOrder,
                  apiKey: EndPoints.preOrderCustomerClosed,
                  orderCardTargetPage: OrderCardTargetPage.customerHistory,
                  signals: const [
                    Signal.clientreceived,
                    Signal.chefcancel,
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
