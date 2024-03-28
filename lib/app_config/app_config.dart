import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/app_config/chef/chef_app_config.dart';
import 'package:yumi/generated/l10n.dart';
import 'package:yumi/theme/theme.dart';
import 'package:nested/nested.dart';

abstract class AppConfig {
  AppTargetUser get appTargetUser;

  List<SingleChildWidget> get blocProviders;

  RootStackRouter get appRouter;
}

// typedef AppBuilder = Widget Function(BuildContext context, AppConfig config);

class YumiApp extends StatelessWidget {
  const YumiApp({super.key, required this.config, required this.builder});

  final AppConfig config;
  final TransitionBuilder builder;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: config.blocProviders,
        child: _materialApp(config.appRouter, builder),
      );
}

MaterialApp _materialApp(
  RootStackRouter appRouter,
  TransitionBuilder? builder,
) {
  return MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: appRouter.config(),
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
    title: 'YUMI',
    theme: defaultTheme,
    builder: builder,
  );
}
