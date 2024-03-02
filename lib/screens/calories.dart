import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/pagination_template.dart';
import 'package:yumi/template/text_form_field.dart';

@RoutePage()
class CaloriesReferenceScreen extends StatelessWidget {
  const CaloriesReferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MealListBloc>().add(MealListResetEvent());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
            child: Text(
          S.of(context).caloriesReference,
          style: TextStyle(
            color: ThemeSelector.colors.primary,
            fontSize: ThemeSelector.fonts.font_14,
            fontWeight: FontWeight.w700,
          ),
        )),
        actions: [
          TextButton(
              onPressed: () {},
              child: SvgPicture.asset('assets/images/walking_man.svg'))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ThemeSelector.statics.defaultLineGap),
            child: TextFormFieldTemplate(
              hintText: S.of(context).search,
              borderStyle: TextFormFieldBorderStyle.borderedRound,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ThemeSelector.statics.defaultGap,
                  vertical: ThemeSelector.statics.defaultLineGap,
                ),
                child: SvgPicture.asset(
                  'assets/images/search.svg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          SizedBox(height: ThemeSelector.statics.defaultGap),
          Expanded(
            child: PaginationTemplate(
              scrollDirection: Axis.vertical,
              loadDate: () => context.read<MealListBloc>().add(
                  MealListUpdateCaloriesEvent(
                      context: context, searchText: '')),
              child: BlocConsumer<MealListBloc, MealListState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Column(
                    children: [
                      for (var meal in state.meals)
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: ThemeSelector.statics.defaultMicroGap),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: ThemeSelector.statics.defaultLineGap,
                                horizontal:
                                    ThemeSelector.statics.defaultTitleGap),
                            decoration: BoxDecoration(
                              color: ThemeSelector.colors.backgroundTant,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    meal.name ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: ThemeSelector.colors.secondary,
                                      fontSize: ThemeSelector.fonts.font_14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Text(
                                  meal.caloriesValue ?? '',
                                  style: TextStyle(
                                    color: ThemeSelector.colors.secondary,
                                    fontSize: ThemeSelector.fonts.font_12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
