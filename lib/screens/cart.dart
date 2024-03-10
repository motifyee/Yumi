import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/cart_meal_card.dart';
import 'package:yumi/template/payment_summary_card.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: TextButton(
            onPressed: () {
              context.router.pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: ThemeSelector.colors.primary,
            )),
        title: Column(
          children: [
            Text(
              S.of(context).basket,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: ThemeSelector.fonts.font_16,
                  ),
            ),
            Text(
              '356-565 main St. New York NY 23212',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i in [
              0,
              1,
            ])
              CartMealCard(),
            SizedBox(height: ThemeSelector.statics.defaultBlockGap),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ThemeSelector.statics.defaultTitleGap),
              child: PaymentSummaryCard(),
            ),
            SizedBox(height: ThemeSelector.statics.defaultBlockGap),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
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
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: ThemeSelector.statics.defaultGap),
                Hero(
                  tag: 'ConfirmCartSeries',
                  child: GestureDetector(
                    onTap: () {
                      context.router.push(CheckOutRoute());
                    },
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
                          style: Theme.of(context).textTheme.displaySmall,
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
