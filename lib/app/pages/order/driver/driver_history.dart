import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/components/page_view/cubit/page_view_cubit.dart';
import 'package:yumi/app/pages/order/cubit/order_cubit.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/app/pages/order/widgets/action_button.dart';
import 'package:yumi/app/pages/order/widgets/news_orders.dart';

class DriverHistoryScreen extends StatelessWidget {
  DriverHistoryScreen({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageViewCubit(),
      child: Column(
        children: [
          BlocBuilder<PageViewCubit, PageViewState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActionButton(
                    key: key,
                    label: S.of(context).orders,
                    isActive: state.selectedList == 0,
                    onPressed: () {
                      context.read<PageViewCubit>().updateSelect(selectedList: 0);
                      _controller.jumpToPage(0);
                    },
                  ),
                  const SizedBox(width: CommonDimens.defaultBlockGap),
                  ActionButton(
                    key: key,
                    label: S.of(context).preOrder,
                    isActive: state.selectedList == 1,
                    onPressed: () {
                      context.read<PageViewCubit>().updateSelect(selectedList: 1);
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
                  create: (context) => OrderCubit(),
                  child: NewsOrders(
                    menuTarget: MenuTarget.order,
                    apiKey: EndPoints.orderDriverClosed,
                    orderCardTargetPage: OrderCardTargetPage.driverHistory,
                  ),
                ),
                BlocProvider(
                  create: (context) => OrderCubit(),
                  child: NewsOrders(
                    menuTarget: MenuTarget.preOrder,
                    apiKey: EndPoints.preOrderDriverClosed,
                    orderCardTargetPage: OrderCardTargetPage.driverHistory,
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
