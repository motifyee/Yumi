import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yumi/app/yumi/config/app_config.dart';

import 'package:yumi/generated/l10n.dart';
import 'package:yumi/theme/theme.dart';

extension BuildContextX on BuildContext {
  YumiApp get yumiApp => YumiApp.of(this);
  AppConfig get yumiAppConfig => yumiApp.config;
}

class YumiApp extends StatelessWidget {
  const YumiApp({
    super.key,
    required this.config,
    required this.builder,
  });
  // : _key

  final AppConfig config;
  final TransitionBuilder builder;

  static YumiApp of(BuildContext context) {
    YumiApp? app = context.findAncestorWidgetOfExactType<YumiApp>();

    assert(app != null);

    return app!;
  }

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
