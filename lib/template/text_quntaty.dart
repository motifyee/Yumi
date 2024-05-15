import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class TextQuantity extends StatelessWidget {
  const TextQuantity({super.key, required this.value, this.fontSize});

  final double value;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'X',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: (fontSize ?? ThemeSelector.fonts.font_12) * .83,
                fontWeight: FontWeight.w300,
              ),
        ),
        Text(
          value.toStringAsFixed(2),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: fontSize ?? ThemeSelector.fonts.font_12,
                fontWeight: FontWeight.w300,
              ),
        ),
      ],
    );
  }
}
