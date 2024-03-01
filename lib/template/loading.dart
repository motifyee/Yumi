import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:yumi/statics/theme_statics.dart';

class Loading extends StatelessWidget {
  Loading({super.key, this.size});
  final dataKey = GlobalKey();

  double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        key: dataKey,
        width: size ?? ThemeSelector.statics.defaultGapExtraExtreme,
        height: size ?? ThemeSelector.statics.defaultGapExtraExtreme,
        child: const LoadingIndicator(
          indicatorType: Indicator.pacman,
        ),
      ),
    );
  }
}
