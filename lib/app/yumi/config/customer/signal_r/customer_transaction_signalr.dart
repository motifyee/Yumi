import 'package:common_code/core/setup/signalr.dart';

class CustomerTransactionSignalR {
  static listen() {
    Signalr.on(Signal.cusotmertransaction, (p0) {});
  }
}
