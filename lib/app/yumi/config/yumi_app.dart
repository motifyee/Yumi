import 'package:auto_route/auto_route.dart';
import 'package:common_code/resources/_resouces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:yumi/app/yumi/config/app.dart';

// import 'package:yumi/generated/l10n.dart';
import 'package:yumi/global.dart';
// import 'package:yumi/theme/theme.dart';

extension BuildContextX on BuildContext {
  YumiAppX get yumiApp => YumiAppX.of(this);
  AppConfig get yumiAppConfig => yumiApp.config;
}

class YumiAppX extends StatelessWidget {
  final AppConfig config;

  const YumiAppX({
    super.key,
    required this.config,
  });

  static YumiAppX of(BuildContext context) {
    YumiAppX? app = context.findAncestorWidgetOfExactType<YumiAppX>();

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

  Widget _builder(context, child) {
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

// MaterialApp _materialApp(
//   RootStackRouter appRouter,
//   TransitionBuilder? builder,
// ) {
//   return MaterialApp.router(
//     debugShowCheckedModeBanner: false,
//     routerConfig: appRouter.config(),
//     localizationsDelegates: const [
//       S.delegate,
//       GlobalMaterialLocalizations.delegate,
//       GlobalWidgetsLocalizations.delegate,
//       GlobalCupertinoLocalizations.delegate,
//     ],
//     supportedLocales: S.delegate.supportedLocales,
//     title: 'YUMI',
//     theme: defaultTheme,
//     // builder: builder,
//     builder: _builder,
//   );
// }