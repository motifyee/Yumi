import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

class ExpiredBasket extends StatelessWidget {
  const ExpiredBasket({super.key});

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
                    child: Text(S.of(context).basketExpiredAndWillBeDeleted,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      context.router.maybePop();
                    },
                    child: Text(
                      S.of(context).ok,
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
