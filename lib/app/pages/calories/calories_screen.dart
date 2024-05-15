import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/calories/calories_cubit/calories_cubit.dart';
import 'package:yumi/domain/calories/entity/calories.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/pagination_template.dart';
import 'package:yumi/template/text_form_field.dart';

@RoutePage()
class CaloriesReferenceScreen extends StatelessWidget {
  const CaloriesReferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CaloriesCubit(),
      child: const CaloriesReferenceTemplate(),
    );
  }
}

class CaloriesReferenceTemplate extends StatelessWidget {
  const CaloriesReferenceTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
            child: Text(
          S.of(context).caloriesReference,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
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
          if (false)
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
              loadDate: () => context.read<CaloriesCubit>().loadCalories(),
              child: BlocConsumer<CaloriesCubit, CaloriesState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Column(
                    children: [
                      for (Calories calorie in state.paginationHelper.data)
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
                                    calorie.name,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                                Text(
                                  calorie.caloriesValue.toString(),
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (state.paginationHelper.isLoading) Loading(),
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
