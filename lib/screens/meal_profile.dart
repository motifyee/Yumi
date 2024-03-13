import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yumi/forms/customer_pre_order_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/capitalize_string.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/text_currency.dart';

@RoutePage()
class MealProfileScreen extends StatelessWidget {
  MealProfileScreen({super.key, required this.meal});

  MealModel meal;

  @override
  Widget build(BuildContext context) {
    print(meal.toJson());
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: ThemeSelector.colors.background),
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: ThemeSelector.statics.defaultImageHeightLarge,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                bottomLeft:
                    Radius.circular(ThemeSelector.statics.defaultLineGap),
                bottomRight:
                    Radius.circular(ThemeSelector.statics.defaultLineGap),
              )),
              child: meal.photo != null
                  ? Image.memory(
                      Uint8List.fromList(base64Decode(meal.photo!)),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    )
                  : Image.asset(
                      'assets/images/354.jpeg',
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ThemeSelector.statics.defaultBlockGap),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ThemeSelector.statics.defaultGap),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).shippingFee,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                  height:
                                      ThemeSelector.statics.defaultElevation),
                              Text(
                                '4.0${S.of(context).km}',
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            ],
                          ),
                          SizedBox(width: ThemeSelector.statics.defaultGap),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                S.of(context).deliveryIn,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                  height:
                                      ThemeSelector.statics.defaultElevation),
                              Text(
                                '15${S.of(context).min}',
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ThemeSelector.statics.defaultGap),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                meal.name?.capitalize() ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                        fontSize: ThemeSelector.fonts.font_24),
                              ),
                              if (meal.ingredients != null)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ThemeSelector
                                          .statics.defaultInputGap),
                                  child: Text(
                                    meal.ingredients!
                                        .map((e) => '${e.portionGrams} '
                                            '${e.name}')
                                        .join(', '),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        TextCurrency(
                          value: 0.5,
                          fontSize: ThemeSelector.fonts.font_24,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ThemeSelector.statics.defaultGap),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: ThemeSelector.colors.warning,
                            size: ThemeSelector.fonts.font_12,
                          ),
                          SizedBox(
                              width: ThemeSelector.statics.defaultElevation),
                          Text('4.2',
                              style: Theme.of(context).textTheme.labelMedium),
                          SizedBox(
                              width: ThemeSelector.statics.defaultElevation),
                          Text('(2K ${S.of(context).reviews})',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    SizedBox(height: ThemeSelector.statics.defaultBlockGap),
                    Text(S.of(context).nutritionalValuePer100g,
                        style: Theme.of(context).textTheme.labelLarge),
                    SizedBox(height: ThemeSelector.statics.defaultGap),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '2.00',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color: ThemeSelector.colors.secondaryTant),
                        ),
                        Text(
                          '19.50',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color: ThemeSelector.colors.secondaryTant),
                        ),
                        Text(
                          '35.00',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color: ThemeSelector.colors.secondaryTant),
                        ),
                        Text(
                          '7.60',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color: ThemeSelector.colors.secondaryTant),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => CustomerPreOrderForm(meal: meal),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultBlockGap,
                      vertical: ThemeSelector.statics.defaultMicroGap),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultInputGap),
                      border: Border.all(
                          color: ThemeSelector.colors.primary, width: 1)),
                  child: Text(
                    S.of(context).add,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                )),
            SizedBox(height: ThemeSelector.statics.defaultGap),
          ],
        ));
  }
}
