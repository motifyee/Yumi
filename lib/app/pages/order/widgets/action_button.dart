import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';

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
    return Stack(
      children: [
        TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith(
                (states) => isActive
                    ? activeColor ?? CommonColors.primary
                    : notActiveColor ?? CommonColors.secondaryFaint,
              ),
              shape: WidgetStateProperty.resolveWith(
                (states) => const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(CommonDimens.defaultBorderRadius),
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
                            ? activeTextColor ?? CommonColors.onPrimary
                            : notActiveTextColor ?? CommonColors.secondary,
                      ),
                ),
              ],
            )),
        if (isNotificationIconShow)
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: CommonDimens.defaultInputGap,
                height: CommonDimens.defaultInputGap,
                decoration: BoxDecoration(
                    color: isActive
                        ? notActiveColor ?? CommonColors.secondaryFaint
                        : activeColor ?? CommonColors.primary,
                    borderRadius:
                        BorderRadius.circular(CommonDimens.defaultInputGap)),
              ))
      ],
    );
  }
}
