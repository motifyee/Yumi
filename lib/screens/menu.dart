import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/forms/meal_form.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/dialog.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var category in [
                  'All',
                  'Salad',
                  'Meat',
                  'Chicken',
                  'Fish'
                ])
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      category,
                      style: TextStyle(
                        color: ThemeSelector.colors.secondary,
                      ),
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Center(
                child: Text(
                  S.of(context).empty,
                  style: TextStyle(
                    color: ThemeSelector.colors.secondaryFaint,
                    fontSize: ThemeSelector.fonts.font_38,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.all(ThemeSelector.statics.defaultBlockGap),
            child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => DialogContainer(
                          child: MealForm(),
                        ));
              },
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      width: ThemeSelector.statics.iconSizeLarge,
                      height: ThemeSelector.statics.iconSizeLarge,
                      padding: EdgeInsets.all(
                          ThemeSelector.statics.defaultLineGap * .8),
                      decoration: BoxDecoration(
                        color: ThemeSelector.colors.primary,
                        borderRadius: BorderRadius.circular(
                            ThemeSelector.statics.iconSizeLarge),
                      ),
                      child: SvgPicture.asset('assets/images/meal.svg'),
                    ),
                    Positioned(
                        child: SvgPicture.asset('assets/images/plus.svg'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
