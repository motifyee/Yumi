import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';

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
                fontSize: (fontSize ?? CommonFontSize.font_12) * .83,
                fontWeight: FontWeight.w300,
              ),
        ),
        Text(
          value.toStringAsFixed(2),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: fontSize ?? CommonFontSize.font_12,
                fontWeight: FontWeight.w300,
              ),
        ),
      ],
    );
  }
}
