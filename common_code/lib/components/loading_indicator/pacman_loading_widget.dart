import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class PacmanLoadingWidget extends StatelessWidget {
  const PacmanLoadingWidget({super.key, this.size, this.color});

  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dataKey = GlobalKey();

    return Center(
      child: SizedBox(
        key: dataKey,
        width: size ?? CommonDimens.defaultGapExtraExtreme,
        height: size ?? CommonDimens.defaultGapExtraExtreme,
        child: LoadingIndicator(
          indicatorType: Indicator.pacman,
          colors: color != null ? [color!] : null,
        ),
      ),
    );
  }
}
