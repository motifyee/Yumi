import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/util/global_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/app/pages/chef_profile/cubit/review_cubit.dart';
import 'package:yumi/generated/l10n.dart';

class ReviewChefDriver extends StatefulWidget {
  ReviewChefDriver({
    super.key,
    this.isChefOnly = false,
    required this.reviewDriver,
    required this.reviewChef,
  });

  bool isChefOnly;
  Review reviewDriver;
  Review reviewChef;

  @override
  State<ReviewChefDriver> createState() => _ReviewChefDriverState();
}

class _ReviewChefDriverState extends State<ReviewChefDriver> {
  final _formController = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: PacmanLoadingWidget(),
          )
        : Material(
            child: Form(
              key: _formController,
              child: Container(
                width: MediaQuery.of(context).size.width -
                    CommonDimens.defaultBlockGap,
                decoration: BoxDecoration(
                  color: CommonColors.background,
                  borderRadius: BorderRadius.circular(CommonDimens.defaultGap),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(CommonDimens.defaultLineGap),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocConsumer<UserCubit, UserState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return Text(
                            '${S.of(context).hi} ${state.user.userName},',
                            style: Theme.of(context).textTheme.titleMedium,
                          );
                        },
                      ),
                      Text(
                        S.of(context).youCanNowCreateYourReview,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      if (!widget.isChefOnly)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: CommonDimens.defaultLineGap),
                            Text(
                              S.of(context).theDriver,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Center(
                              child: RatingBar(
                                initialRating: widget.reviewDriver.rate,
                                allowHalfRating: true,
                                itemSize: CommonFontSize.font_24,
                                ratingWidget: RatingWidget(
                                  empty: Icon(
                                    Icons.star_border,
                                    color: CommonColors.warning,
                                  ),
                                  full: Icon(
                                    Icons.star,
                                    color: CommonColors.warning,
                                  ),
                                  half: Icon(
                                    Icons.star_half,
                                    color: CommonColors.warning,
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
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    CustomRegex.lettersNumbersBlankOnly,
                                  ),
                                ],
                                onChange: (value) => widget.reviewDriver =
                                    widget.reviewDriver
                                        .copyWith(comment: value ?? ''),
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: CommonDimens.defaultLineGap),
                      Text(
                        S.of(context).theChef,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Center(
                        child: RatingBar(
                          initialRating: widget.reviewChef.rate,
                          allowHalfRating: true,
                          itemSize: CommonFontSize.font_24,
                          ratingWidget: RatingWidget(
                            empty: Icon(
                              Icons.star_border,
                              color: CommonColors.warning,
                            ),
                            full: Icon(Icons.star, color: CommonColors.warning),
                            half: Icon(
                              Icons.star_half,
                              color: CommonColors.warning,
                            ),
                          ),
                          onRatingUpdate: (value) => widget.reviewChef =
                              widget.reviewChef.copyWith(rate: value),
                        ),
                      ),
                      TextFormFieldTemplate(
                        borderStyle: TextFormFieldBorderStyle.borderedRound,
                        hintText: S.of(context).reviewTheChef,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            CustomRegex.lettersNumbersBlankOnly,
                          ),
                        ],
                        onChange: (value) => widget.reviewChef =
                            widget.reviewChef.copyWith(comment: value ?? ''),
                      ),
                      const SizedBox(height: CommonDimens.defaultLineGap),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.router.popForced();
                            },
                            child: Text(
                              S.of(context).cancel,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          BlocProvider(
                            create: (context) => ReviewCubit(),
                            child: Builder(
                              builder: (context) {
                                return TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _isLoading = true;
                                    });

                                    Future.wait([
                                      context.read<ReviewCubit>().updateReviews(
                                            review: widget.reviewChef,
                                            chefId:
                                                widget.reviewChef.buddiesUserId,
                                          ),
                                      if (!widget.isChefOnly)
                                        context
                                            .read<ReviewCubit>()
                                            .updateReviews(
                                              review: widget.reviewDriver,
                                              driverId: widget
                                                  .reviewDriver.buddiesUserId,
                                            ),
                                    ]).then((value) {
                                      setState(() {
                                        _isLoading = false;
                                      });

                                      if (value.any(
                                        (e) => e == false,
                                      )) return;

                                      GlobalContext().snackBar(
                                        S.current.thankYouForYourReview,
                                      );

                                      GlobalContext().context.router.maybePop();
                                    }).catchError((err) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      GlobalContext().snackBar(
                                        err.response?.data['message'],
                                      );
                                    });
                                  },
                                  child: Text(
                                    S.of(context).review,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
