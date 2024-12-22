import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCard extends StatelessWidget {
  ReviewCard({super.key, required this.review});

  Review review;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: CommonDimens.defaultLineGap,
        vertical: CommonDimens.defaultGap,
      ),
      decoration: BoxDecoration(
        color: CommonColors.background,
        borderRadius:
            BorderRadius.circular(CommonDimens.defaultBorderRadiusMedium),
        boxShadow: [
          BoxShadow(
            color: CommonColors.shadow.withOpacity(.05),
            blurRadius: 5,
            offset: const Offset(2, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: CommonDimens.defaultTitleGapLarge,
            height: CommonDimens.defaultTitleGapLarge,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: CommonColors.secondaryFaint,
              borderRadius:
                  BorderRadius.circular(CommonDimens.defaultTitleGapLarge),
            ),
            child: Center(
              child: Text(
                review.customerName[0].toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: CommonFontSize.font_24,
                      color: CommonColors.onSecondary,
                    ),
              ),
            ),
          ),
          const SizedBox(width: CommonDimens.defaultGap),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: CommonDimens.defaultMicroGap,
                ),
                child: Text(
                  review.customerName,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              RatingBar(
                ignoreGestures: true,
                initialRating: review.rate,
                allowHalfRating: true,
                itemSize: CommonFontSize.font_18,
                ratingWidget: RatingWidget(
                  empty: Icon(Icons.star_border, color: CommonColors.warning),
                  full: Icon(Icons.star, color: CommonColors.warning),
                  half: Icon(
                    Icons.star_half,
                    color: CommonColors.warning,
                  ),
                ),
                onRatingUpdate: (value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
