import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/menu/cubit/categories/cubit/categories_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/app/pages/menu/meal.dart';
import 'package:yumi/app/pages/menu/widgets/menu_template.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MealListBloc()
              ..add(MealListResetEvent(menuTarget: MenuTarget.order))),
        BlocProvider(create: (context) => CategoriesCubit()),
      ],
      child: const MenuTemplate(
        menuTarget: MenuTarget.order,
      ),
    );
  }
}
