import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';

class ScreenContainer extends StatelessWidget {
  const ScreenContainer(
      {super.key, required this.child, this.isColored = true});

  final isColored;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isColored
          ? BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ThemeSelector.colors.primaryTant,
                  ThemeSelector.colors.onPrimary,
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 1.0),
                stops: const [0.0, 0.3],
                tileMode: TileMode.clamp,
              ),
            )
          : null,
      child: child,
    );
  }
}
