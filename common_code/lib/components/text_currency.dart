import 'package:common_code/resources/common_font_size.dart';
import 'package:flutter/material.dart';

class TextCurrency extends StatelessWidget {
  const TextCurrency(
      {super.key,
      required this.value,
      this.fontSize,
      this.prefix,
      this.fontWeight = FontWeight.w700});

  final double value;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? prefix;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          prefix ?? '',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: fontWeight,
                fontSize: (fontSize ?? CommonFontSize.font_16),
              ),
        ),
        Text(
          '£',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: (fontSize ?? CommonFontSize.font_16) * .75,
              ),
        ),
        Text(
          value.toStringAsFixed(2),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: fontWeight,
                fontSize: fontSize ?? CommonFontSize.font_16,
              ),
        ),
      ],
    );
  }
}