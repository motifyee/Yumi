import 'package:yumi/core/setup/signalr.dart';

class CustomerTransactionSignalR {
  static listen() {
    Signalr.on(Signals.cusotmertransaction, (p0) {});
  }
}
