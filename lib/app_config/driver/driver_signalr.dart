import 'package:yumi/app_config/driver/signal_r/driver_status_signalr.dart';

class DriverSignalR {
  static initial() {
    DriverStatusSignalR.listen();
  }
}
