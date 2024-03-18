import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/model/chef_model.dart';
import 'package:yumi/statics/theme_statics.dart';

class ChefBanner extends StatelessWidget {
  const ChefBanner(
      {super.key,
      required this.chef,
      required this.borderRadius,
      required this.width,
      this.height});

  final ChefModel chef;
  final BorderRadius borderRadius;
  final double width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height ?? ThemeSelector.statics.defaultImageHeight,
          child: Stack(children: [
            Container(
              clipBehavior: Clip.hardEdge,
              width: width,
              decoration: BoxDecoration(borderRadius: borderRadius),
              child: Hero(
                tag: 'chef_${chef.id}',
                child: Image.memory(
                  base64Decode(chef.imageProfile ?? ''),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    'assets/images/354.jpeg',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ThemeSelector.statics.defaultGap),
                  decoration: BoxDecoration(
                      color: ThemeSelector.colors.success,
                      borderRadius: BorderRadius.circular(
                          ThemeSelector.statics.defaultBorderRadiusLarge)),
                  child: Text(
                    S.of(context).open,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ),
          ]),
        ),
        Padding(
          padding: EdgeInsets.all(ThemeSelector.statics.defaultGap),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chef.fullName ?? '',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontSize: ThemeSelector.fonts.font_16,
                        ),
                  ),
                  Row(
                    children: [
                      RatingBar(
                        ignoreGestures: true,
                        initialRating: 3.5,
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
                        onRatingUpdate: (value) {},
                      ),
                      Text(' | ',
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text('Hygiene -',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  )
                ],
              ),
              Text(
                '0.2 Km',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        )
      ],
    );
  }
}
