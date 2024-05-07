import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:signalr_netcore/json_hub_protocol.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:logging/logging.dart';

enum Signals {
  sendmessage,
  receivemessage,
  start,
  stop,
}

// notification_signalr.dart

class Signalr {
  static HubConnection? hubConnection;
  static String? connectionId;
  static String? accessToken;
  static String? hubName;
  static String? connectionToken;

  static void _setupSignalrConnection([bool force = false]) {
    if (!force && hubConnection != null) return;

    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((LogRecord rec) {
      debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
    });

    final transportLogger = Logger("SignalR transport");
    final hubLogger = Logger("SignalR hub");

    const serverUrl = "$originApi/signalr";
    final httpOptions = HttpConnectionOptions(
      httpClient: WebSupportingHttpClient(
        hubLogger,
        httpClientCreateCallback: (httpClient) =>
            HttpOverrides.global = HttpOverrideCertificateVerificationInDev(),
      ),
      logger: transportLogger,
      logMessageContent: true,
      transport: HttpTransportType.WebSockets,
      // accessTokenFactory: () async => await accessToken(),
    );

    hubConnection = HubConnectionBuilder()
        .withUrl(serverUrl, options: httpOptions)
        .configureLogging(hubLogger)
        .withAutomaticReconnect(
            retryDelays: [1000, 2000, 4000, 8000, 15000, 30000])
        .withHubProtocol(JsonHubProtocol())
        .build();

    hubConnection!.onclose(onclose);
    hubConnection!.onreconnecting(onreconnecting);
    hubConnection!.onreconnected(onreconnected);

    hubConnection!.on(
      "ReceiveMessage",
      (messages) => debugPrint("Messages: $messages"),
    );
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

    if (hubConnection!.state == HubConnectionState.Connected) return;

    await hubConnection!.start()?.then(onstarted).catchError(onstarterror);
  }

  static void stopConnection() async {
    if (hubConnection == null) return;

    await hubConnection!.invoke("Stop");
    await hubConnection!.stop();

    hubConnection = null;
    connectionId = null;
    accessToken = null;
    connectionToken = null;
  }

  static void on<T extends Enum>(
    T methodName,
    Function(dynamic) callback,
  ) {
    ensureInitialized();

    hubConnection!.on(methodName.name, callback);
  }

  static void off<T extends Enum>(
    T methodName, {
    void Function(List<Object?>?)? method,
  }) {
    ensureInitialized();

    hubConnection!.off(methodName.name, method: method);
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
      (error, stackTrace) => SignalrFailure(error, stackTrace),
    ).run();
  }
}

class HttpOverrideCertificateVerificationInDev extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void onclose({Exception? error}) {
  debugPrint("SignalR closed");
}

void onreconnecting({Exception? error}) {
  debugPrint("SignalR re-connecting");
}

void onreconnected({String? connectionId}) {
  debugPrint("SignalR re-connected");
}

void onstarted(_) {
  debugPrint("SignalR Connection Started");
}

void onstarterror(dynamic error) {
  debugPrint("SignalR Connection Init Error: $error");
}

Future<void> sendMessage(String message) async {
  await Signalr.invoke(Signals.sendmessage, args: [message]);
}