import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/statics/theme_statics.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ThemeSelector.statics.defaultLineGap,
          vertical: ThemeSelector.statics.defaultGap),
      decoration: BoxDecoration(
        color: ThemeSelector.colors.background,
        borderRadius: BorderRadius.circular(
            ThemeSelector.statics.defaultBorderRadiusMedium),
        boxShadow: [
          BoxShadow(
              color: ThemeSelector.colors.shadow.withOpacity(.05),
              blurRadius: 15)
        ],
      ),
      child: Row(
        children: [
          Container(
            width: ThemeSelector.statics.defaultTitleGapLarge,
            height: ThemeSelector.statics.defaultTitleGapLarge,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: ThemeSelector.colors.secondaryFaint,
                borderRadius: BorderRadius.circular(
                    ThemeSelector.statics.defaultTitleGapLarge)),
            child: Padding(
              padding: EdgeInsets.only(
                top: ThemeSelector.statics.defaultMicroGap,
                right: ThemeSelector.statics.defaultMicroGap,
                left: ThemeSelector.statics.defaultMicroGap,
              ),
              child: SvgPicture.asset(
                'assets/images/profile.svg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(width: ThemeSelector.statics.defaultGap),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ThemeSelector.statics.defaultMicroGap),
                child: Text(
                  'Ahmed',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              RatingBar(
                ignoreGestures: true,
                initialRating: 3.5,
                allowHalfRating: true,
                itemSize: ThemeSelector.fonts.font_18,
                ratingWidget: RatingWidget(
                  empty: Icon(Icons.star_border,
                      color: ThemeSelector.colors.warning),
                  full: Icon(Icons.star, color: ThemeSelector.colors.warning),
                  half: Icon(
                    Icons.star_half,
                    color: ThemeSelector.colors.warning,
                  ),
                ),
                onRatingUpdate: (value) {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
