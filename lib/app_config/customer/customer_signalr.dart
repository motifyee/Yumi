import 'package:yumi/app_config/customer/signal_r/customer_transaction_signalr.dart';

class CustomerSignalR {
  static initial() {
    CustomerTransactionSignalR.listen();
  }
}
