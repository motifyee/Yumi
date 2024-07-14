import 'package:flutter/material.dart';

Widget buildToast(
  String message, {
  Color? bagroundColor = const Color.fromRGBO(22, 22, 22, 0.555),
  Color foregroundColor = Colors.white,
  IconData? icon,
  Widget Function(BuildContext context, String msg)? contentBuilder,
}) =>
    Builder(
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: bagroundColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) Icon(icon),
            if (icon != null)
              const SizedBox(
                width: 12.0,
              ),
            if (contentBuilder != null)
              contentBuilder(context, message)
            else
              Text(message, style: TextStyle(color: foregroundColor))
          ],
        ),
      ),
    );
