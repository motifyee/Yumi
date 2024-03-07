import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.isActive});

  final Function()? onPressed;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => isActive
                ? ThemeSelector.colors.primary
                : ThemeSelector.colors.secondaryFaint,
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(ThemeSelector.statics.defaultBorderRadius),
              ),
            ),
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isActive
                    ? ThemeSelector.colors.onPrimary
                    : ThemeSelector.colors.secondary,
              ),
        ));
  }
}
