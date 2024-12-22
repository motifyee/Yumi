import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:yumi/app/pages/calories/calories_cubit/calories_cubit.dart';
import 'package:yumi/generated/l10n.dart';

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
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: SvgPicture.asset('assets/images/walking_man.svg'),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: CommonDimens.defaultGap),
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
                    if (state.calories.isLoading) const PacmanLoadingWidget(),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCalorieWidget(BuildContext context, Calorie calorie) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: CommonDimens.defaultMicroGap,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: CommonDimens.defaultLineGap,
        horizontal: CommonDimens.defaultTitleGap,
      ),
      decoration: BoxDecoration(
        color: CommonColors.backgroundTant,
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
