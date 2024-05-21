import 'package:yumi/app/core/setup/signalr.dart';

class CustomerTransactionSignalR {
  static listen() {
    Signalr.on(Signals.cusotmertransaction, (p0) {
      print('signalR cusotmertransaction .....................');
      print(p0);
    });
  }
}
