import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/basket/basket_form_bloc.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/chef_meal_basket_card.dart';
import 'package:yumi/template/pagination_template.dart';

class ChefMealsScreen extends StatefulWidget {
  ChefMealsScreen(
      {super.key,
      required this.menuTarget,
      required this.chefId,
      required this.isPickUpOnly});

  final MenuTarget menuTarget;
  final String chefId;
  final bool isPickUpOnly;

  @override
  State<ChefMealsScreen> createState() => _ChefMealsScreenState();
}

class _ChefMealsScreenState extends State<ChefMealsScreen> {
  final PageController favPageController = PageController(initialPage: 0);
  int pageIndex = 0;

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
              Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: SvgPicture.asset(
                  'assets/images/chef_meals_list_icon.svg',
                  height: ThemeSelector.statics.defaultInputGap,
                  colorFilter: ColorFilter.mode(
                      ThemeSelector.colors.secondary, BlendMode.srcIn),
                ),
              ),
              SizedBox(width: ThemeSelector.statics.defaultGap),
              Text(
                pageIndex == 0
                    ? S.of(context).chefMenu
                    : S.of(context).chefCuisines,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  setState(() {
                    favPageController.jumpToPage(0);
                    pageIndex = 0;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultInputGap),
                  child: SvgPicture.asset(
                    'assets/images/chef_meals_list.svg',
                    colorFilter: ColorFilter.mode(
                        pageIndex == 0
                            ? ThemeSelector.colors.primary
                            : ThemeSelector.colors.secondary,
                        BlendMode.srcIn),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    favPageController.jumpToPage(1);
                    pageIndex = 1;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultInputGap),
                  child: SvgPicture.asset(
                    'assets/images/meals.svg',
                    colorFilter: ColorFilter.mode(
                        pageIndex == 0
                            ? ThemeSelector.colors.secondary
                            : ThemeSelector.colors.primary,
                        BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: ThemeSelector.statics.defaultGap),
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => MealListBloc()),
              BlocProvider(create: (context) => CategoriesBloc()),
            ],
            child: Builder(builder: (context) {
              return Expanded(
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
                                menuTarget: widget.menuTarget,
                                chefId: widget.chefId,
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
                                                .basket
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
                                                  isPickUpOnly:
                                                      widget.isPickUpOnly,
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
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      favPageController.jumpToPage(0);
                                      pageIndex = 0;
                                    });
                                    context
                                        .read<MealListBloc>()
                                        .add(MealListResetEvent());
                                    context
                                        .read<MealListBloc>()
                                        .add(MealListUpdateCategoryEvent(
                                          context: context,
                                          selectedCategory: category.id ?? 0,
                                          chefId: widget.chefId,
                                        ));
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            ThemeSelector.statics.defaultGap),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: ThemeSelector.statics
                                                .defaultImageHeightSmall,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    ThemeSelector
                                                        .statics.defaultGap),
                                                topRight: Radius.circular(
                                                    ThemeSelector
                                                        .statics.defaultGap),
                                              ),
                                            ),
                                            child: Image.memory(
                                              base64Decode(
                                                category.image ?? '',
                                              ),
                                              fit: BoxFit.cover,
                                              alignment: Alignment.topCenter,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/354.jpeg',
                                                fit: BoxFit.cover,
                                                alignment: Alignment.topCenter,
                                              ),
                                            )),
                                        SizedBox(
                                            height: ThemeSelector
                                                .statics.defaultGap),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: ThemeSelector
                                                  .statics.defaultGap),
                                          child: Text(
                                            category.name ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                        ),
                                        SizedBox(
                                            height: ThemeSelector
                                                .statics.defaultGap),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
