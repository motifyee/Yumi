import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:yumi/app/components/loading_indicator/loading.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/review_model/review_model.dart';
import 'package:yumi/service/review_service.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/snack_bar.dart';
import 'package:yumi/template/text_form_field.dart';

class ReviewChefDriver extends StatefulWidget {
  ReviewChefDriver(
      {super.key,
      this.isChefOnly = false,
      required this.reviewDriver,
      required this.reviewChef});

  bool isChefOnly;
  ReviewModel reviewDriver;
  ReviewModel reviewChef;

  @override
  State<ReviewChefDriver> createState() => _ReviewChefDriverState();
}

class _ReviewChefDriverState extends State<ReviewChefDriver> {
  final _formController = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: Loading(),
          )
        : Material(
            child: Form(
              key: _formController,
              child: Container(
                width: MediaQuery.of(context).size.width -
                    ThemeSelector.statics.defaultBlockGap,
                decoration: BoxDecoration(
                    color: ThemeSelector.colors.background,
                    borderRadius: BorderRadius.circular(
                        ThemeSelector.statics.defaultGap)),
                child: Padding(
                  padding: EdgeInsets.all(ThemeSelector.statics.defaultLineGap),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocConsumer<UserBloc, UserState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return Text(
                            '${S.of(context).hi} ${state.user.userName},',
                            style: Theme.of(context).textTheme.titleMedium,
                          );
                        },
                      ),
                      Text(S.of(context).youCanNowCreateYourReview,
                          style: Theme.of(context).textTheme.bodyMedium),
                      if (!widget.isChefOnly)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: ThemeSelector.statics.defaultLineGap),
                            Text(S.of(context).theDriver,
                                style: Theme.of(context).textTheme.bodyLarge),
                            Center(
                              child: RatingBar(
                                initialRating: widget.reviewDriver.rate,
                                allowHalfRating: true,
                                itemSize: ThemeSelector.fonts.font_24,
                                ratingWidget: RatingWidget(
                                  empty: Icon(Icons.star_border,
                                      color: ThemeSelector.colors.warning),
                                  full: Icon(Icons.star,
                                      color: ThemeSelector.colors.warning),
                                  half: Icon(
                                    Icons.star_half,
                                    color: ThemeSelector.colors.warning,
                                  ),
                                ),
                                onRatingUpdate: (value) => widget.reviewDriver =
                                    widget.reviewDriver.copyWith(rate: value),
                              ),
                            ),
                            Material(
                              child: TextFormFieldTemplate(
                                borderStyle:
                                    TextFormFieldBorderStyle.borderedRound,
                                hintText: S.of(context).reviewTheDriver,
                                onChange: (value) => widget.reviewDriver =
                                    widget.reviewDriver
                                        .copyWith(reviewComment: value ?? ''),
                              ),
                            ),
                          ],
                        ),
                      SizedBox(height: ThemeSelector.statics.defaultLineGap),
                      Text(S.of(context).theChef,
                          style: Theme.of(context).textTheme.bodyLarge),
                      Center(
                        child: RatingBar(
                          initialRating: widget.reviewChef.rate,
                          allowHalfRating: true,
                          itemSize: ThemeSelector.fonts.font_24,
                          ratingWidget: RatingWidget(
                            empty: Icon(Icons.star_border,
                                color: ThemeSelector.colors.warning),
                            full: Icon(Icons.star,
                                color: ThemeSelector.colors.warning),
                            half: Icon(
                              Icons.star_half,
                              color: ThemeSelector.colors.warning,
                            ),
                          ),
                          onRatingUpdate: (value) => widget.reviewChef =
                              widget.reviewChef.copyWith(rate: value),
                        ),
                      ),
                      TextFormFieldTemplate(
                        borderStyle: TextFormFieldBorderStyle.borderedRound,
                        hintText: S.of(context).reviewTheChef,
                        onChange: (value) => widget.reviewChef = widget
                            .reviewChef
                            .copyWith(reviewComment: value ?? ''),
                      ),
                      SizedBox(height: ThemeSelector.statics.defaultLineGap),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.router.popForced();
                            },
                            child: Text(S.of(context).cancel,
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isLoading = true;
                              });
                              Future.wait([
                                ReviewService.updateRate(
                                    review: widget.reviewChef,
                                    chefId: widget.reviewChef.buddiesUserId),
                                if (!widget.isChefOnly)
                                  ReviewService.updateRate(
                                      review: widget.reviewDriver,
                                      driverId:
                                          widget.reviewDriver.buddiesUserId),
                              ]).then((value) {
                                setState(() {
                                  _isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: SnackBarMassage(
                                      massage:
                                          S.of(context).thankYouForYourReview,
                                    ),
                                  ),
                                );
                                context.router.popForced();
                              }).catchError((err) {
                                setState(() {
                                  _isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: SnackBarMassage(
                                      massage: err.response?.data['message'],
                                    ),
                                  ),
                                );
                              });
                            },
                            child: Text(S.of(context).review,
                                style:
                                    Theme.of(context).textTheme.headlineMedium),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
