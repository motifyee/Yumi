import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/menu/cubit/categories/categories_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_cubit.dart';
import 'package:yumi/domain/meal/entities/meal.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/menu/widgets/menu_template.dart';

@RoutePage()
class MenuPreOrderScreen extends StatelessWidget {
  const MenuPreOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: const [
          SizedBox(
            width: CommonDimens.defaultTitleGap,
          )
        ],
        title: Center(
          child: Text(
            S.of(context).menuPreOrders,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontSize: CommonFontSize.font_14),
          ),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  MealCubit()..reset(menuTarget: MenuTarget.preOrder)),
          BlocProvider(create: (context) => CategoriesCubit()),
        ],
        child: const MenuTemplate(
          menuTarget: MenuTarget.preOrder,
        ),
      ),
    );
  }
}
