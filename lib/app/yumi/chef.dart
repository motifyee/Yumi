import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/core/setup/init.dart';
import 'package:yumi/app/yumi/config/chef/chef_app_config.dart';
import 'package:yumi/app_target.dart';

void main() async {
  await init();

  AppTarget.user = YumiApp.chefs;

  runApp(
    BlocProvider(
      create: (context) => AppCubit(ChefAppConfig()),
      child: const YumiChefApp(),
    ),
  );
}

class YumiChefApp extends StatelessWidget {
  const YumiChefApp({super.key});

  @override
  Widget build(BuildContext context) => const App();
}
