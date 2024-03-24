import 'package:flutter/cupertino.dart';
import 'package:yumi/model/invoice_model.dart';
import 'package:yumi/statics/api_statics.dart';

class OrderService {
  static Future<dynamic> createPreOrderDelivery(
      {required BuildContext context, required InvoiceModel invoice}) async {
    var res = await DioClient.simpleDio(context).post(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.preOrderDelivery),
        data: invoice.toJson());
    return res;
  }

  static Future<dynamic> createPreOrderPickUp(
      {required BuildContext context, required InvoiceModel invoice}) async {
    var res = await DioClient.simpleDio(context).post(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.preOrderPickUp),
        data: invoice.toJson());
    return res;
  }
}
