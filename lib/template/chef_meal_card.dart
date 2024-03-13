import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/text_currency.dart';

class ChefMealCard extends StatelessWidget {
  const ChefMealCard({super.key, required this.meal});

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(MealProfileRoute());
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
                child: meal.photo != null && false
                    ? Image.memory(
                        Uint8List.fromList(base64Decode(meal.photo!)),
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/354.jpeg',
                        fit: BoxFit.cover,
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
