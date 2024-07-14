import 'dart:async';

import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OfferCard extends StatefulWidget {
  OfferCard({super.key, required this.offer});

  dynamic offer;

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  double rightPosition = -100;
  Duration duration = CommonDimens.slowAnimationDuration;

  void animationFn() {
    setState(() {
      rightPosition = -100;
      duration = Duration.zero;
    });
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        rightPosition = 0;
        duration = CommonDimens.slowAnimationDuration;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    animationFn();
  }

  @override
  void didUpdateWidget(covariant OfferCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    animationFn();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      padding: const EdgeInsets.symmetric(
        horizontal: CommonDimens.defaultGap,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(
            'assets/images/offer_card.svg',
            colorFilter: ColorFilter.mode(
                widget.offer['color'] ?? CommonColors.primary, BlendMode.srcIn),
          ),
          Align(
            child: Row(
              children: [
                Flexible(
                  flex: 9,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: CommonDimens.defaultTitleGap,
                      left: CommonDimens.defaultLineGap,
                      right: CommonDimens.defaultInputGap,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Great healthy food and lots of discounted prices',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                fontSize: CommonFontSize.font_12,
                              ),
                        ),
                        const SizedBox(height: CommonDimens.defaultGap),
                        Text(
                          'Our Happy Customer',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                fontSize: CommonFontSize.font_10,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: CommonColors.warning,
                              size: CommonFontSize.font_10,
                            ),
                            Text(
                              '4.2 (2k Reviews)',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                    fontSize: CommonFontSize.font_10,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: CommonDimens.defaultMediumGap,
                          ),
                          child: Text(
                            '${widget.offer['percent'].toString()}%',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                  fontSize: CommonFontSize.font_38,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            top: 0,
            right: rightPosition,
            width: CommonDimens.defaultGapExtraExtreme,
            height: CommonDimens.defaultGapExtraExtreme,
            duration: duration,
            curve: Curves.easeInOut,
            child: Image.asset(
              widget.offer['image'],
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
