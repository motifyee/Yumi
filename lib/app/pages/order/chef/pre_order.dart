import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:yumi/app/components/page_view/cubit/page_view_cubit.dart';
import 'package:yumi/app/pages/order/widgets/chef_order.dart';
import 'package:common_code/domain/food_delivery/meal/entities/meal.dart';

class PreOrderScreen extends StatelessWidget {
  PreOrderScreen({super.key});

  final PageController controller = PageController(initialPage: 0);
  final MenuTarget menuTarget = MenuTarget.preOrder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageViewCubit(),
      child: ChefOrder(controller: controller, menuTarget: menuTarget),
    );
  }
}
