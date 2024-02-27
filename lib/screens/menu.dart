import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/meal/meal_list_bloc.dart';
import 'package:yumi/forms/meal_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/dialog.dart';
import 'package:yumi/template/loading.dart';
import 'package:yumi/template/pagination_template.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocConsumer<MealListBloc, MealListState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultGap),
                  child: BlocConsumer<CategoriesBloc, CategoriesState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      var mealListBlocState =
                          context.read<MealListBloc>().state;
                      return Container(
                        child: PaginationTemplate(
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
                              if (state.isLoading)
                                Loading(
                                  size: ThemeSelector.statics.defaultBlockGap,
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                state.meals.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Text(
                            S.of(context).empty,
                            style: TextStyle(
                              color: ThemeSelector.colors.secondaryFaint,
                              fontSize: ThemeSelector.fonts.font_38,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    : Text('daaaaa'),
              ],
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
