import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/components/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalContext {
  factory GlobalContext() => _inner;
  static final GlobalContext _inner = GlobalContext._init();
  GlobalContext._init();

  final GlobalKey appBuilderKey = GlobalKey();
  BuildContext get _appBuilderContext => appBuilderKey.currentContext!;
  BuildContext get bContext => _appBuilderContext;

  App get app => App.of(bContext);

  // ###########################################################################
  // Router

  // void setGoRouter(GoRouter Function(GlobalKey<NavigatorState> key) getGoRouter) => _router = getGoRouter(routerKey);
  // GoRouter? _router;
  // GoRouter get router => _router!;
  // static BuildContext get context => router.navigatorKey.currentContext!;
  // Future<void> removeUntil(
  //   String untilRouteName,
  // ) async {
  //   while (router.canPop() &&
  //       ModalRoute.of(context)?.settings.name != untilRouteName) {
  //     router.pop();
  //   }
  // }
  // Future<void> pushAndRemoveUntil(
  //   String pushRouteName,
  //   String untilRouteName,
  // ) async {
  //   removeUntil(untilRouteName);
  //   await router.push(pushRouteName);
  // }
  // Future<void> replaceAll(String routeName) async {
  //   while (router.canPop()) {
  //     router.pop();
  //   }
  //   await router.push(routeName);
  // }
  // final GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>();

  StackRouter get router => app.config.appRouter;
  BuildContext get context => router.navigatorKey.currentContext!;

  void pop({bool rootNavigator = true}) {
    Navigator.of(context, rootNavigator: rootNavigator).pop();
  }

  // ###########################################################################

  ScaffoldMessengerState get scaffold => ScaffoldMessenger.of(bContext);

  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  // ###########################################################################
  // Snackbar

  void snackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: SnackBarMassage(massage: message),
    ));
  }

  void hideSnackbar() {
    scaffold.hideCurrentSnackBar();
  }

  void clearSnackbars() {
    scaffold.clearSnackBars();
  }

  // ###########################################################################
  // Toast

  final _fToast = FToast();
  bool _toastInit = false;
  void _initToast(BuildContext context) {
    if (_toastInit) return;
    _fToast.init(context);
    _toastInit = true;
  }

  void showToast(
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
    _initToast(context ?? bContext);

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

  final Map<Type, BuildContext> _registeredCubits = {};

  /// Cleans unmounted contexts and closed cubits on every new cubit
  /// registeration or cubit read.
  _cleanCubits() {
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
  void registerCubit<T extends Cubit>(BuildContext context) {
    _registeredCubits[T] = context;
    _cleanCubits();
  }

  /// Reads the current cubit using the stored context.
  ///
  /// Allows to access provided cubits from a parallel part of the tree.
  ///
  /// Needs caution as it's null if read before the cubit is mounted.
  T? readCubit<T extends Cubit>() {
    _cleanCubits();

    final context = _registeredCubits[T];
    if (context == null || !context.mounted) return null;

    return context.read<T>();
  }

  T? watchCubit<T extends Cubit>() {
    _cleanCubits();

    final context = _registeredCubits[T];
    if (context == null || !context.mounted) return null;

    return context.watch<T>();
  }

  // ###########################################################################
  // Bloc
  T read<T extends Bloc>() {
    return bContext.read<T>();
  }

  T rd<T extends Cubit>() {
    return bContext.read<T>();
  }
  // static void add<T extends Bloc<E, S>, E,S>(E event) {
}
