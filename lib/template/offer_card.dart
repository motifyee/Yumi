import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yumi/statics/theme_statics.dart';

class OfferCard extends StatefulWidget {
  OfferCard({super.key, required this.offer});

  dynamic offer;

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  double rightPosition = -100;
  Duration duration = ThemeSelector.statics.slowAnimationDuration;

  void animationFn() {
    setState(() {
      rightPosition = -100;
      duration = Duration.zero;
    });
    Timer(Duration(milliseconds: 100), () {
      setState(() {
        rightPosition = 0;
        duration = ThemeSelector.statics.slowAnimationDuration;
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
      padding: EdgeInsets.symmetric(
        horizontal: ThemeSelector.statics.defaultGap,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(
            'assets/images/offer_card.svg',
            colorFilter: ColorFilter.mode(
                widget.offer['color'] ?? ThemeSelector.colors.primary,
                BlendMode.srcIn),
          ),
          Align(
            child: Row(
              children: [
                Flexible(
                  flex: 9,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: ThemeSelector.statics.defaultTitleGap,
                      left: ThemeSelector.statics.defaultLineGap,
                      right: ThemeSelector.statics.defaultInputGap,
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
                                fontSize: ThemeSelector.fonts.font_12,
                              ),
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultGap),
                        Text(
                          'Our Happy Customer',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                fontSize: ThemeSelector.fonts.font_10,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: ThemeSelector.colors.warning,
                              size: ThemeSelector.fonts.font_10,
                            ),
                            Text(
                              '4.2 (2k Reviews)',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge
                                  ?.copyWith(
                                    fontSize: ThemeSelector.fonts.font_10,
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
                          padding: EdgeInsets.only(
                            top: ThemeSelector.statics.defaultMediumGap,
                          ),
                          child: Text(
                            '${widget.offer['percent'].toString()}%',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                  fontSize: ThemeSelector.fonts.font_38,
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
            width: ThemeSelector.statics.defaultGapExtraExtreme,
            height: ThemeSelector.statics.defaultGapExtraExtreme,
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
