import 'dart:typed_data';

import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/categories/categories_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_cubit.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/menu/widgets/chef_meal_basket_card.dart';

class ChefMealsScreen extends StatefulWidget {
  const ChefMealsScreen(
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
          color: CommonColors.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(CommonDimens.defaultBorderRadiusExtreme),
            topRight: Radius.circular(CommonDimens.defaultBorderRadiusExtreme),
          )),
      padding: const EdgeInsets.only(
        top: CommonDimens.defaultGapExtreme,
        left: CommonDimens.defaultBlockGap,
        right: CommonDimens.defaultBlockGap,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: SvgPicture.asset(
                  'assets/images/chef_meals_list_icon.svg',
                  height: CommonDimens.defaultInputGap,
                  colorFilter:
                      ColorFilter.mode(CommonColors.secondary, BlendMode.srcIn),
                ),
              ),
              const SizedBox(width: CommonDimens.defaultGap),
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
                    favPageController.animateToPage(0, duration: ThemeSelector.statics.animationDuration, curve: Curves.easeOut);
                    pageIndex = 0;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: CommonDimens.defaultInputGap),
                  child: SvgPicture.asset(
                    'assets/images/chef_meals_list.svg',
                    colorFilter: ColorFilter.mode(
                        pageIndex == 0
                            ? CommonColors.primary
                            : CommonColors.secondary,
                        BlendMode.srcIn),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    favPageController.animateToPage(1, duration: ThemeSelector.statics.animationDuration, curve: Curves.easeOut);
                    pageIndex = 1;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: CommonDimens.defaultInputGap),
                  child: SvgPicture.asset(
                    'assets/images/meals.svg',
                    colorFilter: ColorFilter.mode(
                        pageIndex == 0
                            ? CommonColors.secondary
                            : CommonColors.primary,
                        BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: CommonDimens.defaultGap),
          MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => MealCubit()),
              BlocProvider(create: (context) => CategoriesCubit()),
            ],
            child: Builder(builder: (context) {
              return Expanded(
                child: PageView(
                  controller: favPageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    PaginationTemplate(
                      scrollDirection: Axis.vertical,
                      loadDate: () {
                        context.read<MealCubit>().updateMeals(
                            menuTarget: widget.menuTarget,
                            chefId: widget.chefId);
                      },
                      child: BlocConsumer<MealCubit, MealState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: CommonDimens.defaultGap),
                            child: Column(
                              children: [
                                for (Meal meal in state.pagination.data)
                                  BlocConsumer<BasketCubit, BasketState>(
                                    listener: (context, state) {},
                                    builder: (context, state) {
                                      return ChefMealBasketCard(
                                        meal: meal,
                                        isDisabled: context
                                            .read<BasketCubit>()
                                            .state
                                            .basket
                                            .invoiceDetails
                                            .any((e) =>
                                                e.productVarintId ==
                                                meal.productVariantID),
                                        onTap: () {
                                          context
                                              .read<BasketCubit>()
                                              .addMeal(meal: meal);
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
                        context
                            .read<CategoriesCubit>()
                            .getAllCategories(isPreOrder: false);
                        // .add(GetCategoriesEvent(context: context, isPreOrder: false));
                      },
                      scrollDirection: Axis.vertical,
                      child: BlocConsumer<CategoriesCubit, CategoriesState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return Column(
                            children: [
                              for (var category in state.categoriesPage.data)
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      favPageController.animateToPage(0, duration: ThemeSelector.statics.animationDuration, curve: Curves.easeOut);
                                      pageIndex = 0;
                                    });
                                    context.read<MealCubit>().reset();
                                    context.read<MealCubit>().updateCategory(
                                          selectedCategory: category.id ?? 0,
                                          chefId: widget.chefId,
                                        );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: CommonDimens.defaultGap),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: CommonDimens
                                                .defaultImageHeightSmall,
                                            clipBehavior: Clip.hardEdge,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    CommonDimens.defaultGap),
                                                topRight: Radius.circular(
                                                    CommonDimens.defaultGap),
                                              ),
                                            ),
                                            child: Image.memory(
                                              Uri.parse(category.image ?? '')
                                                      .data
                                                      ?.contentAsBytes() ??
                                                  Uint8List(0),
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
                                        const SizedBox(
                                            height: CommonDimens.defaultGap),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal:
                                                  CommonDimens.defaultGap),
                                          child: Text(
                                            category.name ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                        ),
                                        const SizedBox(
                                            height: CommonDimens.defaultGap),
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
