import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:yumi/app/components/page_view/cubit/page_view_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/chef/chef_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/meal_profile/meal_profile.dart';
import 'package:yumi/app/pages/chef_profile/components/chef_bannar.dart';
import 'package:yumi/app/pages/menu/widgets/chef_meal_basket_card.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final PageController favPageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChefsCubit()),
        BlocProvider(create: (context) => PageViewCubit()),
        BlocProvider(create: (context) => MealCubit()),
      ],
      child: Builder(
        builder: (context) {
          return BlocBuilder<PageViewCubit, PageViewState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CommonDimens.defaultBlockGap,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/heart.svg',
                          height: CommonDimens.defaultInputGap,
                          colorFilter: ColorFilter.mode(
                            CommonColors.secondary,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: CommonDimens.defaultGap),
                        Text(
                          state.selectedList == 0
                              ? S.of(context).chefs
                              : S.of(context).meals,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Expanded(child: Container()),
                        GestureDetector(
                          onTap: () {
                            favPageController.jumpToPage(0);
                            context
                                .read<PageViewCubit>()
                                .updateSelect(selectedList: 0);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: CommonDimens.defaultInputGap,
                            ),
                            child: SvgPicture.asset(
                              'assets/images/users.svg',
                              colorFilter: ColorFilter.mode(
                                state.selectedList == 0
                                    ? CommonColors.primary
                                    : CommonColors.secondary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            favPageController.jumpToPage(1);
                            context
                                .read<PageViewCubit>()
                                .updateSelect(selectedList: 1);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: CommonDimens.defaultInputGap,
                            ),
                            child: SvgPicture.asset(
                              'assets/images/meals.svg',
                              colorFilter: ColorFilter.mode(
                                state.selectedList == 1
                                    ? CommonColors.primary
                                    : CommonColors.secondary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: CommonDimens.defaultGap),
                    Expanded(
                      child: PageView(
                        controller: favPageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          PaginationTemplate(
                            scrollDirection: Axis.vertical,
                            loadDate: () =>
                                context.read<ChefsCubit>().getFavouriteChefs(),
                            child: BlocConsumer<ChefsCubit, ChefsState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: CommonDimens.defaultGap,
                                  ),
                                  child: Column(
                                    children: [
                                      for (var chef in state.chefs)
                                        ChefBanner(
                                          menuTarget: OrderType.preOrder,
                                          chef: chef,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              (CommonDimens.defaultGap * 10),
                                          height: CommonDimens
                                              .defaultImageHeightSmall,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(
                                              CommonDimens.defaultBorderRadius,
                                            ),
                                            topRight: Radius.circular(
                                              CommonDimens.defaultBorderRadius,
                                            ),
                                          ),
                                        ),
                                      if (state.chefsPagination.isLoading)
                                        const PacmanLoadingWidget(),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          PaginationTemplate(
                            loadDate: () {
                              context.read<MealCubit>().getFavoriteMeals();
                            },
                            scrollDirection: Axis.vertical,
                            child: BlocConsumer<MealCubit, MealState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    for (Meal meal in state.pagination.data)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: CommonDimens.defaultGap,
                                        ),
                                        child: Column(
                                          children: [
                                            ChefMealBasketCard(
                                              meal: meal,
                                              isDisabled: false,
                                              onTap: () {
                                                showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) =>
                                                      MealProfileScreen(
                                                    meal: meal,
                                                    chef: Chef(id: meal.chefId),
                                                  ),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  scrollControlDisabledMaxHeightRatio:
                                                      1,
                                                ).then((value) {
                                                  context
                                                      .read<MealCubit>()
                                                      .reset();
                                                  context
                                                      .read<MealCubit>()
                                                      .getFavoriteMeals();
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (state.pagination.isLoading)
                                      const PacmanLoadingWidget(),
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
            },
          );
        },
      ),
    );
  }
}
