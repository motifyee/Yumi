import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/text_currency.dart';
import 'package:yumi/template/text_quntaty.dart';

class ProductInCard extends StatelessWidget {
  const ProductInCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ThemeSelector.statics.defaultGap),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        ThemeSelector.statics.defaultBorderRadiusSmall),
                  ),
                  child: Image.asset(
                    'assets/images/354.jpeg',
                    width: ThemeSelector.statics.iconSizeLarge,
                    height: ThemeSelector.statics.iconSizeLarge,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: ThemeSelector.statics.defaultGap),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Breakfast',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      '81 calories, 1.7g protein, 12g carbs, 2.74 fat',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: ThemeSelector.fonts.font_9,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextCurrency(value: 5.00, fontSize: ThemeSelector.fonts.font_14),
              TextQuantity(
                value: 2.00,
                fontSize: ThemeSelector.fonts.font_10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
