import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class ConfirmButton extends StatelessWidget {
  ConfirmButton({super.key, this.onPressed, required this.label});

  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: ThemeStatics.buttonPaddingV),
        width: ThemeStatics.buttonWidth,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(ThemeStatics.buttonBorderRadius),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
                fontWeight: Theme.of(context).textTheme.titleLarge?.fontWeight),
          ),
        ),
      ),
    );
  }
}
