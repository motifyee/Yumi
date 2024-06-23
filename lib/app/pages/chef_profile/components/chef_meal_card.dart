import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/app/pages/menu/meal_model.dart';
import 'package:yumi/app/pages/meal_profile/meal_profile.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/app/components/text_currency.dart';

class ChefMealCard extends StatelessWidget {
  const ChefMealCard({super.key, required this.meal, required this.chef});

  final MealModel meal;
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
                BoxConstraints(minHeight: MediaQuery.of(context).size.height));
        // context.router.push(MealProfileRoute(meal: meal));
      },
      child: Padding(
        padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
        child: Container(
          padding: EdgeInsets.all(ThemeSelector.statics.defaultMicroGap),
          decoration: BoxDecoration(
              color: ThemeSelector.colors.background,
              borderRadius: BorderRadius.circular(
                  ThemeSelector.statics.defaultGapExtreme),
              boxShadow: [
                BoxShadow(
                  color: ThemeSelector.colors.shadow,
                  blurRadius: ThemeSelector.statics.defaultGap,
                )
              ]),
          child: Row(
            children: [
              Container(
                width: ThemeSelector.statics.defaultMediumGap,
                height: ThemeSelector.statics.defaultMediumGap,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        ThemeSelector.statics.defaultMediumGap)),
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
                width: ThemeSelector.statics.defaultGapXXL,
                height: ThemeSelector.statics.defaultGapExtreme,
                padding: EdgeInsets.only(
                    top: ThemeSelector.statics.defaultMicroGap,
                    bottom: ThemeSelector.statics.defaultMicroGap,
                    left: ThemeSelector.statics.defaultMicroGap,
                    right: ThemeSelector.statics.defaultLineGap),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal.name ?? '',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontSize: ThemeSelector.fonts.font_10,
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextCurrency(
                          value: double.parse(meal.price1 ?? '0'),
                          fontSize: ThemeSelector.fonts.font_10,
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
