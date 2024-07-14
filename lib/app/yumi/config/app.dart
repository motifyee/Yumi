import 'package:common_code/common_code.dart';
import 'package:common_code/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/global.dart';

class App extends StatelessWidget {
  final AppConfig config;

  const App({
    super.key,
    required this.config,
  });
  // final TransitionBuilder builder;

  static App of(BuildContext context) {
    App? app = context.findAncestorWidgetOfExactType<App>();

    assert(app != null);

    return app!;
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: config.blocProviders,
        child: MaterialApp.router(
          builder: _builder,
          theme: config.theme,
          title: config.appTitle,
          debugShowCheckedModeBanner: false,
          //
          routerConfig: config.routerConfig,
          //
          supportedLocales: config.supportedLocales,
          localizationsDelegates: config.localizationsDelegates,
        ),
      );

  Widget _builder(BuildContext context, Widget? child) {
    return Builder(
      key: G().appBuilderKey,
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
  YumiApp get appTargetUser;

  String get appTitle;

  RouterConfig<Object> get routerConfig;

  ThemeData? get theme => defaultTheme;

  List<SingleChildWidget> get blocProviders;

  Iterable<Locale> get supportedLocales;

  Iterable<LocalizationsDelegate<dynamic>>? get localizationsDelegates;
}
