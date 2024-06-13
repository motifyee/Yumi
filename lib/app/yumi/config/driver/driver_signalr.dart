import 'package:yumi/app/yumi/config/driver/signal_r/driver_status_signalr.dart';

class DriverSignalR {
  static initial() {
    DriverStatusSignalR.listen();
  }
}
