import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/app/pages/basket/widgets/confirm_checkout_basket.dart';
import 'package:yumi/bloc/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

class DeliveryOptionDialog extends StatelessWidget {
  const DeliveryOptionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * .9,
        padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
        decoration: BoxDecoration(
          color: ThemeSelector.colors.background,
          borderRadius:
              BorderRadius.circular(ThemeSelector.statics.defaultBorderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultBlockGap),
                  child: Text(
                    '${S.of(context).hi} ${context.read<UserCubit>().state.user.userName}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            BlocConsumer<BasketCubit, BasketState>(
              listener: (context, state) {},
              builder: (context, state) {
                bool? option = state.basket.isDelivery;
                return Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ThemeSelector.statics.defaultGap),
                        child: TextButton(
                          onPressed: () {
                            context
                                .read<BasketCubit>()
                                .updateDeliverPickUp(isDelivery: false);
                          },
                          child: Row(
                            children: [
                              Container(
                                width: ThemeSelector.statics.defaultLineGap,
                                height: ThemeSelector.statics.defaultLineGap,
                                decoration: BoxDecoration(
                                    color: option != true
                                        ? ThemeSelector.colors.primary
                                        : ThemeSelector.colors.secondaryFaint,
                                    borderRadius: BorderRadius.circular(
                                        ThemeSelector.statics.defaultLineGap)),
                              ),
                              SizedBox(width: ThemeSelector.statics.defaultGap),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).pickup,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: ThemeSelector.statics.defaultGap),
                        child: TextButton(
                          onPressed: () {
                            context
                                .read<BasketCubit>()
                                .updateDeliverPickUp(isDelivery: true);
                          },
                          child: Row(
                            children: [
                              Container(
                                width: ThemeSelector.statics.defaultLineGap,
                                height: ThemeSelector.statics.defaultLineGap,
                                decoration: BoxDecoration(
                                  color: option == true
                                      ? ThemeSelector.colors.primary
                                      : ThemeSelector.colors.secondaryFaint,
                                  borderRadius: BorderRadius.circular(
                                      ThemeSelector.statics.defaultLineGap),
                                ),
                              ),
                              SizedBox(width: ThemeSelector.statics.defaultGap),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    S.of(context).delivery,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      context.router.popForced();
                    },
                    child: Text(
                      S.of(context).cancel,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(fontSize: ThemeSelector.fonts.font_12),
                    )),
                SizedBox(width: ThemeSelector.statics.defaultLineGap),
                TextButton(
                    onPressed: () {
                      context.router.maybePop();
                      showDialog(
                          context: context,
                          builder: (context) => const ConfirmCheckOutBasket());
                    },
                    child: Text(
                      S.of(context).placeOrder,
                      style: Theme.of(context).textTheme.headlineMedium,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
