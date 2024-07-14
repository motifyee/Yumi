import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loading extends StatelessWidget {
  const Loading({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    final dataKey = GlobalKey();

    return Center(
      child: SizedBox(
        key: dataKey,
        width: size ?? CommonDimens.defaultGapExtraExtreme,
        height: size ?? CommonDimens.defaultGapExtraExtreme,
        child: const LoadingIndicator(
          indicatorType: Indicator.pacman,
        ),
      ),
    );
  }
}
