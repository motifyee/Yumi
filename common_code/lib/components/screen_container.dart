import 'package:common_code/resources/common_colors.dart';
import 'package:flutter/material.dart';

var screenGradient = LinearGradient(
  colors: [
    CommonColors.primaryTant,
    CommonColors.onPrimary,
  ],
  begin: const FractionalOffset(0.0, 0.0),
  end: const FractionalOffset(0.0, 1.0),
  stops: const [0.0, 0.3],
  tileMode: TileMode.clamp,
);

class ScreenContainer extends StatelessWidget {
  const ScreenContainer(
      {super.key, required this.child, this.isColored = true});

  final bool isColored;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    BoxDecoration? decoration;
    if (isColored) {
      decoration = BoxDecoration(
        gradient: screenGradient,
      );
    }

    return Container(
      decoration: decoration,
      child: child,
    );
  }
}
