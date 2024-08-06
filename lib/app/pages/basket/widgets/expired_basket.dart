import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:yumi/generated/l10n.dart';

class ExpiredBasket extends StatelessWidget {
  const ExpiredBasket({super.key});

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
