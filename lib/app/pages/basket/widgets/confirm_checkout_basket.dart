import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:yumi/app/pages/basket/widgets/confirm_change_location_basket.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/routes/routes.gr.dart';

class ConfirmCheckOutBasket extends StatelessWidget {
  const ConfirmCheckOutBasket({super.key});

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
                              text: S.of(context).yourOrderSendToSavedLocation,
                              style: Theme.of(context).textTheme.bodyMedium),
                          TextSpan(
                              text:
                                  ' "${context.read<UserCubit>().state.address?.addressTitle}", \n',
                              style: Theme.of(context).textTheme.labelMedium),
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
                      showDialog(
                          context: context,
                          builder: (context) =>
                              const ConfirmChangeLocationBasket());
                    },
                    child: Text(
                      S.of(context).change,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(fontSize: CommonFontSize.font_12),
                    )),
                const SizedBox(width: CommonDimens.defaultLineGap),
                TextButton(
                    onPressed: () {
                      context.router.push(CheckOutRoute());
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
