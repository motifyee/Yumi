import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/extensions/capitalize_string_extension.dart';
import 'package:yumi/forms/meal_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/service/meal_service.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/delete_dialog.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/text_currency.dart';

class MealCard extends StatelessWidget {
  MealCard({super.key, required this.meal, required this.menuTarget});

  MealModel meal;
  MenuTarget menuTarget;
  bool isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.symmetric(
        horizontal: ThemeSelector.statics.defaultInputGap,
        vertical: ThemeSelector.statics.defaultGap,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ThemeSelector.statics.defaultLineGap,
              vertical: ThemeSelector.statics.defaultGap,
            ),
            decoration: BoxDecoration(
                color: ThemeSelector.colors.backgroundTant,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                        ThemeSelector.statics.defaultBorderRadiusExtraLarge),
                    bottomLeft: Radius.circular(
                        ThemeSelector.statics.defaultBorderRadiusExtraLarge)),
                boxShadow: [
                  BoxShadow(color: ThemeSelector.colors.shadow, blurRadius: 3)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ThemeSelector.statics.defaultLineGap),
                Container(
                    width: ThemeSelector.statics.iconSizeLarge,
                    height: ThemeSelector.statics.iconSizeLarge,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            ThemeSelector.statics.defaultBorderRadiusSmall)),
                    child: Image.memory(
                      Uri.parse(meal.photo ?? '').data?.contentAsBytes() ??
                          Uint8List(0),
                      errorBuilder: (context, error, stackTrace) =>
                          Image.asset('assets/images/354.jpeg'),
                    )),
                SizedBox(height: ThemeSelector.statics.defaultGap),
                Text(
                  meal.name?.capitalize() ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: ThemeSelector.statics.defaultGap),
                Text(
                  meal.ingredients
                          ?.map((e) => '${e.portionGrams} ${e.name}')
                          .join(', ') ??
                      '',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: ThemeSelector.fonts.font_9,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(height: ThemeSelector.statics.defaultGap),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextCurrency(
                      value: double.tryParse(meal.price1 ?? '0') ?? 0.0,
                      fontSize: ThemeSelector.fonts.font_18,
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
                      context.read<CategoriesBloc>().add(ResetCategoryEvent());

                      context.read<CategoriesBloc>().add(GetCategoriesEvent(
                          context: context,
                          isPreOrder: menuTarget == MenuTarget.preOrder,
                          isAll: false));
                      context
                          .read<MealListBloc>()
                          .add(MealListResetEvent(menuTarget: menuTarget));
                      context.read<MealListBloc>().add(
                            MealListUpdateEvent(
                              context: context,
                              chefId:
                                  context.read<UserBloc>().state.user.chefId,
                            ),
                          );
                    });
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/pin.svg',
                        width: ThemeSelector.fonts.font_10,
                        height: ThemeSelector.fonts.font_10,
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

                                return await MealService.deleteMeal(
                                        context: context, mealModel: meal)
                                    .then((res) {
                                  context
                                      .read<CategoriesBloc>()
                                      .add(ResetCategoryEvent());

                                  context.read<CategoriesBloc>().add(
                                      GetCategoriesEvent(
                                          context: context,
                                          isPreOrder: meal.isPreOrder == true,
                                          isAll: false));
                                  context.read<MealListBloc>().add(
                                      MealListResetEvent(
                                          menuTarget: meal.isPreOrder == true
                                              ? MenuTarget.preOrder
                                              : MenuTarget.order));
                                  context.read<MealListBloc>().add(
                                        MealListUpdateEvent(
                                          context: context,
                                          chefId: context
                                              .read<UserBloc>()
                                              .state
                                              .user
                                              .chefId,
                                        ),
                                      );
                                  Navigator.of(context).pop();
                                  return true;
                                }).catchError((err) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: SnackBarMassage(
                                        massage: (err as DioException)
                                            .response
                                            ?.data['message'],
                                      ),
                                    ),
                                  );
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
                        width: ThemeSelector.fonts.font_10,
                        height: ThemeSelector.fonts.font_10,
                      ),
                      const Text(' '),
                      Text(
                        'Remove',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: ThemeSelector.fonts.font_10,
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
