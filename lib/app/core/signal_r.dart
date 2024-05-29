import 'package:yumi/app/core/signal_r/general_listener_signalr.dart';
import 'package:yumi/app/core/signal_r/notification_signalr.dart';

class GlobalSignalR {
  static initial() {
    NotificationSignalR.listen();
    GeneralListenerSignalr.listen();
  }
}
