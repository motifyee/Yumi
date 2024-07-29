import 'package:common_code/core/setup/signalr.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/app/yumi/config/chef/chef_signalr.dart';
import 'package:yumi/app/yumi/config/customer/customer_signalr.dart';
import 'package:yumi/app/yumi/config/driver/driver_signalr.dart';
import 'package:yumi/core/signal_r/after_reconnect_signalr.dart';
import 'package:yumi/core/signal_r/general_listener_signalr.dart';
import 'package:yumi/core/signal_r/notification_signalr.dart';
import 'package:yumi/global.dart';

class GlobalSignalR {
  static initial() {
    NotificationSignalR.listen();
    GeneralListenerSignalr.listen();
  }
}

void initializeSignalr() {
  print('initializeSignalr ...........');
  final userCubit = G().rd<UserCubit>();

  Signalr.accessToken = userCubit.state.user.accessToken;
  Signalr.onreconnected(AfterReconnectSignalr.reconnectedCall);

  Signalr.startConnection().then((value) {
    /// initial listen to global messages from signal r
    GlobalSignalR.initial();

    /// initial listen to chef messages from signal r
    if (G().isChefApp) ChefSignalR.initial();

    /// initial listen to customer messages from signal r
    if (G().isCustomerApp) CustomerSignalR.initial();

    /// initial listen to driver messages from signal r
    if (G().isDriverApp) DriverSignalR.initial();
  });
}
