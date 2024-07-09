import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/app/pages/calories/calories_cubit/calories_cubit.dart';
import 'package:yumi/domain/calories/entity/calorie.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/pagination_template.dart';

@RoutePage()
class CaloriesReferenceScreen extends StatelessWidget {
  const CaloriesReferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CaloriesCubit(),
      child: const CaloriesReference(),
    );
  }
}

class CaloriesReference extends StatelessWidget {
  const CaloriesReference({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
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
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
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
                    for (Calorie calorie in state.calories.data)
                      _buildCalorieWidget(context, calorie),
                    if (state.calories.isLoading) Loading(),
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCalorieWidget(BuildContext context, Calorie calorie) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: ThemeSelector.statics.defaultMicroGap,
      ),
      padding: EdgeInsets.symmetric(
        vertical: ThemeSelector.statics.defaultLineGap,
        horizontal: ThemeSelector.statics.defaultTitleGap,
      ),
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
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          Text(
            calorie.caloriesValue.toString(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
