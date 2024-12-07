import 'package:yumi/app/yumi/config/chef/signal_r/chef_status_signalr.dart';

class ChefSignalR {
  static initial() {
    ChefStatusSignalR.listen();
  }
}
