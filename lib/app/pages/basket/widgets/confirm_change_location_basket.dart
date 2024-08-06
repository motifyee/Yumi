import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/generated/l10n.dart';

class ConfirmChangeLocationBasket extends StatelessWidget {
  const ConfirmChangeLocationBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 125,
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
            const SizedBox(height: CommonDimens.defaultBlockGap),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: CommonDimens.defaultInputGap),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  '${S.of(context).yourOrderWillBeCancelled},  ',
                              style: Theme.of(context).textTheme.bodyMedium),
                          TextSpan(
                              text: S.of(context).doYouWantToContinue,
                              style: Theme.of(context).textTheme.labelMedium),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
                      context
                          .read<BasketCubit>()
                          .deleteBasket(isLocationChange: true);
                    },
                    child: Text(
                      S.of(context).yes,
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
