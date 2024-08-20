import 'dart:async';

import 'package:common_code/common_code.dart';
import 'package:common_code/core/setup/signalr.dart';
import 'package:common_code/util/global_context.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';
import 'package:signalr_netcore/signalr_client.dart';

class App extends StatelessWidget {
  const App({super.key});

  static App of(BuildContext context) {
    App? app = context.findAncestorWidgetOfExactType<App>();

    assert(app != null);

    return app!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final AppConfig config = state.config;

        return MultiBlocProvider(
          providers: config.blocProviders,
          child: MaterialApp.router(
            builder: _builder,
            theme: config.theme,
            title: config.appTitle,
            debugShowCheckedModeBanner: false,
            //
            routerConfig: config.appRouter.config(),
            //
            locale: config.locale,
            supportedLocales: config.supportedLocales,
            localizationsDelegates: config.localizationsDelegates,
          ),
        );
      },
    );
  }

  Widget _builder(BuildContext context, Widget? child) {
    return Builder(
      key: GlobalContext().appBuilderKey,
      builder: (context) {
        return SafeArea(
          child: Container(
            color: CommonColors.background,
            child: child ?? const SizedBox(),
          ),
        );
      },
    );
  }
}

abstract class AppConfig {
  String get appTitle;

  RootStackRouter get appRouter;

  ThemeData? get theme;

  List<SingleChildWidget> get blocProviders;

  Locale get locale;

  Iterable<Locale> get supportedLocales;

  Iterable<LocalizationsDelegate<dynamic>>? get localizationsDelegates;
}
