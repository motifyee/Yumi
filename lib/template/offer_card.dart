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
      padding: EdgeInsets.only(
        top: ThemeSelector.statics.defaultLineGap,
        left: ThemeSelector.statics.defaultGap,
        right: ThemeSelector.statics.defaultGap,
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
                      left: ThemeSelector.statics.defaultInputGap,
                      right: ThemeSelector.statics.defaultInputGap,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Great healthy food and lots of discounted prices',
                          style: TextStyle(
                            color: ThemeSelector.colors.onPrimary,
                            fontSize: ThemeSelector.fonts.font_12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: ThemeSelector.statics.defaultGap),
                        Text(
                          'Our Happy Customer',
                          style: TextStyle(
                            color: ThemeSelector.colors.onPrimary,
                            fontSize: ThemeSelector.fonts.font_10,
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
                              style: TextStyle(
                                color: ThemeSelector.colors.onPrimary,
                                fontSize: ThemeSelector.fonts.font_10,
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
                            top: ThemeSelector.statics.defaultTitleGapLarge,
                          ),
                          child: Text(
                            '${widget.offer['percent'].toString()}%',
                            style: TextStyle(
                              color: ThemeSelector.colors.onPrimary,
                              fontSize: ThemeSelector.fonts.font_38,
                              fontWeight: FontWeight.w700,
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
            top: -ThemeSelector.statics.defaultLineGap,
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
