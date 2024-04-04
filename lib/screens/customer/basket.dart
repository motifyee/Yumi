import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/basket/basket_form_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/screens/chef_meals.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/basket_meal_card.dart';
import 'package:yumi/template/payment_summary_card.dart';

@RoutePage()
class BasketScreen extends StatelessWidget {
  BasketScreen({super.key});

  void openAddFood(
      {required BuildContext context, required BasketFormState state}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ChefMealsScreen(
        menuTarget: state.invoice.isPreorder == true
            ? MenuTarget.preOrder
            : MenuTarget.order,
        chefId: state.invoice.invoice?.chefID ?? '',
        isPickUpOnly: state.isPickUpOnly,
      ),
      scrollControlDisabledMaxHeightRatio: .9,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketFormBloc, BasketFormState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            leading: Container(),
            actions: [
              TextButton(
                  onPressed: () {
                    context.read<BasketFormBloc>().add(BasketFormResetEvent());
                    context.router.replaceAll([HomeRoute()]);
                  },
                  child: Icon(
                    Icons.close,
                    color: ThemeSelector.colors.primary,
                  )),
            ],
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
          body: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      for (var i = 0;
                          i < (state.invoice.invoiceDetails ?? []).length;
                          i++)
                        BasketMealCard(
                          invoiceDetails: state.invoice.invoiceDetails![i],
                          indexInList: i,
                        ),
                      Expanded(child: Container()),
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
                            onTap: () {
                              openAddFood(context: context, state: state);
                            },
                            child: Container(
                              width: ThemeSelector.statics.defaultGapXXXL,
                              height:
                                  ThemeSelector.statics.defaultTitleGapLarge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      ThemeSelector
                                          .statics.defaultBorderRadius),
                                  border: Border.all(
                                      color: ThemeSelector.colors.primary,
                                      width: 1)),
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
                            tag: 'ConfirmBasketSeries',
                            child: GestureDetector(
                              onTap: () {
                                if (state.invoice.invoiceDetails!.isEmpty)
                                  return;
                                context.router.push(CheckOutRoute());
                              },
                              child: Container(
                                width: ThemeSelector.statics.defaultGapXXXL,
                                height:
                                    ThemeSelector.statics.defaultTitleGapLarge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      ThemeSelector
                                          .statics.defaultBorderRadius),
                                  color: ThemeSelector.colors.primary,
                                ),
                                child: Center(
                                  child: Text(
                                    S.of(context).checkout,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
