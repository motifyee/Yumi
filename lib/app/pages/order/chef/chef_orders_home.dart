import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:dependencies/dependencies.dart';
import 'package:yumi/app/components/page_view/cubit/page_view_cubit.dart';

import 'package:yumi/app/pages/order/widgets/chef_orders.dart';
import 'package:yumi/app/pages/order/widgets/location.dart';
import 'package:yumi/app/pages/order/widgets/news_guide.dart';
import 'package:yumi/app/pages/order/widgets/status_button.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  final PageController _controller = PageController(initialPage: 1);
  final OrderType orderType = OrderType.order;

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
              },
            );
          });
        }
      }
    });

    return BlocProvider(
      create: (context) => PageViewCubit(),
      child: Column(
        children: [
          const LocationWidget(),
          const SizedBox(height: CommonDimens.defaultGap),
          StatusButton(),
          const SizedBox(
            height: CommonDimens.defaultTitleGap,
          ),
          Expanded(
            child: ChefOrders(controller: _controller, orderType: orderType),
          ),
        ],
      ),
    );
  }
}
