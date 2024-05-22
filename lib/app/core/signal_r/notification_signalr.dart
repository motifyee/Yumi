import 'package:yumi/app/core/setup/signalr.dart';

class NotificationSignalR {
  static listen() {
    Signalr.on(Signals.notification, (p0) {
      print('notification -------------------------------');
      print(p0);
    });
  }
}
