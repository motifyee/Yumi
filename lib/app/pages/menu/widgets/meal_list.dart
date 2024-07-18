import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/categories/categories_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_cubit.dart';
import 'package:yumi/domain/basket/entity/invoice_detail.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/app/pages/menu/widgets/customer_pre_order_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/menu/widgets/meal_list_card.dart';

class MealListScreen extends StatelessWidget {
  MealListScreen(
      {super.key,
      required this.menuTarget,
      this.categoryId,
      this.isResetOnInit = true});

  final PageController favPageController = PageController(initialPage: 0);

  final MenuTarget menuTarget;
  final int? categoryId;
  final bool isResetOnInit;

  @override
  Widget build(BuildContext context) {
    if (isResetOnInit) {
      context
          .read<MealCubit>()
          .reset(menuTarget: menuTarget, categoryId: categoryId);
      context.read<CategoriesCubit>().reset();
    }
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
      child: PageView(
        controller: favPageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _MealList(
              favPageController: favPageController, menuTarget: menuTarget),
          _CategoriesList(
              favPageController: favPageController, menuTarget: menuTarget),
        ],
      ),
    );
  }
}

class _MealList extends StatelessWidget {
  const _MealList({required this.favPageController, required this.menuTarget});

  final PageController favPageController;
  final MenuTarget menuTarget;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              S.of(context).dishName,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            BlocBuilder<MealCubit, MealState>(
              builder: (context, state) {
                String category = context
                        .read<CategoriesCubit>()
                        .state
                        .categoriesPage
                        .data
                        .firstWhereOrNull((e) => e.id == state.selectedCategory)
                        ?.name ??
                    '';
                return Expanded(
                    child: category.isEmpty
                        ? const SizedBox.shrink()
                        : Row(
                            children: [
                              const SizedBox(
                                  width: CommonDimens.defaultMicroGap),
                              GestureDetector(
                                onTap: () {
                                  context.read<MealCubit>().reset();
                                  context
                                      .read<MealCubit>()
                                      .updateCategory(selectedCategory: 0);
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(
                                        CommonDimens.defaultMicroGap),
                                    decoration: BoxDecoration(
                                        color: CommonColors.backgroundTant,
                                        borderRadius: BorderRadius.circular(
                                            CommonDimens.defaultMicroGap)),
                                    child: Row(
                                      children: [
                                        Text(
                                          category,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                        const SizedBox(
                                            width:
                                                CommonDimens.defaultMicroGap),
                                        Text(
                                          'x',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ));
              },
            ),
            GestureDetector(
              onTap: () {
                favPageController.animateToPage(0,
                    duration: CommonDimens.animationDuration,
                    curve: Curves.easeOut);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: CommonDimens.defaultInputGap),
                child: SvgPicture.asset(
                  'assets/images/chef_meals_list.svg',
                  colorFilter:
                      ColorFilter.mode(CommonColors.primary, BlendMode.srcIn),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                favPageController.animateToPage(1,
                    duration: CommonDimens.animationDuration,
                    curve: Curves.easeOut);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: CommonDimens.defaultInputGap),
                child: SvgPicture.asset(
                  'assets/images/meals.svg',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: CommonDimens.defaultGap),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) => PaginationTemplate(
              scrollDirection: Axis.vertical,
              loadDate: () {
                context.read<MealCubit>().updateMeals(
                      menuTarget: menuTarget,
                    );
              },
              child: BlocConsumer<MealCubit, MealState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: CommonDimens.defaultGap),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            for (Meal meal in state.pagination.data)
                              MealListCard(
                                meal: meal,
                                onTap: () {
                                  if (meal.isPreOrder == true) {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) =>
                                          CustomerPreOrderForm(
                                        meal: meal,
                                        chef: Chef(id: meal.chefId),
                                        isPickUpOnly:
                                            meal.isPickUpOnly ?? false,
                                      ),
                                    );
                                  } else {
                                    context.read<BasketCubit>().createBasket(
                                        basket: context
                                            .read<BasketCubit>()
                                            .state
                                            .basket
                                            .copyWith(
                                              isPreorder: false,
                                              isSchedule: false,
                                              shippedAddressId: context
                                                  .read<UserCubit>()
                                                  .state
                                                  .address
                                                  ?.id,
                                              isPickupOnly:
                                                  meal.isPickUpOnly ?? false,
                                              invoiceDetails: [
                                                InvoiceDetail.fromMeal(
                                                    meal: meal)
                                              ],
                                              invoice: context
                                                  .read<BasketCubit>()
                                                  .state
                                                  .basket
                                                  .invoice
                                                  .copyWith(
                                                    chefID: meal.chefId,
                                                  ),
                                            ));
                                  }
                                },
                              ),
                            if (state.pagination.isLoading)
                              const Expanded(child: PacmanLoadingWidget()),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CategoriesList extends StatelessWidget {
  const _CategoriesList(
      {required this.favPageController, required this.menuTarget});

  final PageController favPageController;
  final MenuTarget menuTarget;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              S.of(context).cuisines,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                favPageController.animateToPage(0,
                    duration: CommonDimens.animationDuration,
                    curve: Curves.easeOut);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: CommonDimens.defaultInputGap),
                child: SvgPicture.asset(
                  'assets/images/chef_meals_list.svg',
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                favPageController.animateToPage(1,
                    duration: CommonDimens.animationDuration,
                    curve: Curves.easeOut);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: CommonDimens.defaultInputGap),
                child: SvgPicture.asset(
                  'assets/images/meals.svg',
                  colorFilter:
                      ColorFilter.mode(CommonColors.primary, BlendMode.srcIn),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: CommonDimens.defaultGap),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) => PaginationTemplate(
              loadDate: () {
                context.read<CategoriesCubit>().getAllCategories(
                      isPreOrder: menuTarget == MenuTarget.preOrder,
                    );
                // .add(GetCategoriesEvent(
                //     context: context,
                //     isPreOrder: menuTarget == MenuTarget.preOrder));
              },
              scrollDirection: Axis.vertical,
              child: BlocConsumer<CategoriesCubit, CategoriesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          for (var category in state.categoriesPage.data)
                            GestureDetector(
                              onTap: () {
                                context.read<MealCubit>().reset();
                                context.read<MealCubit>().updateCategory(
                                    selectedCategory: category.id ?? 0);
                                favPageController.animateToPage(0,
                                    duration: CommonDimens.animationDuration,
                                    curve: Curves.easeOut);
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: CommonDimens.defaultGap),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                          errorBuilder:
                                              (context, error, stackTrace) =>
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
                                          horizontal: CommonDimens.defaultGap),
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
                          if (state.categoriesPage.isLoading)
                            const Expanded(child: PacmanLoadingWidget()),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
