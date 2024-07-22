import 'package:auto_route/auto_route.dart';
import 'package:common_code/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';

@RoutePage()
class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: PacmanLoadingWidget(),
      ),
    );
  }
}
