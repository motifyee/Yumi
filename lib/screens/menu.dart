import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/template/menu_template.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MealListBloc()
              ..add(MealListResetEvent(menuTarget: MenuTarget.order))),
        BlocProvider(create: (context) => CategoriesBloc()),
      ],
      child: const MenuTemplate(
        menuTarget: MenuTarget.order,
      ),
    );
  }
}
