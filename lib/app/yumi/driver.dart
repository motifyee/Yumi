import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:yumi/core/setup/init.dart';
import 'package:yumi/app/yumi/config/driver/dirver_app_config.dart';
import 'package:yumi/app_target.dart';

Future<void> main() async {
  await init();

  AppTarget.user = YumiApp.drivers;

  runApp(YumiDriver(config: DriverAppConfig()));
}

class YumiDriver extends StatelessWidget {
  final AppConfig config;

  const YumiDriver({super.key, required this.config});

  @override
  Widget build(BuildContext context) => App(config: config);
}
