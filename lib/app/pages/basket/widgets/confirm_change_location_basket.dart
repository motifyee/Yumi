import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

class ConfirmChangeLocationBasket extends StatelessWidget {
  const ConfirmChangeLocationBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 125,
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
            SizedBox(height: ThemeSelector.statics.defaultBlockGap),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ThemeSelector.statics.defaultInputGap),
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
                          ?.copyWith(fontSize: ThemeSelector.fonts.font_12),
                    )),
                SizedBox(width: ThemeSelector.statics.defaultLineGap),
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
