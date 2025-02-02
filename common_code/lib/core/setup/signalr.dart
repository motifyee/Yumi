import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:logging/logging.dart';
import 'package:signalr_netcore/json_hub_protocol.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'package:common_code/common_code.dart';

enum Signal {
  sendmessage,
  receivemessage,
  updatechefstatus,
  updatedriverstatus,
  cusotmertransaction,
  neworderreceived,
  chefaccept,
  driveraccept,
  chefstart,
  cheffinished,
  driverreceived,
  clientreceived,
  clientcancel,
  clientwait,
  chefcancel,
  notification,
  start,
  stop,
}

// notification_signalr.dart

class Signalr {
  static HubConnection? hubConnection;
  static String? connectionId;
  static String? accessToken;
  static String baseUrl = originApi;
  static String? hubName = "yumiHub";
  static String? connectionToken;

  static void _setupSignalrConnection([bool force = false]) {
    if (!force && hubConnection != null) return;
    if (accessToken?.isEmpty ?? true) return;

    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
    });

    final transportLogger = Logger("SignalR transport");
    final hubLogger = Logger("SignalR hub");

    final httpOptions = HttpConnectionOptions(
      logger: transportLogger,
      logMessageContent: true,
      transport: HttpTransportType.WebSockets,
      requestTimeout: 30000,
      accessTokenFactory: () => Future.value(accessToken!),
    );

    hubConnection = HubConnectionBuilder()
        .withUrl("$baseUrl/$hubName", options: httpOptions)
        .configureLogging(hubLogger)
        .withAutomaticReconnect(retryDelays: List<int>.filled(120, 1000))
        .withHubProtocol(JsonHubProtocol())
        .build();

    hubConnection!.onclose(_onclose);
    hubConnection!.onreconnecting(_onreconnecting);
    hubConnection!.onreconnected(_onreconnected);
  }

  static void ensureInitialized() {
    if (hubConnection == null) _setupSignalrConnection();
  }

  static Future<void> ensureConnected() {
    ensureInitialized();

    if (hubConnection!.state != HubConnectionState.Connected) {
      return startConnection();
    }

    return Future.value();
  }

  static Future<void> startConnection() async {
    ensureInitialized();

    if (hubConnection?.state == HubConnectionState.Connected) return;
    if (hubConnection?.state == HubConnectionState.Connecting) return;

    await hubConnection?.start()?.then(_onstarted).catchError(_onstarterror);
  }

  static void stopConnection() async {
    if (hubConnection == null ||
        hubConnection!.state != HubConnectionState.Connected) return;

    // await hubConnection!.invoke("Stop");
    await hubConnection!.stop();

    hubConnection = null;
    connectionId = null;
    accessToken = null;
    connectionToken = null;
  }

  static void on<T extends Enum>(
    T methodName,
    void Function(List<dynamic>?) callback,
  ) {
    ensureInitialized();

    hubConnection?.on(methodName.name, callback);
  }

  static void off<T extends Enum>(
    T methodName, {
    void Function(List<Object?>?)? method,
  }) {
    ensureInitialized();

    hubConnection?.off(methodName.name, method: method);
  }

  static Future<Either<Failure, Object?>> invoke<T extends Enum>(
    T methodName, {
    List<Object>? args,
  }) async {
    return TaskEither.tryCatch(
      () async {
        await ensureConnected();

        return hubConnection!.invoke(methodName.name, args: args);
      },
      (error, _) => SignalrFailure(error.toString()),
    ).run();
  }

  static final List<void Function(String?)> onreconnectedCallbacks = [];
  static onreconnected(void Function(String?) callback) {
    onreconnectedCallbacks.add(callback);
  }

  static bool offreconnected(void Function(String?) callback) {
    return onreconnectedCallbacks.remove(callback);
  }
}

void _onclose({Exception? error}) {
  debugPrint("SignalR closed ");
  debugPrint(error.toString());
  Timer(const Duration(seconds: 1), Signalr.startConnection);
}

void _onreconnecting({Exception? error}) {
  debugPrint("SignalR re-connecting");
}

void _onreconnected({String? connectionId}) {
  debugPrint("SignalR re-connected");

  for (var fn in Signalr.onreconnectedCallbacks) {
    fn(connectionId);
  }
}

void _onstarted(_) {
  debugPrint("SignalR Connection Started");
}

void _onstarterror(dynamic error) {
  // debugPrint("SignalR Connection Init Error: $error");
  debugPrint(error.toString());
  Timer(const Duration(seconds: 1), () => Signalr.startConnection());
}

Future<void> sendMessage(String message) async {
  await Signalr.invoke(Signal.sendmessage, args: [message]);
}
