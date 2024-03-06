import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class TextCurrency extends StatelessWidget {
  TextCurrency(
      {super.key,
      required this.value,
      this.fontSize,
      this.fontWeight = FontWeight.w700});

  final double value;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '\$',
          style: TextStyle(
            color: ThemeSelector.colors.secondary,
            fontWeight: FontWeight.w300,
            fontSize: (fontSize ?? ThemeSelector.fonts.font_16) * .75,
          ),
        ),
        Text(
          value.toStringAsFixed(2),
          style: TextStyle(
            color: ThemeSelector.colors.secondary,
            fontWeight: fontWeight,
            fontSize: fontSize ?? ThemeSelector.fonts.font_16,
          ),
        ),
      ],
    );
  }
}
