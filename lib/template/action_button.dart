import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class ActionButton extends StatelessWidget {
  ActionButton(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.isActive,
      this.icon,
      this.activeColor,
      this.activeTextColor,
      this.notActiveColor,
      this.notActiveTextColor});

  final Function()? onPressed;
  final String label;
  final bool isActive;
  Widget? icon;
  Color? activeColor;
  Color? activeTextColor;
  Color? notActiveColor;
  Color? notActiveTextColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => isActive
                ? activeColor ?? ThemeSelector.colors.primary
                : notActiveColor ?? ThemeSelector.colors.secondaryFaint,
          ),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(ThemeSelector.statics.defaultBorderRadius),
              ),
            ),
          ),
        ),
        child: Row(
          children: [
            if (icon != null) icon!,
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isActive
                        ? activeTextColor ?? ThemeSelector.colors.onPrimary
                        : notActiveTextColor ?? ThemeSelector.colors.secondary,
                  ),
            ),
          ],
        ));
  }
}
