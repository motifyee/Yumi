import 'package:common_code/common_code.dart';
import 'package:common_code/components/toast/toast.dart';
import 'package:common_code/core/setup/connection.dart';
import 'package:common_code/core/setup/internet_connectivity_checker.dart';
import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

class GlobalContext {
  factory GlobalContext() => _inner;
  static final GlobalContext _inner = GlobalContext._init();
  GlobalContext._init();

  final GlobalKey appBuilderKey = GlobalKey();
  BuildContext get _appBuilderContext => appBuilderKey.currentContext!;
  BuildContext get bContext => _appBuilderContext;

  App get app => App.of(bContext);
  AppConfig get appConfig => rd<AppCubit>().state.config;

  final GlobalKey scaffoldKey = GlobalKey();
  BuildContext? get scContext => scaffoldKey.currentContext;
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

  StackRouter get router => appConfig.appRouter;
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

  // ###########################################################################
  // Contectivity

  // ###########################################################################
  // Connectivity

  Future<bool> checkConnectivity() async {
    if (await sl<Connection>().isDisconnected) return false;
    if (await sl<InternetChecker>().isDisconnected) return false;

    return true;
  }

  void listenConnectivity() {
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

  void listenInternetChecker() {
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
  void showConnectivitySnackBar(bool isConnected) {
    hideSnackbar();

    ScaffoldMessenger.of(scContext!).showSnackBar(SnackBar(
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
}
