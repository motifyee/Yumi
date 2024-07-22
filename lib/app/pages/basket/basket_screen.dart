import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/app/pages/basket/widgets/basket_meal_card.dart';
import 'package:yumi/app/pages/menu/widgets/chef_meals.dart';
import 'package:yumi/app/pages/basket/widgets/confirm_checkout_basket.dart';
import 'package:yumi/app/pages/basket/widgets/expired_basket.dart';
import 'package:yumi/app/pages/basket/widgets/payment_summary_card.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:common_code/domain/food_delivery/meal/entities/meal.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/app/pages/basket/delivery_option_dialog.dart';

@RoutePage()
class BasketScreen extends StatelessWidget {
  BasketScreen({super.key});

  bool isBasketDeleting = false;

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

  void checkExpiredBasket(
      {required BuildContext context, required Basket basket}) {
    if (basket.invoice.isBasketExpired && !isBasketDeleting) {
      Timer(const Duration(milliseconds: 300), () {
        isBasketDeleting = true;
        showDialog(
          context: context,
          builder: (context) => const ExpiredBasket(),
        ).then((value) {
          context.read<BasketCubit>().deleteBasket();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketCubit, BasketState>(
      builder: (context, state) {
        checkExpiredBasket(context: context, basket: state.basket);
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
                    color: CommonColors.primary,
                  )),
            ],
            title: Column(
              children: [
                Text(
                  S.of(context).basket,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontSize: CommonFontSize.font_16,
                      ),
                ),
                Text(
                  context.read<UserCubit>().state.address?.addressTitle ?? '',
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
                      const SizedBox(height: CommonDimens.defaultBlockGap),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: CommonDimens.defaultTitleGap),
                        child: PaymentSummaryCard(),
                      ),
                      const SizedBox(height: CommonDimens.defaultBlockGap),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              openAddFood(context: context, state: state);
                            },
                            child: Container(
                              width: CommonDimens.defaultGapXXXL,
                              height: CommonDimens.defaultTitleGapLarge,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      CommonDimens.defaultBorderRadius),
                                  border: Border.all(
                                      color: CommonColors.primary, width: 1)),
                              child: Center(
                                child: Text(
                                  S.of(context).addFoods,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: CommonDimens.defaultGap),
                          Hero(
                            tag: 'ConfirmBasketSeries',
                            child: GestureDetector(
                              onTap: state.basket.invoiceDetails.isEmpty
                                  ? null
                                  : () {
                                      if (state.basket.isPickupOnly) {
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                const ConfirmCheckOutBasket());
                                      } else {
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                const DeliveryOptionDialog());
                                      }
                                    },
                              child: Container(
                                width: CommonDimens.defaultGapXXXL,
                                height: CommonDimens.defaultTitleGapLarge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      CommonDimens.defaultBorderRadius),
                                  color: CommonColors.primary,
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
                      const SizedBox(height: CommonDimens.defaultBlockGap),
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
