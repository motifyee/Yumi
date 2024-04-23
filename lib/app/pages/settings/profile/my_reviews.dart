import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

class MyReviews extends StatelessWidget {
  const MyReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ThemeSelector.statics.defaultTitleGap),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/images/users.svg'),
              SizedBox(width: ThemeSelector.statics.defaultLineGap),
              Text(
                S.of(context).myReviews,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
          SizedBox(height: ThemeSelector.statics.defaultGap),
          for (var review in [4.5, 5, 1, 3])
            Padding(
              padding:
                  EdgeInsets.only(bottom: ThemeSelector.statics.defaultGap),
              child: Row(
                children: [
                  Container(
                    width: ThemeSelector.statics.iconSizeLarge,
                    height: ThemeSelector.statics.iconSizeLarge,
                    decoration: BoxDecoration(
                      color: ThemeSelector.colors.secondaryTant,
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.buttonBorderRadius),
                    ),
                    child: Center(
                      child: SvgPicture.asset('assets/images/profile1.svg'),
                    ),
                  ),
                  const Expanded(child: Text('')),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ThemeSelector.statics.defaultGap,
                        vertical: ThemeSelector.statics.defaultGap / 2),
                    decoration: BoxDecoration(
                      color: ThemeSelector.colors.primary,
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.buttonBorderRadius),
                    ),
                    child: Row(
                      children: [
                        Text(review.toString(),
                            style: Theme.of(context).textTheme.displaySmall),
                        SizedBox(width: ThemeSelector.statics.defaultGap / 2),
                        SvgPicture.asset(
                          'assets/images/star.svg',
                          colorFilter: ColorFilter.mode(
                              ThemeSelector.colors.onPrimary, BlendMode.srcIn),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
