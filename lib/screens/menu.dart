import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/forms/meal_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/loading.dart';
import 'package:yumi/template/meal_card.dart';
import 'package:yumi/template/pagination_template.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesBloc>().add(ResetCategoryEvent());
    context.read<MealListBloc>().add(MealListResetEvent());

    return Stack(
      children: [
        BlocConsumer<MealListBloc, MealListState>(
          listener: (context, state) {},
          builder: (context, state) {
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
                        var mealListBlocState =
                            context.read<MealListBloc>().state;
                        return PaginationTemplate(
                          scrollDirection: Axis.horizontal,
                          loadDate: () => context
                              .read<CategoriesBloc>()
                              .add(GetCategoriesEvent(context: context)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.read<MealListBloc>().add(
                                      MealListUpdateCategoryEvent(
                                          context: context,
                                          selectedCategory: 0));
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
                                      style: TextStyle(
                                        color: mealListBlocState
                                                    .selectedCategory ==
                                                0
                                            ? ThemeSelector.colors.onPrimary
                                            : ThemeSelector.colors.secondary,
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
                                            selectedCategory: category.id));
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
                                        style: TextStyle(
                                          color: mealListBlocState
                                                      .selectedCategory ==
                                                  category.id
                                              ? ThemeSelector.colors.onPrimary
                                              : ThemeSelector.colors.secondary,
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
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  for (var mealIndex = 0;
                                      mealIndex < state.meals.length;
                                      mealIndex++)
                                    if (mealIndex % 2 == 0)
                                      MealCard(meal: state.meals[mealIndex])
                                ],
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                      height: ThemeSelector
                                          .statics.defaultTitleGapLarge),
                                  for (var mealIndex = 0;
                                      mealIndex < state.meals.length;
                                      mealIndex++)
                                    if (mealIndex % 2 != 0)
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
                      loadDate: () => context
                          .read<MealListBloc>()
                          .add(MealListUpdateEvent(context: context)),
                    ),
                  ),
                  if (state.meals.isEmpty)
                    Expanded(
                      child: Text(
                        S.of(context).empty,
                        style: TextStyle(
                          color: ThemeSelector.colors.secondaryFaint,
                          fontSize: ThemeSelector.fonts.font_38,
                          fontWeight: FontWeight.w700,
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
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => DialogContainer(
                          child: MealForm(),
                        ));
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
