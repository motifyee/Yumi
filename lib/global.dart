import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yumi/app/core/setup/connection.dart';
import 'package:yumi/app/core/setup/inject.dart';
import 'package:yumi/app/core/setup/internet_connectivity_checker.dart';
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
  static ScaffoldMessengerState get scaffold => ScaffoldMessenger.of(cContext);

  static StackRouter get router => yumiApp.config.appRouter;
  static BuildContext get context => router.navigatorKey.currentContext!;

  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static void pop({bool rootNavigator = true}) {
    Navigator.of(context, rootNavigator: rootNavigator).pop();
  }

  // ###########################################################################
  // Connectivity

  static Future<bool> checkConnectivity() async {
    if (await sl<Connection>().isDisconnected) return false;
    if (await sl<InternetChecker>().isDisconnected) return false;

    return true;
  }

  static void listenConnectivity() {
    getIt<Connection>().listen(
      onConnected: () {
        if (!_isConnected) showConnectivitySnackBar(true);
        _isConnected = true;

        listenInternetChecker();
      },
      onDisconnected: () {
        if (_isConnected) showConnectivitySnackBar(false);
        _isConnected = false;
      },
    );
  }

  static void listenInternetChecker() {
    getIt<InternetChecker>().listen(
      onConnected: () {
        if (!_isConnected) showConnectivitySnackBar(true);
        _isConnected = true;
        getIt<InternetChecker>().dispose();
      },
      onDisconnected: () {
        if (_isConnected) showConnectivitySnackBar(false);
        _isConnected = false;
      },
    );
  }

  static void disposeConnectivityListeners() {
    sl<Connection>().dispose();
    sl<InternetChecker>().dispose();
  }

  static bool _isConnected = true;
  static void showConnectivitySnackBar(bool isConnected) {
    hideSnackbar();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      duration:
          isConnected ? const Duration(seconds: 2) : const Duration(days: 1),
      backgroundColor: isConnected ? Colors.green : Colors.red,
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.all(3),
      dismissDirection: DismissDirection.down,
      content: Center(
        child: Text(isConnected ? 'Connected' : 'No internet access!'),
      ),
    ));
  }
  // ###########################################################################
  // Snackbar

  static void snackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SnackBarMassage(massage: message),
    ));
  }

  static void hideSnackbar() {
    scaffold.hideCurrentSnackBar();
  }

  static void clearSnackbars() {
    scaffold.clearSnackBars();
  }

  // ###########################################################################
  // Bloc
  static T read<T extends Bloc>() {
    return cContext.read<T>();
  }

  static T rd<T extends Cubit>() {
    return cContext.read<T>();
  }
  // static void add<T extends Bloc<E, S>, E,S>(E event) {
  //   cContext.read<T>().add(event);
  // }
}
