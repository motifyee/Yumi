import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/basket/widgets/confirm_change_location_basket.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/route/route.gr.dart';
import 'package:yumi/statics/theme_statics.dart';

class ConfirmCheckOutBasket extends StatelessWidget {
  const ConfirmCheckOutBasket({super.key});

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
                    '${S.of(context).hi} ${context.read<UserBloc>().state.user.userName}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
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
                              text: S.of(context).yourOrderSendToSavedLocation,
                              style: Theme.of(context).textTheme.bodyMedium),
                          TextSpan(
                              text:
                                  ' "${context.read<UserBloc>().state.address?.addressTitle}", \n',
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
                          builder: (context) => ConfirmChangeLocationBasket());
                    },
                    child: Text(
                      S.of(context).change,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(fontSize: ThemeSelector.fonts.font_12),
                    )),
                SizedBox(width: ThemeSelector.statics.defaultLineGap),
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
