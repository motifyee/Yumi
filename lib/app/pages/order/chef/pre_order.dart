import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:yumi/app/components/page_view/cubit/page_view_cubit.dart';
import 'package:yumi/app/pages/order/widgets/chef_orders.dart';
import 'package:common_code/domain/food_delivery/meal/entities/meal.dart';

class PreOrderScreen extends StatelessWidget {
  PreOrderScreen({super.key});

  final PageController controller = PageController(initialPage: 0);
  final OrderType menuTarget = OrderType.preOrder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageViewCubit(),
      child: ChefOrders(controller: controller, orderType: menuTarget),
    );
  }
}
