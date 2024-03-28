import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app_config/yumi_app.dart';

class G {
  // static const String API_KEY = "";
  // static const String BASE_URL = "";

  // static final GlobalKey<NavigatorState> navigatorKey =
  //     GlobalKey<NavigatorState>();
  // static get navigator => navigatorKey.currentState;
  // static get currentContext => navigatorKey.currentContext;
  // static ScaffoldState get scaffold => Scaffold.of(currentContext);

  static String get appName => YumiApp.of(cContext).config.appTargetUser.name;

  static final GlobalKey builderKey = GlobalKey();
  static BuildContext get cContext => builderKey.currentContext!;
  static ScaffoldState get scaffold => Scaffold.of(cContext);

  static void pop() {
    Navigator.of(cContext, rootNavigator: true).pop();
  }

  static T read<T extends Bloc>() {
    return cContext.read<T>();
  }
  // static void add<T extends Bloc<E, S>, E,S>(E event) {
  //   cContext.read<T>().add(event);
  // }

  int call() {
    return 0;
  }
}
