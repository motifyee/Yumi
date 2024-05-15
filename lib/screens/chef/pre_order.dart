import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/news/news_bloc.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/template/chef_order.dart';

class PreOrderScreen extends StatelessWidget {
  PreOrderScreen({super.key});

  final PageController _controller = PageController(initialPage: 1);
  final MenuTarget _menuTarget = MenuTarget.preOrder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(),
      child: ChefOrder(controller: _controller, menuTarget: _menuTarget),
    );
  }
}
