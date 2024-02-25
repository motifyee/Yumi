import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:yumi/statics/theme_statics.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: ThemeSelector.statics.defaultGapExtraExtreme,
        height: ThemeSelector.statics.defaultGapExtraExtreme,
        child: const LoadingIndicator(
          indicatorType: Indicator.pacman,
        ),
      ),
    );
  }
}
