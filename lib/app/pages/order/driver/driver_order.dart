import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:dependencies/dependencies.dart';
import 'package:yumi/app/components/page_view/cubit/page_view_cubit.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/pages/order/cubit/order_cubit.dart';
import 'package:common_code/core/setup/signalr.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/app/pages/order/widgets/action_button.dart';
import 'package:yumi/app/pages/order/widgets/location.dart';
import 'package:yumi/app/pages/order/widgets/news_guide.dart';
import 'package:yumi/app/pages/order/widgets/news_orders.dart';
import 'package:yumi/app/pages/order/widgets/status_button.dart';

class DriverOrderScreen extends StatelessWidget {
  DriverOrderScreen({super.key, required this.menuTarget});

  final MenuTarget menuTarget;

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    bool isShown = false;
    if (menuTarget == MenuTarget.order) {
      LocalStorage.sharedRef.getValue(LocalStorage.newsGuide).then((res) {
        if (res != true) {
          if (!isShown) {
            isShown = true;
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return const NewsGuide();
                  });
            });
          }
        }
      });
    }

    return BlocProvider(
      create: (context) => PageViewCubit(),
      child: Column(
        children: [
          const LocationWidget(),
          const SizedBox(height: CommonDimens.defaultGap),
          if (menuTarget == MenuTarget.order) StatusButton(),
          BlocBuilder<SignalRCubit, SignalRState>(
            builder: (context, states) {
              return BlocBuilder<PageViewCubit, PageViewState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionButton(
                        key: key,
                        label: S.of(context).available,
                        isActive: state.selectedList == 0,
                        isNotificationIconShow: states.isSignalTriggered(
                            signal: [Signal.neworderreceived],
                            isPreOrder: menuTarget == MenuTarget.preOrder),
                        onPressed: () {
                          context
                              .read<PageViewCubit>()
                              .updateSelect(selectedList: 0);
                          _controller.jumpToPage(0);
                          context
                              .read<SignalRCubit>()
                              .removeSignals(signal: [Signal.neworderreceived]);
                        },
                      ),
                      const SizedBox(width: CommonDimens.defaultBlockGap),
                      ActionButton(
                        key: key,
                        label: S.of(context).active,
                        isActive: state.selectedList == 1,
                        isNotificationIconShow:
                            states.isSignalTriggered(signal: [
                          Signal.chefstart,
                          Signal.cheffinished,
                          Signal.driverreceived,
                          Signal.clientreceived,
                        ], isPreOrder: menuTarget == MenuTarget.preOrder),
                        onPressed: () {
                          context
                              .read<PageViewCubit>()
                              .updateSelect(selectedList: 1);
                          _controller.jumpToPage(1);
                          context.read<SignalRCubit>().removeSignals(signal: [
                            Signal.chefstart,
                            Signal.cheffinished,
                            Signal.driverreceived,
                            Signal.clientreceived,
                          ]);
                        },
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
              controller: _controller,
              children: [
                BlocBuilder<UserCubit, UserState>(
                  builder: (context, state) {
                    return state.user.status != 1 &&
                            menuTarget == MenuTarget.order
                        ? Center(
                            child: Padding(
                              padding: const EdgeInsets.all(
                                  CommonDimens.defaultMediumGap),
                              child: Text(
                                S
                                    .of(context)
                                    .toReceiveOrdersChangYourStatusToOnline,
                                softWrap: true,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : BlocProvider(
                            create: (context) => OrderCubit(),
                            child: NewsOrders(
                              menuTarget: menuTarget,
                              apiKey: menuTarget == MenuTarget.order
                                  ? EndPoints.orderDriverAvailable
                                  : EndPoints.preOrderDriverAvailable,
                              orderCardTargetPage:
                                  OrderCardTargetPage.driverAccept,
                              signals: const [
                                Signal.neworderreceived,
                                Signal.driveraccept
                              ],
                            ),
                          );
                  },
                ),
                BlocProvider(
                  create: (context) => OrderCubit(),
                  child: NewsOrders(
                    menuTarget: menuTarget,
                    apiKey: menuTarget == MenuTarget.order
                        ? EndPoints.orderDriverActive
                        : EndPoints.preOrderDriverActive,
                    orderCardTargetPage: OrderCardTargetPage.driverReceived,
                    signals: const [
                      Signal.chefstart,
                      Signal.cheffinished,
                      Signal.driverreceived,
                      Signal.clientreceived,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
