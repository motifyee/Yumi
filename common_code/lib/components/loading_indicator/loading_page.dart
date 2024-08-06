import 'package:flutter/material.dart';
import 'package:common_code/components/loading_indicator/pacman_loading_widget.dart';
import 'package:dependencies/dependencies.dart';

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
