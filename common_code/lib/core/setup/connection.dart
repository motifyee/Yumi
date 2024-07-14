import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class Connection {
  Connection();

  Future<List<ConnectivityResult>> get connectivityResult =>
      Connectivity().checkConnectivity();

  Future<bool> get isConnected => Connectivity().checkConnectivity().then(
        (result) =>
            result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.ethernet) ||
            result.contains(ConnectivityResult.vpn) ||
            result.contains(ConnectivityResult.bluetooth) ||
            result.contains(ConnectivityResult.other),
      );

  Future<bool> get isDisconnected => Connectivity().checkConnectivity().then(
        (result) => result.contains(ConnectivityResult.none),
      );

  Future<bool> get isMobile => Connectivity().checkConnectivity().then(
        (result) => result.contains(ConnectivityResult.mobile),
      );
  Future<bool> get isWifi => Connectivity().checkConnectivity().then(
        (result) => result.contains(ConnectivityResult.wifi),
      );
  Future<bool> get isEthernet => Connectivity().checkConnectivity().then(
        (result) => result.contains(ConnectivityResult.ethernet),
      );
  Future<bool> get isVpn => Connectivity().checkConnectivity().then(
        (result) => result.contains(ConnectivityResult.vpn),
      );
  Future<bool> get isBluetooth => Connectivity().checkConnectivity().then(
        (result) => result.contains(ConnectivityResult.bluetooth),
      );
  Future<bool> get isOther => Connectivity().checkConnectivity().then(
        (result) => result.contains(ConnectivityResult.other),
      );

  StreamSubscription<List<ConnectivityResult>>? _subscription;
  void listen({
    Function()? onConnected,
    Function()? onDisconnected,
    Function()? onMobile,
    Function()? onWifi,
    Function()? onEtherent,
    Function()? onVpn,
    Function()? onBluetooth,
    Function()? onOther,
  }) {
    _subscription?.cancel();

    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (result.contains(ConnectivityResult.mobile)) {
        if (onMobile != null) onMobile();
        if (onConnected != null) onConnected();
      } else if (result.contains(ConnectivityResult.wifi)) {
        if (onWifi != null) onWifi();
        if (onConnected != null) onConnected();
      } else if (result.contains(ConnectivityResult.ethernet)) {
        if (onEtherent != null) onEtherent();
        if (onConnected != null) onConnected();
      } else if (result.contains(ConnectivityResult.vpn)) {
        if (onVpn != null) onVpn();
        if (onConnected != null) onConnected();
      } else if (result.contains(ConnectivityResult.bluetooth)) {
        if (onBluetooth != null) onBluetooth();
        if (onConnected != null) onConnected();
      } else if (result.contains(ConnectivityResult.other)) {
        if (onOther != null) onOther();
        if (onConnected != null) onConnected();
      } else if (result.contains(ConnectivityResult.none)) {
        if (onDisconnected != null) onDisconnected();
      }
    });
  }

  void dispose() {
    _subscription?.cancel();
  }
}
