import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/news/news_bloc.dart';
import 'package:yumi/bloc/order/order_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/model/order_model/order_model.dart';
import 'package:yumi/model/user/user_model.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/action_button.dart';
import 'package:yumi/template/news_orders.dart';

class ChefOrder extends StatelessWidget {
  ChefOrder({super.key, required this.controller, required this.menuTarget});

  PageController controller;
  MenuTarget menuTarget;

  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(const NewsEvent(selectedList: 1));

    return Column(
      children: [
        BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (menuTarget == MenuTarget.preOrder)
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
                  label: S.of(context).ready,
                  isActive: state.selectedList == 3,
                  onPressed: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent(selectedList: 3));
                    controller.jumpToPage(3);
                  },
                ),
                GestureDetector(
                  onTap: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent(selectedList: 4));
                    controller.jumpToPage(4);
                  },
                  child: SvgPicture.asset(
                    'assets/images/history.svg',
                    colorFilter: ColorFilter.mode(
                        state.selectedList == 4
                            ? ThemeSelector.colors.primary
                            : ThemeSelector.colors.secondary,
                        BlendMode.srcIn),
                  ),
                ),
              ],
            );
          },
        ),
        Expanded(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              BlocProvider(
                create: (context) => OrderBloc(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: ApiKeys.preOrderChefReceived,
                  orderCardTargetPage: OrderCardTargetPage.chefPending,
                  navFun: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent(selectedList: 1));
                    controller.jumpToPage(1);
                  },
                ),
              ),
              BlocProvider(
                create: (context) => OrderBloc(),
                child: NewsOrders(
                  menuTarget: menuTarget,
                  apiKey: menuTarget == MenuTarget.order
                      ? ApiKeys.orderChefReceived
                      : ApiKeys.preOrderChefAccepted,
                  orderCardTargetPage: OrderCardTargetPage.chefReceived,
                  navFun: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent(selectedList: 2));
                    controller.jumpToPage(2);
                    if (context.read<UserBloc>().state.user.status == 1) {
                      context.read<UserBloc>().add(
                          UserStatusUpdateEvent(statusEnum: StatusEnum.busy));
                    }
                  },
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
                  navFun: () {
                    context
                        .read<NewsBloc>()
                        .add(const NewsEvent(selectedList: 1));
                    controller.jumpToPage(1);
                    if (context.read<UserBloc>().state.user.status == 2) {
                      context.read<UserBloc>().add(
                          UserStatusUpdateEvent(statusEnum: StatusEnum.online));
                    }
                  },
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
