import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/basket/basket_form_bloc.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/invoice_model.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/chef_meal_basket_card.dart';
import 'package:yumi/template/pagination_template.dart';

class ChefMealsScreen extends StatelessWidget {
  ChefMealsScreen({super.key, required this.menuTarget, required this.chefId});

  final PageController favPageController = PageController(initialPage: 0);

  final MenuTarget menuTarget;
  final String chefId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ThemeSelector.colors.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
                ThemeSelector.statics.defaultBorderRadiusExtreme),
            topRight: Radius.circular(
                ThemeSelector.statics.defaultBorderRadiusExtreme),
          )),
      padding: EdgeInsets.only(
        top: ThemeSelector.statics.defaultGapExtreme,
        left: ThemeSelector.statics.defaultBlockGap,
        right: ThemeSelector.statics.defaultBlockGap,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/images/chef_meals_list_icon.svg',
                height: ThemeSelector.statics.defaultInputGap,
                colorFilter: ColorFilter.mode(
                    ThemeSelector.colors.secondary, BlendMode.srcIn),
              ),
              SizedBox(width: ThemeSelector.statics.defaultGap),
              Text(
                S.of(context).chefMenu,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  favPageController.jumpToPage(0);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultInputGap),
                  child: SvgPicture.asset(
                    'assets/images/chef_meals_list.svg',
                    colorFilter: ColorFilter.mode(
                        ThemeSelector.colors.primary, BlendMode.srcIn),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  favPageController.jumpToPage(1);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultInputGap),
                  child: SvgPicture.asset(
                    'assets/images/meals.svg',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ThemeSelector.statics.defaultGap),
          Expanded(
            child: PageView(
              controller: favPageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                PaginationTemplate(
                  scrollDirection: Axis.vertical,
                  loadDate: () {
                    context.read<MealListBloc>().add(
                          MealListUpdateEvent(
                            context: context,
                            menuTarget: menuTarget,
                            chefId: chefId,
                          ),
                        );
                  },
                  child: BlocConsumer<MealListBloc, MealListState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ThemeSelector.statics.defaultGap),
                        child: Column(
                          children: [
                            for (var meal in state.meals)
                              BlocConsumer<BasketFormBloc, BasketFormState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  return ChefMealBasketCard(
                                    meal: meal,
                                    isDisabled: context
                                            .read<BasketFormBloc>()
                                            .state
                                            .invoice
                                            .invoiceDetails!
                                            .firstWhereOrNull((e) =>
                                                e.productVarintId ==
                                                meal.productVariantID) !=
                                        null,
                                    onTap: () {
                                      context.read<BasketFormBloc>().add(
                                            BasketFormAddMealEvent(
                                              invoiceDetails:
                                                  InvoiceDetails.fromMeal(
                                                      meal: meal),
                                            ),
                                          );
                                    },
                                  );
                                },
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                PaginationTemplate(
                  loadDate: () {
                    context.read<CategoriesBloc>().add(GetCategoriesEvent(
                        context: context, isPreOrder: false));
                  },
                  scrollDirection: Axis.vertical,
                  child: BlocConsumer<CategoriesBloc, CategoriesState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      return Column(
                        children: [
                          for (var category in state.categoriesModelList)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ThemeSelector.statics.defaultGap),
                              child: Column(
                                children: [
                                  Container(
                                    width: ThemeSelector
                                        .statics.defaultGapExtraExtreme,
                                    height:
                                        ThemeSelector.statics.defaultGapXXXL,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          ThemeSelector.statics.defaultGap),
                                    ),
                                    child: category.image != null
                                        ? Image.memory(
                                            base64Decode(
                                              category.image ?? '',
                                            ),
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topCenter,
                                          )
                                        : Image.asset(
                                            'assets/images/354'
                                            '.jpeg',
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topCenter,
                                          ),
                                  ),
                                  SizedBox(
                                      height: ThemeSelector.statics.defaultGap),
                                  Text(
                                    category.name ?? '',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  )
                                ],
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
