import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/text_currency.dart';
import 'package:yumi/template/text_quntaty.dart';

class ProductInCard extends StatelessWidget {
  const ProductInCard({
    super.key,
    required this.isView,
    required this.maxWidth,
  });

  final bool isView;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isView ? maxWidth : 50,
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _ProductImage(),
          AnimatedSize(
            duration: ThemeSelector.statics.animationDuration,
            child: SizedBox(
              width: isView ? maxWidth - 50 : 0,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Breakfast',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          '81 calories, 1.7g protein, 12g carbs, 2.74 fat',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: ThemeSelector.fonts.font_9,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextCurrency(
                          value: 5.00, fontSize: ThemeSelector.fonts.font_14),
                      TextQuantity(
                        value: 2.00,
                        fontSize: ThemeSelector.fonts.font_10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            ThemeSelector.statics.defaultBorderRadiusSmall),
      ),
      child: Image.asset(
        'assets/images/354.jpeg',
        width: ThemeSelector.statics.iconSizeLarge,
        height: ThemeSelector.statics.iconSizeLarge,
        fit: BoxFit.fill,
      ),
    );
  }
}
