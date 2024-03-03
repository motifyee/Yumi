import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/text_currency.dart';

class ChefMealCard extends StatelessWidget {
  const ChefMealCard({super.key, required this.meal});

  final meal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
      child: Container(
        padding: EdgeInsets.all(ThemeSelector.statics.defaultMicroGap),
        decoration: BoxDecoration(
            color: ThemeSelector.colors.background,
            borderRadius:
                BorderRadius.circular(ThemeSelector.statics.defaultGapExtreme),
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
              child: Image.asset(
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
                children: [
                  Text(
                    'Shrimp Zucchini Pasta ',
                    style: TextStyle(
                      color: ThemeSelector.colors.secondary,
                      fontSize: ThemeSelector.fonts.font_10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextCurrency(
                        value: .75,
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
    );
  }
}
