import 'dart:typed_data';

import 'package:common_code/common_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/menu/cubit/categories/categories_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_cubit.dart';
import 'package:common_code/domain/food_delivery/meal/entities/meal.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/app/pages/menu/widgets/meal_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/menu/widgets/delete_dialog.dart';

class MealCard extends StatelessWidget {
  MealCard({super.key, required this.meal, required this.menuTarget});

  Meal meal;
  MenuTarget menuTarget;
  bool isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: const EdgeInsets.symmetric(
        horizontal: CommonDimens.defaultInputGap,
        vertical: CommonDimens.defaultGap,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: CommonDimens.defaultLineGap,
              vertical: CommonDimens.defaultGap,
            ),
            decoration: BoxDecoration(
                color: CommonColors.backgroundTant,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(CommonDimens.defaultBorderRadiusExtraLarge), bottomLeft: Radius.circular(CommonDimens.defaultBorderRadiusExtraLarge)),
                boxShadow: [BoxShadow(color: CommonColors.shadow, blurRadius: 3)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: CommonDimens.defaultLineGap),
                Container(
                    width: CommonDimens.iconSizeLarge,
                    height: CommonDimens.iconSizeLarge,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(CommonDimens.defaultBorderRadiusSmall)),
                    child: Image.memory(
                      Uri.parse(meal.photo ?? '').data?.contentAsBytes() ?? Uint8List(0),
                      errorBuilder: (context, error, stackTrace) => Image.asset('assets/images/354.jpeg'),
                    )),
                const SizedBox(height: CommonDimens.defaultGap),
                Text(
                  meal.name?.capitalize() ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: CommonDimens.defaultGap),
                Text(
                  meal.ingredients?.map((e) => '${e.portionGrams} ${e.name}').join(', ') ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: CommonFontSize.font_9, fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: CommonDimens.defaultGap),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextCurrency(
                      value: meal.price1 ?? 0,
                      fontSize: CommonFontSize.font_18,
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => DialogContainer(
                              child: MealForm(
                                meal: meal,
                                menuTarget: menuTarget,
                              ),
                            )).then((onValue) {
                      context.read<CategoriesCubit>().reset();
                      // .add(ResetCategoryEvent());

                      context.read<CategoriesCubit>().getChefCategories(
                            isPreOrder: menuTarget == MenuTarget.preOrder,
                          );
                      // .add(GetCategoriesEvent(
                      //     context: context,
                      //     isPreOrder: menuTarget == MenuTarget.preOrder,
                      //     isAll: false));
                      context.read<MealCubit>().reset(menuTarget: menuTarget);
                      context.read<MealCubit>().updateMeals(chefId: context.read<UserCubit>().state.user.chefId, menuTarget: menuTarget);
                    });
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/pin.svg',
                        width: CommonFontSize.font_10,
                        height: CommonFontSize.font_10,
                      ),
                      const Text(' '),
                      Text(
                        'Edit',
                        style: Theme.of(context).textTheme.displayMedium,
                      )
                    ],
                  )),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => DeleteDialogTemplate(
                              actions: () async {
                                if (isDeleting) return true;
                                isDeleting = true;

                                final task = await DeleteMeal().call(DeleteMealParams(meal: meal));

                                return task.fold((l) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: SnackBarMassage(
                                        massage: (l as DioException).response?.data['message'],
                                      ),
                                    ),
                                  );
                                  return true;
                                }, (r) {
                                  context.read<CategoriesCubit>().reset();

                                  context.read<CategoriesCubit>().getChefCategories(
                                        isPreOrder: meal.isPreOrder == true,
                                      );

                                  context.read<MealCubit>().reset(menuTarget: meal.isPreOrder == true ? MenuTarget.preOrder : MenuTarget.order);
                                  context.read<MealCubit>().updateMeals(chefId: context.read<UserCubit>().state.user.chefId, menuTarget: menuTarget);
                                  Navigator.of(context).pop();
                                  return true;
                                });
                              },
                              title: S.of(context).deleteMeal,
                              content: S.of(context).areYouSureToDeleteAMeal,
                            ));
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/trash.svg',
                        width: CommonFontSize.font_10,
                        height: CommonFontSize.font_10,
                      ),
                      const Text(' '),
                      Text(
                        'Remove',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: CommonFontSize.font_10,
                            ),
                      )
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
