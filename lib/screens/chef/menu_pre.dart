import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/menu_template.dart';

@RoutePage()
class MenuPreOrderScreen extends StatelessWidget {
  const MenuPreOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          SizedBox(
            width: ThemeSelector.statics.defaultTitleGap,
          )
        ],
        title: Center(
          child: Text(
            S.of(context).menuPreOrders,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontSize: ThemeSelector.fonts.font_14),
          ),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => MealListBloc()
                ..add(MealListResetEvent(menuTarget: MenuTarget.preOrder))),
          BlocProvider(create: (context) => CategoriesBloc()),
        ],
        child: MenuTemplate(
          menuTarget: MenuTarget.preOrder,
        ),
      ),
    );
  }
}