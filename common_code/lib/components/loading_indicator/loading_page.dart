import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:common_code/components/loading_indicator/loading.dart';

@RoutePage()
class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Loading();
  }
}
