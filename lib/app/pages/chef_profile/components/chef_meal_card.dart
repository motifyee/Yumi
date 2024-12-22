import 'dart:typed_data';

import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:yumi/app/pages/meal_profile/meal_profile.dart';

class ChefMealCard extends StatelessWidget {
  const ChefMealCard({super.key, required this.meal, required this.chef});

  final Meal meal;
  final Chef chef;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (context) => MealProfileScreen(
            meal: meal,
            chef: chef,
          ),
          backgroundColor: Colors.transparent,
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        );
        // context.router.push(MealProfileRoute(meal: meal));
      },
      child: Padding(
        padding: const EdgeInsets.all(CommonDimens.defaultGap),
        child: Container(
          padding: const EdgeInsets.all(CommonDimens.defaultMicroGap),
          decoration: BoxDecoration(
            color: CommonColors.background,
            borderRadius: BorderRadius.circular(CommonDimens.defaultGapExtreme),
            boxShadow: [
              BoxShadow(
                color: CommonColors.shadow,
                blurRadius: CommonDimens.defaultGap,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: CommonDimens.defaultMediumGap,
                height: CommonDimens.defaultMediumGap,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(CommonDimens.defaultMediumGap),
                ),
                child: Image.memory(
                  Uri.parse(meal.photo ?? '').data?.contentAsBytes() ??
                      Uint8List(0),
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/354.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: CommonDimens.defaultGapXXL,
                height: CommonDimens.defaultGapExtreme,
                padding: const EdgeInsets.only(
                  top: CommonDimens.defaultMicroGap,
                  bottom: CommonDimens.defaultMicroGap,
                  left: CommonDimens.defaultMicroGap,
                  right: CommonDimens.defaultLineGap,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.name ?? '',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontSize: CommonFontSize.font_10,
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextCurrency(
                          value: meal.price1 ?? 0,
                          fontSize: CommonFontSize.font_10,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
