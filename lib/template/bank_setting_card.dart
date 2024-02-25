import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

class BankSettingCard extends StatelessWidget {
  const BankSettingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ThemeSelector.statics.defaultTitleGap,
        right: ThemeSelector.statics.defaultTitleGap,
        left: ThemeSelector.statics.defaultTitleGap,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(ThemeSelector.statics.defaultLineGap),
        decoration: BoxDecoration(
          color: ThemeSelector.colors.background,
          borderRadius: BorderRadius.circular(
              ThemeSelector.statics.defaultBorderRadiusSmall),
          boxShadow: [
            BoxShadow(
              color: ThemeSelector.colors.secondary.withOpacity(.15),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(2, 4),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/bank.svg',
                  colorFilter: ColorFilter.mode(
                      ThemeSelector.colors.secondary, BlendMode.srcIn),
                ),
                SizedBox(width: ThemeSelector.statics.defaultGap),
                Text(S.of(context).bankAccount),
                Expanded(child: Text('')),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      S.of(context).edit,
                      style: TextStyle(color: ThemeSelector.colors.secondary),
                    ))
              ],
            ),
            SizedBox(height: ThemeSelector.statics.defaultLineGap),
            Row(
              children: [
                Text(
                  S.of(context).holderName,
                  style: TextStyle(color: ThemeSelector.colors.secondary),
                ),
                Expanded(child: Text('')),
                Text(
                  'Ayman',
                  style: TextStyle(color: ThemeSelector.colors.secondaryTant),
                ),
              ],
            ),
            SizedBox(height: ThemeSelector.statics.defaultGap),
            Row(
              children: [
                Text(
                  S.of(context).nameOnCard,
                  style: TextStyle(color: ThemeSelector.colors.secondary),
                ),
                Expanded(child: Text('')),
                Text(
                  '',
                  style: TextStyle(color: ThemeSelector.colors.secondaryTant),
                ),
              ],
            ),
            SizedBox(height: ThemeSelector.statics.defaultGap),
            Row(
              children: [
                Text(
                  S.of(context).sortCode,
                  style: TextStyle(color: ThemeSelector.colors.secondary),
                ),
                Expanded(child: Text('')),
                Text(
                  '',
                  style: TextStyle(color: ThemeSelector.colors.secondaryTant),
                ),
              ],
            ),
            SizedBox(height: ThemeSelector.statics.defaultGap),
            Row(
              children: [
                Text(
                  S.of(context).accountNumber,
                  style: TextStyle(color: ThemeSelector.colors.secondary),
                ),
                Expanded(child: Text('')),
                Text(
                  '',
                  style: TextStyle(color: ThemeSelector.colors.secondaryTant),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
