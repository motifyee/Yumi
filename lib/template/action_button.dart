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
      this.notActiveTextColor,
      this.isNotificationIconShow = false});

  final Function()? onPressed;
  final String label;
  final bool isActive;
  Widget? icon;
  Color? activeColor;
  Color? activeTextColor;
  Color? notActiveColor;
  Color? notActiveTextColor;
  bool isNotificationIconShow;

  @override
  Widget build(BuildContext context) {
    print(
        'isNotificationIconShow : ${isNotificationIconShow} ----------------------');
    return Stack(
      children: [
        TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith(
                (states) => isActive
                    ? activeColor ?? ThemeSelector.colors.primary
                    : notActiveColor ?? ThemeSelector.colors.secondaryFaint,
              ),
              shape: WidgetStateProperty.resolveWith(
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
                            : notActiveTextColor ??
                                ThemeSelector.colors.secondary,
                      ),
                ),
              ],
            )),
        if (isNotificationIconShow)
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: ThemeSelector.statics.defaultInputGap,
                height: ThemeSelector.statics.defaultInputGap,
                decoration: BoxDecoration(
                    color: isActive
                        ? notActiveColor ?? ThemeSelector.colors.secondaryFaint
                        : activeColor ?? ThemeSelector.colors.primary,
                    borderRadius: BorderRadius.circular(
                        ThemeSelector.statics.defaultInputGap)),
              ))
      ],
    );
  }
}
