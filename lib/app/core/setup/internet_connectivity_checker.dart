import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetChecker {
  InternetChecker();

  final InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 2),
    checkInterval: const Duration(seconds: 2),
    // addresses: [],
  );

  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
  Future<bool> get isDisconnected =>
      internetConnectionChecker.hasConnection.then(
        (value) => !value,
      );

  StreamSubscription<InternetConnectionStatus>? _listener;
  void listen({Function()? onConnected, Function()? onDisconnected}) {
    _listener?.cancel();

    _listener = internetConnectionChecker.onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          if (onConnected != null) onConnected();
        case InternetConnectionStatus.disconnected:
          if (onDisconnected != null) onDisconnected();
      }
    });
  }

  void dispose() {
    _listener?.cancel();
  }
}
