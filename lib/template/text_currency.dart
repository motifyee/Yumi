import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class TextCurrency extends StatelessWidget {
  TextCurrency({super.key, required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$',
          style: TextStyle(
            color: ThemeSelector.colors.secondary,
            fontWeight: FontWeight.w300,
            fontSize: ThemeSelector.fonts.font_9,
          ),
        ),
        Text(
          value.toStringAsFixed(2),
          style: TextStyle(
            color: ThemeSelector.colors.secondary,
            fontWeight: FontWeight.w700,
            fontSize: ThemeSelector.fonts.font_16,
          ),
        ),
      ],
    );
  }
}
