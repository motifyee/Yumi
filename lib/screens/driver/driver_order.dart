import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/news/news_bloc.dart';
import 'package:yumi/bloc/order/order_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/model/order_model/order_model.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/local_storage.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/action_button.dart';
import 'package:yumi/template/location.dart';
import 'package:yumi/template/news_guide.dart';
import 'package:yumi/template/news_orders.dart';
import 'package:yumi/template/status_button.dart';

class DriverOrderScreen extends StatelessWidget {
  DriverOrderScreen({super.key, required this.menuTarget});

  final MenuTarget menuTarget;

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    bool isShown = false;
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

    return BlocProvider(
      create: (context) => NewsBloc(),
      child: Column(
        children: [
          const Location(),
          SizedBox(height: ThemeSelector.statics.defaultGap),
          StatusButton(),
          BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActionButton(
                    key: key,
                    label: S.of(context).available,
                    isActive: state.selectedList == 0,
                    onPressed: () {
                      context
                          .read<NewsBloc>()
                          .add(const NewsEvent(selectedList: 0));
                      _controller.jumpToPage(0);
                    },
                  ),
                  SizedBox(width: ThemeSelector.statics.defaultBlockGap),
                  ActionButton(
                    key: key,
                    label: S.of(context).active,
                    isActive: state.selectedList == 1,
                    onPressed: () {
                      context
                          .read<NewsBloc>()
                          .add(const NewsEvent(selectedList: 1));
                      _controller.jumpToPage(1);
                    },
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
                    menuTarget: menuTarget,
                    apiKey: menuTarget == MenuTarget.order
                        ? ApiKeys.orderDriverAvailable
                        : ApiKeys.preOrderDriverAvailable,
                    orderCardTargetPage: OrderCardTargetPage.driverAccept,
                  ),
                ),
                BlocProvider(
                  create: (context) => OrderBloc(),
                  child: NewsOrders(
                    menuTarget: menuTarget,
                    apiKey: menuTarget == MenuTarget.order
                        ? ApiKeys.orderDriverActive
                        : ApiKeys.preOrderDriverActive,
                    orderCardTargetPage: OrderCardTargetPage.driverReceived,
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
