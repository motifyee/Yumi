import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/driver/driver_reg_cubit.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/forms/meal_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/meal_card.dart';
import 'package:yumi/template/pagination_template.dart';

class MenuTemplate extends StatelessWidget {
  const MenuTemplate({super.key, required this.menuTarget});

  final MenuTarget menuTarget;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      if (!G.rd<RegCubit>().state.registerationStarted) return;
      if (context.read<MealListBloc>().state.meals.isNotEmpty) return;
      addYourMealsDialog(context);
    });
    return Stack(
      children: [
        BlocConsumer<MealListBloc, MealListState>(
          listener: (context, state) {},
          builder: (context, state) {
            var mealListBlocState = state;
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ThemeSelector.statics.defaultGap,
                        vertical: ThemeSelector.statics.defaultGap),
                    child: BlocConsumer<CategoriesBloc, CategoriesState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        return PaginationTemplate(
                          scrollDirection: Axis.horizontal,
                          loadDate: () => {
                            context.read<CategoriesBloc>().add(
                                  GetCategoriesEvent(
                                      context: context,
                                      isPreOrder:
                                          menuTarget == MenuTarget.preOrder,
                                      isAll: false),
                                )
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<MealListBloc>()
                                      .add(MealListUpdateCategoryEvent(
                                        context: context,
                                        selectedCategory: 0,
                                        chefId: context
                                            .read<UserBloc>()
                                            .state
                                            .user
                                            .chefId,
                                      ));
                                },
                                child: Container(
                                  width: ((MediaQuery.of(context).size.width -
                                          (ThemeSelector.statics.defaultGap *
                                              2)) /
                                      5),
                                  decoration: BoxDecoration(
                                      color:
                                          mealListBlocState.selectedCategory ==
                                                  0
                                              ? ThemeSelector.colors.primary
                                              : ThemeSelector.colors.background,
                                      borderRadius: BorderRadius.circular(
                                          ThemeSelector.statics
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
                                                ? ThemeSelector.colors.onPrimary
                                                : ThemeSelector
                                                    .colors.secondary,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              for (var category
                                  in state.categoriesModelList ?? [])
                                GestureDetector(
                                  onTap: () {
                                    context.read<MealListBloc>().add(
                                        MealListUpdateCategoryEvent(
                                            context: context,
                                            selectedCategory: category.id,
                                            chefId: context
                                                .read<UserBloc>()
                                                .state
                                                .user
                                                .chefId));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            ThemeSelector.statics.defaultGap),
                                    constraints: BoxConstraints(
                                      minWidth:
                                          ((MediaQuery.of(context).size.width -
                                                  (ThemeSelector
                                                          .statics.defaultGap *
                                                      2)) /
                                              5),
                                    ),
                                    decoration: BoxDecoration(
                                        color: mealListBlocState
                                                    .selectedCategory ==
                                                category.id
                                            ? ThemeSelector.colors.primary
                                            : ThemeSelector.colors.background,
                                        borderRadius: BorderRadius.circular(
                                            ThemeSelector.statics
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
                                                  ? ThemeSelector
                                                      .colors.onPrimary
                                                  : ThemeSelector
                                                      .colors.secondary,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              SizedBox(
                                width: ThemeSelector.statics.defaultBlockGap,
                                child: state.paginationHelper.isLoading
                                    ? Loading(
                                        size: ThemeSelector
                                            .statics.defaultBlockGap,
                                      )
                                    : const Text(''),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: PaginationTemplate(
                      scrollDirection: Axis.vertical,
                      loadDate: () {
                        context.read<MealListBloc>().add(
                              MealListUpdateEvent(
                                context: context,
                                chefId:
                                    context.read<UserBloc>().state.user.chefId,
                              ),
                            );
                      },
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  for (var mealIndex = 0;
                                      mealIndex < state.meals.length;
                                      mealIndex += 2)
                                    MealCard(meal: state.meals[mealIndex])
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                      height: ThemeSelector
                                          .statics.defaultTitleGapLarge),
                                  for (var mealIndex = 1;
                                      mealIndex < state.meals.length;
                                      mealIndex += 2)
                                    MealCard(meal: state.meals[mealIndex])
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height:
                                ThemeSelector.statics.defaultGapExtraExtreme,
                          )
                        ],
                      ),
                    ),
                  ),
                  if (state.meals.isEmpty)
                    Expanded(
                      child: Text(
                        S.of(context).empty,
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  color: ThemeSelector.colors.secondaryFaint,
                                  fontSize: ThemeSelector.fonts.font_38,
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
            margin: EdgeInsets.all(ThemeSelector.statics.defaultBlockGap),
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
                          chefId: context.read<UserBloc>().state.user.chefId,
                        ),
                      );
                });
              },
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      width: ThemeSelector.statics.iconSizeLarge,
                      height: ThemeSelector.statics.iconSizeLarge,
                      padding: EdgeInsets.all(
                          ThemeSelector.statics.defaultLineGap * .8),
                      decoration: BoxDecoration(
                        color: ThemeSelector.colors.primary,
                        borderRadius: BorderRadius.circular(
                            ThemeSelector.statics.iconSizeLarge),
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
              color: ThemeSelector.colors.primary,
              fontSize: ThemeSelector.fonts.font_14,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '         You should create your own menu',
            style: TextStyle(
              fontSize: ThemeSelector.fonts.font_14,
            ),
          ),
        ],
      ),
    ),
    actions: {'Next': null},
  );
}
