import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yumi/app/components/toast/toast.dart';
import 'package:yumi/core/setup/connection.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/setup/internet_connectivity_checker.dart';
import 'package:yumi/app/yumi/config/yumi_app.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/app/components/snack_bar.dart';

class G {
  // static const String API_KEY = "";
  // static const String BASE_URL = "";

  // static final GlobalKey<NavigatorState> navigatorKey =
  //     GlobalKey<NavigatorState>();
  // static get navigator => navigatorKey.currentState;
  // static get currentContext => navigatorKey.currentContext;
  // static ScaffoldState get scaffold => Scaffold.of(currentContext);
  static YumiApp get yumiApp => YumiApp.of(cContext);
  static AppTargetUser get appTarget => yumiApp.config.appTargetUser;
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
        if (!isOnline) showConnectivitySnackBar(true);
        isOnline = true;

        listenInternetChecker();
      },
      onDisconnected: () {
        if (isOnline) showConnectivitySnackBar(false);
        isOnline = false;
      },
    );
  }

  static void listenInternetChecker() {
    getIt<InternetChecker>().listen(
      onConnected: () {
        if (!isOnline) showConnectivitySnackBar(true);
        isOnline = true;
        getIt<InternetChecker>().dispose();
      },
      onDisconnected: () {
        if (isOnline) showConnectivitySnackBar(false);
        isOnline = false;
      },
    );
  }

  static void disposeConnectivityListeners() {
    sl<Connection>().dispose();
    sl<InternetChecker>().dispose();
  }

  static bool isOnline = true;
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
  // Toast

  static final _fToast = FToast();
  static bool _toastInit = false;
  static void initToast(BuildContext context) {
    if (_toastInit) return;
    _fToast.init(context);
    _toastInit = true;
  }

  static void showToast(
    String msg, {
    BuildContext? context,
    Widget Function(String msg) toastBuilder = buildToast,
    bool isDismissable = false,
    bool ignorePointer = false,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Duration toastDuration = const Duration(seconds: 2),
    Duration fadeDuration = const Duration(milliseconds: 350),
    Widget Function(BuildContext context, Widget? child)?
        positionedToastBuilder,
  }) {
    initToast(context ?? cContext);

    _fToast.showToast(
      child: toastBuilder(msg),
      isDismissable: isDismissable,
      ignorePointer: ignorePointer,
      gravity: gravity,
      toastDuration: toastDuration,
      fadeDuration: fadeDuration,
      positionedToastBuilder: positionedToastBuilder,
    );
  }

  // ###########################################################################

  // Cubit Locator

  static final Map<Type, BuildContext> _registeredCubits = {};

  /// Cleans unmounted contexts and closed cubits on every new cubit
  /// registeration or cubit read.
  static _cleanCubits() {
    _registeredCubits.keys.toList().forEach((Type type) {
      final context = _registeredCubits[type];

      if (context == null) {
        _registeredCubits.remove(type);
        return;
      }
      if (!context.mounted) _registeredCubits.remove(type);

      // if (readCubit<type>()?.isClosed ?? true) _registeredCubits.remove(type);
    });
  }

  /// saves the context that reads the current cubit
  static void registerCubit<T extends Cubit>(BuildContext context) {
    _registeredCubits[T] = context;
    _cleanCubits();
  }

  /// Reads the current cubit using the stored context.
  ///
  /// Allows to access provided cubits from a parallel part of the tree.
  ///
  /// Needs caution as it's null if read before the cubit is mounted.
  static T? readCubit<T extends Cubit>() {
    _cleanCubits();

    final context = _registeredCubits[T];
    if (context == null || !context.mounted) return null;

    return context.read<T>();
  }

  static T? watchCubit<T extends Cubit>() {
    _cleanCubits();

    final context = _registeredCubits[T];
    if (context == null || !context.mounted) return null;

    return context.watch<T>();
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
