import 'package:yumi/app/core/signal_r/new_order.dart';
import 'package:yumi/app/core/signal_r/notification_signalr.dart';

class GlobalSignalR {
  static initial() {
    NewOrderReceivedSignalR.listen();
    NotificationSignalR.listen();
  }
}
