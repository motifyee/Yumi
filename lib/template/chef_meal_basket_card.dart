import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/theme_statics.dart';

class ChefMealBasketCard extends StatelessWidget {
  const ChefMealBasketCard({super.key, required this.meal});

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ThemeSelector.statics.defaultGap),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: ThemeSelector.colors.shadow.withOpacity(.1),
                  blurRadius: 3,
                  offset: Offset(2, 3))
            ],
            color: ThemeSelector.colors.background,
          ),
          width: MediaQuery.of(context).size.width * .95,
          child: Row(
            children: [
              Container(
                width: ThemeSelector.statics.defaultImageHeightSmall,
                height: ThemeSelector.statics.defaultImageHeightSmall,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        ThemeSelector.statics.defaultGap)),
                child: meal.photo != null
                    ? Image.memory(
                        base64Decode(meal.photo!),
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/354.jpeg',
                        fit: BoxFit.cover,
                      ),
              ),
              Expanded(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ThemeSelector.statics.defaultGap),
                        child: Text(
                          meal.name ?? '',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )),
                      Container(
                        width: ThemeSelector.statics.defaultTitleGap,
                        height: ThemeSelector.statics.defaultTitleGap,
                        decoration: BoxDecoration(
                            color: ThemeSelector.colors.secondaryFaint,
                            borderRadius: BorderRadius.circular(
                                ThemeSelector.statics.defaultTitleGap)),
                        child: Center(
                          child: Text(
                            '${meal.portionPersons}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: ThemeSelector.colors.onSuccess),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
