import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/app/pages/basket/widgets/confirm_checkout_basket.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';

class DeliveryOptionDialog extends StatelessWidget {
  const DeliveryOptionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * .9,
        padding: const EdgeInsets.all(CommonDimens.defaultGap),
        decoration: BoxDecoration(
          color: CommonColors.background,
          borderRadius: BorderRadius.circular(CommonDimens.defaultBorderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: CommonDimens.defaultBlockGap),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: CommonDimens.defaultGap),
                        child: TextButton(
                          onPressed: () {
                            context
                                .read<BasketCubit>()
                                .updateDeliverPickUp(isDelivery: false);
                          },
                          child: Row(
                            children: [
                              Container(
                                width: CommonDimens.defaultLineGap,
                                height: CommonDimens.defaultLineGap,
                                decoration: BoxDecoration(
                                    color: option != true
                                        ? CommonColors.primary
                                        : CommonColors.secondaryFaint,
                                    borderRadius: BorderRadius.circular(
                                        CommonDimens.defaultLineGap)),
                              ),
                              const SizedBox(width: CommonDimens.defaultGap),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: CommonDimens.defaultGap),
                        child: TextButton(
                          onPressed: () {
                            context
                                .read<BasketCubit>()
                                .updateDeliverPickUp(isDelivery: true);
                          },
                          child: Row(
                            children: [
                              Container(
                                width: CommonDimens.defaultLineGap,
                                height: CommonDimens.defaultLineGap,
                                decoration: BoxDecoration(
                                  color: option == true
                                      ? CommonColors.primary
                                      : CommonColors.secondaryFaint,
                                  borderRadius: BorderRadius.circular(
                                      CommonDimens.defaultLineGap),
                                ),
                              ),
                              const SizedBox(width: CommonDimens.defaultGap),
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
                          ?.copyWith(fontSize: CommonFontSize.font_12),
                    )),
                const SizedBox(width: CommonDimens.defaultLineGap),
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
