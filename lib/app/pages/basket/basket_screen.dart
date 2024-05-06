import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/app/pages/basket/widgets/basket_meal_card.dart';
import 'package:yumi/app/pages/basket/widgets/chef_meals.dart';
import 'package:yumi/app/pages/basket/widgets/confirm_checkout_basket.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/meal_model.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/payment_summary_card.dart';

@RoutePage()
class BasketScreen extends StatelessWidget {
  BasketScreen({super.key});

  void openAddFood(
      {required BuildContext context, required BasketState state}) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ChefMealsScreen(
        menuTarget: state.basket.isPreorder == true
            ? MenuTarget.preOrder
            : MenuTarget.order,
        chefId: state.basket.invoice.chefID ?? '',
        isPickUpOnly: state.basket.isPickupOnly,
      ),
      scrollControlDisabledMaxHeightRatio: .9,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketCubit, BasketState>(
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
                    context.read<BasketCubit>().deleteBasket();
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
                  context.read<UserBloc>().state.address?.addressTitle ?? '',
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
                          i < (state.basket.invoiceDetails ?? []).length;
                          i++)
                        BasketMealCard(
                          invoiceDetails: state.basket.invoiceDetails[i],
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
                              onTap: state.basket.invoiceDetails.isEmpty
                                  ? null
                                  : () {
                                      showDialog(
                                          context: context,
                                          builder: (context) =>
                                              ConfirmCheckOutBasket());
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
