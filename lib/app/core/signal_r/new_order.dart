import 'package:yumi/app/core/setup/signalr.dart';

class NewOrderReceivedSignalR {
  static listen() {
    Signalr.on(Signals.neworderreceived, (p0) {
      print('neworderreceived -------------------------------');
      print(p0);
    });
  }
}

// {invoiceId: 300919, chef_ID: c2d02a9b-171b-4517-8e16-5ca0726f2bf5, driver_ID: null, is_Pickup: true, is_Delivery: false, is_Preorder: false}
