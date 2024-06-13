import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/domain/profile/entities/review.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/statics/theme_statics.dart';

class MyReviews extends StatelessWidget {
  const MyReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ThemeSelector.statics.defaultTitleGap),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        // selector: (state) => state.reviews,, Status<List<Review>>
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/images/users.svg'),
                  SizedBox(width: ThemeSelector.statics.defaultLineGap),
                  Text(
                    S.of(context).myReviews,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: ThemeSelector.statics.defaultMediumGap),
                ],
              ),
              for (var review in state.reviews) ReviewWidget(review: review),
            ],
          );
        },
      ),
    );
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: ThemeSelector.statics.defaultGap),
      child: Row(
        children: [
          Container(
            width: ThemeSelector.statics.iconSizeMedium,
            height: ThemeSelector.statics.iconSizeMedium,
            decoration: BoxDecoration(
              color: ThemeSelector.colors.secondaryFaint,
              borderRadius: BorderRadius.circular(
                  ThemeSelector.statics.buttonBorderRadius),
            ),
            child: Center(
              child: Text(
                (review.customerName[0]).toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(fontSize: ThemeSelector.fonts.font_24),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(child: Text(review.customerName)),
          RatingContainer(rate: review.rate),
        ],
      ),
    );
  }
}

class RatingContainer extends StatelessWidget {
  const RatingContainer({
    super.key,
    required this.rate,
  });

  final double rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ThemeSelector.statics.defaultGap,
          vertical: ThemeSelector.statics.defaultGap / 2),
      decoration: BoxDecoration(
        color: ThemeSelector.colors.primary,
        borderRadius:
            BorderRadius.circular(ThemeSelector.statics.buttonBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(rate.toStringAsFixed(1),
              style: Theme.of(context).textTheme.displaySmall),
          SizedBox(width: ThemeSelector.statics.defaultGap / 2),
          SvgPicture.asset(
            'assets/images/star.svg',
            colorFilter: ColorFilter.mode(
                ThemeSelector.colors.onPrimary, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
