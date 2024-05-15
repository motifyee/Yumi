import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app_config/yumi_app.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/template/snack_bar.dart';

class G {
  // static const String API_KEY = "";
  // static const String BASE_URL = "";

  // static final GlobalKey<NavigatorState> navigatorKey =
  //     GlobalKey<NavigatorState>();
  // static get navigator => navigatorKey.currentState;
  // static get currentContext => navigatorKey.currentContext;
  // static ScaffoldState get scaffold => Scaffold.of(currentContext);
  static YumiApp get yumiApp => YumiApp.of(cContext);
  static bool get isChefApp =>
      yumiApp.config.appTargetUser == AppTargetUser.chefs;
  static bool get isDriverApp =>
      yumiApp.config.appTargetUser == AppTargetUser.drivers;
  static bool get isCustomerApp =>
      yumiApp.config.appTargetUser == AppTargetUser.customers;

  static String get appName => yumiApp.config.appTargetUser.name;

  static final GlobalKey builderKey = GlobalKey();
  static BuildContext get cContext => builderKey.currentContext!;
  static ScaffoldState get scaffold => Scaffold.of(cContext);

  static StackRouter get router => yumiApp.config.appRouter;
  static BuildContext get context => router.navigatorKey.currentContext!;

  static void pop({bool rootNavigator = true}) {
    Navigator.of(context, rootNavigator: rootNavigator).pop();
  }

  static void snackBar(String message) {
    ScaffoldMessenger.of(G.context).showSnackBar(SnackBar(
      content: SnackBarMassage(massage: message),
    ));
  }

  static T read<T extends Bloc>() {
    return cContext.read<T>();
  }

  static T rd<T extends Cubit>() {
    return cContext.read<T>();
  }
  // static void add<T extends Bloc<E, S>, E,S>(E event) {
  //   cContext.read<T>().add(event);
  // }

  int call() {
    return 0;
  }
}
