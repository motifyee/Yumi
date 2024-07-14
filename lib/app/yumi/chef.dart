import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:yumi/core/setup/init.dart';
import 'package:yumi/app/yumi/config/chef/chef_app_config.dart';
import 'package:yumi/app_target.dart';

void main() async {
  await init();

  AppTarget.user = YumiApp.chefs;

  runApp(ChefApp(config: ChefAppConfig()));
}

class ChefApp extends StatelessWidget {
  final AppConfig config;

  const ChefApp({super.key, required this.config});

  @override
  Widget build(BuildContext context) => App(config: config);
}
