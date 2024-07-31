import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/core/setup/signalr.dart';
import 'package:common_code/util/global_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:signalr_netcore/signalr_client.dart';

class App extends StatelessWidget {
  final AppConfig config;

  const App({
    super.key,
    required this.config,
  });

  static App of(BuildContext context) {
    App? app = context.findAncestorWidgetOfExactType<App>();

    assert(app != null);

    return app!;
  }

  @override
  Widget build(BuildContext context) {
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
  }

  Widget _builder(BuildContext context, Widget? child) {
    return Builder(
      key: GlobalContext().appBuilderKey,
      builder: (context) {
        return SafeArea(
          child: Container(
            color: CommonColors.background,
            child: Stack(children: [
              child ?? const SizedBox(),
              const Positioned(
                top: -10,
                right: -10,
                child: SignalRStatus(),
              ),
            ]),
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

class SignalRStatus extends StatefulWidget {
  const SignalRStatus({super.key});

  @override
  State<SignalRStatus> createState() => _SignalRStatusState();
}

class _SignalRStatusState extends State<SignalRStatus> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (e) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    Color color = CommonColors.secondary;

    switch (Signalr.hubConnection?.state) {
      case HubConnectionState.Connected:
        color = CommonColors.success;
        break;
      case HubConnectionState.Reconnecting:
        color = CommonColors.primary;
        break;

      default:
        break;
    }
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    );
  }
}
