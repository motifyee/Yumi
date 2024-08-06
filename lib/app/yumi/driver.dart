import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:yumi/core/setup/init.dart';
import 'package:yumi/app/yumi/config/driver/dirver_app_config.dart';
import 'package:yumi/app_target.dart';

Future<void> main() async {
  await init();

  AppTarget.user = YumiApp.drivers;

  runApp(
    BlocProvider(
      create: (context) => AppCubit(DriverAppConfig()),
      child: const YumiDriverApp(),
    ),
  );
}

class YumiDriverApp extends StatelessWidget {
  const YumiDriverApp({super.key});

  @override
  Widget build(BuildContext context) => const App();
}
