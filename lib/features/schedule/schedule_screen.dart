import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/template/screen_container.dart';

@RoutePage()
class MyScheduleScreen extends StatelessWidget {
  const MyScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0,
          scrolledUnderElevation: 0,
          iconTheme: IconThemeData(color: ThemeSelector.colors.primary),
        ),
        body: const SingleChildScrollView(),
      ),
    );
  }
}
