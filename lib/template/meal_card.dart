import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/text_currency.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          padding: EdgeInsets.symmetric(
            horizontal: ThemeSelector.statics.defaultLineGap,
            vertical: ThemeSelector.statics.defaultGap,
          ),
          decoration: BoxDecoration(
              color: ThemeSelector.colors.backgroundTant,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                      ThemeSelector.statics.defaultBorderRadiusExtraLarge),
                  bottomLeft: Radius.circular(
                      ThemeSelector.statics.defaultBorderRadiusExtraLarge)),
              boxShadow: [
                BoxShadow(color: ThemeSelector.colors.shadow, blurRadius: 3)
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ThemeSelector.statics.defaultLineGap),
              Container(
                  width: ThemeSelector.statics.iconSizeLarge,
                  height: ThemeSelector.statics.iconSizeLarge,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultBorderRadiusSmall)),
                  child: Image.asset(
                    'assets/images/354.jpeg',
                  )),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              Text(
                'New York',
                style: TextStyle(
                    color: ThemeSelector.colors.secondary,
                    fontSize: ThemeSelector.fonts.font_14),
              ),
              Text(
                'salad',
                style: TextStyle(
                    color: ThemeSelector.colors.secondary,
                    fontSize: ThemeSelector.fonts.font_12),
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              Text(
                '541 kcal, carbs 47g, protein 38g, fats 28g',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: ThemeSelector.colors.secondary,
                    fontSize: ThemeSelector.fonts.font_9,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(height: ThemeSelector.statics.defaultGap),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextCurrency(
                    value: 0.42,
                    fontSize: ThemeSelector.fonts.font_18,
                  ),
                ],
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/pin.svg',
                      width: ThemeSelector.fonts.font_10,
                      height: ThemeSelector.fonts.font_10,
                    ),
                    const Text(' '),
                    Text(
                      'Edit',
                      style: TextStyle(
                        color: ThemeSelector.colors.success,
                        fontSize: ThemeSelector.fonts.font_10,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                )),
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/trash.svg',
                      width: ThemeSelector.fonts.font_10,
                      height: ThemeSelector.fonts.font_10,
                    ),
                    const Text(' '),
                    Text(
                      'Remove',
                      style: TextStyle(
                        color: ThemeSelector.colors.primary,
                        fontSize: ThemeSelector.fonts.font_10,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                )),
          ],
        )
      ],
    );
  }
}
