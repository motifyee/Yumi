import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:common_code/domain/profile/entities/review.dart';
import 'package:yumi/generated/l10n.dart';

class MyReviews extends StatelessWidget {
  const MyReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultTitleGap),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        // selector: (state) => state.reviews,, Status<List<Review>>
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/images/users.svg'),
                  const SizedBox(width: CommonDimens.defaultLineGap),
                  Text(
                    S.of(context).myReviews,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: CommonDimens.defaultMediumGap),
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
      padding: const EdgeInsets.only(bottom: CommonDimens.defaultGap),
      child: Row(
        children: [
          Container(
            width: CommonDimens.iconSizeMedium,
            height: CommonDimens.iconSizeMedium,
            decoration: BoxDecoration(
              color: CommonColors.secondaryFaint,
              borderRadius: BorderRadius.circular(CommonDimens.buttonBorderRadius),
            ),
            child: Center(
              child: Text(
                (review.customerName[0]).toUpperCase(),
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: CommonFontSize.font_24),
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
      padding: const EdgeInsets.symmetric(horizontal: CommonDimens.defaultGap, vertical: CommonDimens.defaultGap / 2),
      decoration: BoxDecoration(
        color: CommonColors.primary,
        borderRadius: BorderRadius.circular(CommonDimens.buttonBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(rate.toStringAsFixed(1), style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(width: CommonDimens.defaultGap / 2),
          SvgPicture.asset(
            'assets/images/star.svg',
            colorFilter: ColorFilter.mode(CommonColors.onPrimary, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
