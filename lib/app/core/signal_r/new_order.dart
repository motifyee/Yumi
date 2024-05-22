import 'package:yumi/app/core/setup/signalr.dart';

class NewOrderReceivedSignalR {
  static listen() {
    Signalr.on(Signals.neworderreceived, (p0) {
      print('neworderreceived -------------------------------');
      print(p0);
    });
  }
}
