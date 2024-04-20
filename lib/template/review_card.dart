import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:yumi/model/review_model/review_model.dart';
import 'package:yumi/statics/theme_statics.dart';

class ReviewCard extends StatelessWidget {
  ReviewCard({super.key, required this.review});

  ReviewModel review;

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
              blurRadius: 5,
              offset: const Offset(2, 3))
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
            child: Center(
              child: Text(
                review.customerName[0].toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: ThemeSelector.fonts.font_24,
                    color: ThemeSelector.colors.onSecondary),
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
                  review.customerName,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              RatingBar(
                ignoreGestures: true,
                initialRating: review.rate,
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
