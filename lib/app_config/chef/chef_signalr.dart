import 'package:yumi/app_config/chef/signal_r/chef_status_signalr.dart';

class ChefSignalR {
  static initial() {
    ChefStatusSignalR.listen();
  }
}
