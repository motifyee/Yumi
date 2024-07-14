import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/generated/l10n.dart';

class MyReviews extends StatelessWidget {
  const MyReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: CommonDimens.defaultTitleGap),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/images/users.svg'),
              const SizedBox(width: CommonDimens.defaultLineGap),
              Text(
                S.of(context).myReviews,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
          const SizedBox(height: CommonDimens.defaultGap),
          for (var review in [4.5, 5, 1, 3])
            Padding(
              padding: const EdgeInsets.only(bottom: CommonDimens.defaultGap),
              child: Row(
                children: [
                  Container(
                    width: CommonDimens.iconSizeLarge,
                    height: CommonDimens.iconSizeLarge,
                    decoration: BoxDecoration(
                      color: CommonColors.secondaryTant,
                      borderRadius: BorderRadius.circular(
                          CommonDimens.buttonBorderRadius),
                    ),
                    child: Center(
                      child: SvgPicture.asset('assets/images/profile1.svg'),
                    ),
                  ),
                  const Expanded(child: Text('')),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: CommonDimens.defaultGap,
                        vertical: CommonDimens.defaultGap / 2),
                    decoration: BoxDecoration(
                      color: CommonColors.primary,
                      borderRadius: BorderRadius.circular(
                          CommonDimens.buttonBorderRadius),
                    ),
                    child: Row(
                      children: [
                        Text(review.toString(),
                            style: Theme.of(context).textTheme.displaySmall),
                        const SizedBox(width: CommonDimens.defaultGap / 2),
                        SvgPicture.asset(
                          'assets/images/star.svg',
                          colorFilter: ColorFilter.mode(
                              CommonColors.onPrimary, BlendMode.srcIn),
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
