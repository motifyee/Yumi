import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:common_code/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/categories/categories_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_cubit.dart';
import 'package:yumi/domain/meal/entity/meal.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/app/pages/menu/widgets/meal_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/app/pages/menu/widgets/meal_card.dart';

class MenuTemplate extends StatelessWidget {
  const MenuTemplate({super.key, required this.menuTarget});

  final MenuTarget menuTarget;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 300)).then((value) {
      if (!G().rd<RegCubit>().state.registerationStarted) return;
      if (context.read<MealCubit>().state.pagination.data.isNotEmpty) return;
      addYourMealsDialog(context);
    });

    return Stack(
      children: [
        BlocConsumer<MealCubit, MealState>(
          listener: (context, state) {},
          builder: (context, state) {
            var mealListBlocState = state;
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: CommonDimens.defaultGap,
                        vertical: CommonDimens.defaultGap),
                    child: BlocConsumer<CategoriesCubit, CategoriesState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return PaginationTemplate(
                          scrollDirection: Axis.horizontal,
                          loadDate: () => {
                            context.read<CategoriesCubit>().getChefCategories(
                                  isPreOrder: menuTarget == MenuTarget.preOrder,
                                ),
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.read<MealCubit>().updateCategory(
                                      selectedCategory: 0,
                                      chefId: context
                                          .read<UserCubit>()
                                          .state
                                          .user
                                          .chefId);
                                },
                                child: Container(
                                  width: ((MediaQuery.of(context).size.width -
                                          (CommonDimens.defaultGap * 2)) /
                                      5),
                                  decoration: BoxDecoration(
                                      color:
                                          mealListBlocState.selectedCategory ==
                                                  0
                                              ? CommonColors.primary
                                              : CommonColors.background,
                                      borderRadius: BorderRadius.circular(
                                          CommonDimens
                                              .defaultBorderRadiusMedium)),
                                  child: Center(
                                    child: Text(
                                      'All',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: mealListBlocState
                                                        .selectedCategory ==
                                                    0
                                                ? CommonColors.onPrimary
                                                : CommonColors.secondary,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              for (var category
                                  in state.categoriesPage.data ?? [])
                                GestureDetector(
                                  onTap: () {
                                    context.read<MealCubit>().updateCategory(
                                        selectedCategory: category.id,
                                        chefId: context
                                            .read<UserCubit>()
                                            .state
                                            .user
                                            .chefId);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: CommonDimens.defaultGap),
                                    constraints: BoxConstraints(
                                      minWidth: ((MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              (CommonDimens.defaultGap * 2)) /
                                          5),
                                    ),
                                    decoration: BoxDecoration(
                                        color: mealListBlocState
                                                    .selectedCategory ==
                                                category.id
                                            ? CommonColors.primary
                                            : CommonColors.background,
                                        borderRadius: BorderRadius.circular(
                                            CommonDimens
                                                .defaultBorderRadiusMedium)),
                                    child: Center(
                                      child: Text(
                                        category.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: mealListBlocState
                                                          .selectedCategory ==
                                                      category.id
                                                  ? CommonColors.onPrimary
                                                  : CommonColors.secondary,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: CommonDimens.defaultBlockGap,
                                child: state.categoriesPage.isLoading
                                    ? const Loading(
                                        size: CommonDimens.defaultBlockGap,
                                      )
                                    : const Text(''),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  if (state.pagination.isLoading)
                    const Expanded(
                      child: Loading(),
                    ),
                  Expanded(
                    child: PaginationTemplate(
                      scrollDirection: Axis.vertical,
                      loadDate: () {
                        context.read<MealCubit>().updateMeals(
                            chefId:
                                context.read<UserCubit>().state.user.chefId);
                      },
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  for (var mealIndex = 0;
                                      mealIndex < state.pagination.data.length;
                                      mealIndex += 2)
                                    MealCard(
                                      meal: state.pagination.data[mealIndex],
                                      menuTarget: menuTarget,
                                    )
                                ],
                              ),
                              Column(
                                children: [
                                  const SizedBox(
                                      height:
                                          CommonDimens.defaultTitleGapLarge),
                                  for (var mealIndex = 1;
                                      mealIndex < state.pagination.data.length;
                                      mealIndex += 2)
                                    MealCard(
                                      meal: state.pagination.data[mealIndex],
                                      menuTarget: menuTarget,
                                    )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: CommonDimens.defaultGapExtraExtreme,
                          )
                        ],
                      ),
                    ),
                  ),
                  if (state.pagination.data.isEmpty &&
                      !state.pagination.isLoading)
                    Expanded(
                      child: Text(
                        S.of(context).empty,
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: CommonColors.secondaryFaint,
                                  fontSize: CommonFontSize.font_38,
                                ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: const EdgeInsets.all(CommonDimens.defaultBlockGap),
            child: TextButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (contexts) => DialogContainer(
                    child: MealForm(
                      menuTarget: menuTarget,
                    ),
                  ),
                ).then((value) {
                  context
                      .read<CategoriesCubit>()
                      .reset(); //.add(ResetCategoryEvent());

                  context.read<CategoriesCubit>().getChefCategories(
                        isPreOrder: menuTarget == MenuTarget.preOrder,
                      );
                  context.read<MealCubit>().reset(menuTarget: menuTarget);
                  context.read<MealCubit>().updateMeals(
                      chefId: context.read<UserCubit>().state.user.chefId);
                });
              },
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      width: CommonDimens.iconSizeLarge,
                      height: CommonDimens.iconSizeLarge,
                      padding: const EdgeInsets.all(
                          CommonDimens.defaultLineGap * .8),
                      decoration: BoxDecoration(
                        color: CommonColors.primary,
                        borderRadius:
                            BorderRadius.circular(CommonDimens.iconSizeLarge),
                      ),
                      child: SvgPicture.asset('assets/images/meal.svg'),
                    ),
                    Positioned(
                        child: SvgPicture.asset('assets/images/plus.svg'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void addYourMealsDialog(BuildContext context) {
  showAlertDialog(
    context: context,
    content: SizedBox(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: SvgPicture.asset('assets/images/flow/add-menu.svg')),
          const SizedBox(height: 8),
          Text(
            '         Now',
            style: TextStyle(
              color: CommonColors.primary,
              fontSize: CommonFontSize.font_14,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            '         You should create your own menu',
            style: TextStyle(
              fontSize: CommonFontSize.font_14,
            ),
          ),
        ],
      ),
    ),
    actions: {'Next': null},
  );
}
