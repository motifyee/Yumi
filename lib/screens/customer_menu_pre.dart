import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/chefs/chefs_list_bloc.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/template/customer_news.dart';

class CustomerMenuPreScreen extends StatelessWidget {
  const CustomerMenuPreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ChefsListBloc>().add(ResetChefsListEvent());
    return CustomerNews(
      menuTarget: MenuTarget.preOrder,
    );
  }
}
