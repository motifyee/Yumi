import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/news/news_bloc.dart';
import 'package:yumi/app/pages/order/widgets/chef_order.dart';
import 'package:yumi/domain/meal/entities/meal.dart';

class PreOrderScreen extends StatelessWidget {
  PreOrderScreen({super.key});

  final PageController controller = PageController(initialPage: 0);
  final MenuTarget menuTarget = MenuTarget.preOrder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(),
      child: ChefOrder(controller: controller, menuTarget: menuTarget),
    );
  }
}
