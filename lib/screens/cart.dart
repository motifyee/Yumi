import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/cart_meal_card.dart';
import 'package:yumi/template/text_currency.dart';

@RoutePage()
class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: TextButton(
            onPressed: () {},
            child: Icon(
              Icons.arrow_back,
              color: ThemeSelector.colors.primary,
            )),
        title: Column(
          children: [
            Text(
              S.of(context).basket,
              style: TextStyle(
                color: ThemeSelector.colors.secondary,
                fontSize: ThemeSelector.fonts.font_16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '356-565 main St. New York NY 23212',
              style: TextStyle(
                color: ThemeSelector.colors.secondaryTant,
                fontSize: ThemeSelector.fonts.font_10,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i in [0, 1, 2, 3, 4]) CartMealCard(),
            SizedBox(height: ThemeSelector.statics.defaultBlockGap),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeSelector.statics.defaultInputGap),
              child: Text(
                S.of(context).paymentSummary,
                style: TextStyle(
                  color: ThemeSelector.colors.secondary,
                  fontSize: ThemeSelector.fonts.font_18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: ThemeSelector.statics.defaultLineGap),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeSelector.statics.defaultTitleGap),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).subtotal,
                    style: TextStyle(
                      color: ThemeSelector.colors.secondary,
                      fontSize: ThemeSelector.fonts.font_12,
                    ),
                  ),
                  TextCurrency(
                    value: 0.64,
                    fontSize: ThemeSelector.fonts.font_12,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeSelector.statics.defaultTitleGap),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).deliveryFee,
                    style: TextStyle(
                      color: ThemeSelector.colors.secondary,
                      fontSize: ThemeSelector.fonts.font_12,
                    ),
                  ),
                  TextCurrency(
                    value: 0.64,
                    fontSize: ThemeSelector.fonts.font_12,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ThemeSelector.statics.defaultTitleGap,
                vertical: ThemeSelector.statics.defaultGap,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).totalAmount,
                    style: TextStyle(
                      color: ThemeSelector.colors.secondary,
                      fontSize: ThemeSelector.fonts.font_14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextCurrency(
                    value: 0.64,
                    fontSize: ThemeSelector.fonts.font_14,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ThemeSelector.statics.defaultTitleGap,
              ),
              child: Text(
                S.of(context).readMoreAboutFees,
                style: TextStyle(
                  color: ThemeSelector.colors.primary,
                  fontSize: ThemeSelector.fonts.font_12,
                ),
              ),
            ),
            SizedBox(height: ThemeSelector.statics.defaultBlockGap),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: ThemeSelector.statics.defaultGapXXXL,
                    height: ThemeSelector.statics.defaultTitleGapLarge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            ThemeSelector.statics.defaultBorderRadius),
                        border: Border.all(
                            color: ThemeSelector.colors.primary, width: 1)),
                    child: Center(
                      child: Text(
                        S.of(context).addFoods,
                        style: TextStyle(
                          color: ThemeSelector.colors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: ThemeSelector.statics.defaultGap),
                GestureDetector(
                  child: Container(
                    width: ThemeSelector.statics.defaultGapXXXL,
                    height: ThemeSelector.statics.defaultTitleGapLarge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultBorderRadius),
                      color: ThemeSelector.colors.primary,
                    ),
                    child: Center(
                      child: Text(
                        S.of(context).checkout,
                        style: TextStyle(
                          color: ThemeSelector.colors.onPrimary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: ThemeSelector.statics.defaultBlockGap),
          ],
        ),
      ),
    );
  }
}
