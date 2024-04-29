import 'package:dio/dio.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/model/invoice_transaction_model/invoice_transaction_model.dart';

abstract class BasketSource {
  Future<Response> deleteBasket({required Basket basket});
  Future<Basket> createOrderOrPreOrderDelivery({
    required Basket basket,
    required bool isPreOrder,
  });
  Future<Basket> createOrderOrPreOrderPickUp({
    required Basket basket,
    required bool isPreOrder,
  });
  Future<Response> getOrderOrPreOrder(
      {required String apiKeys, Map<String, dynamic>? paginationHelper});
  Future<Response> getOrderOrPreOrderDriverById(
      {required String apiKeys,
      required String id,
      Map<String, dynamic>? paginationHelper});
  Future<Response> putActionOrderOrPreOrder(
      {required String apiKeys, Map<String, dynamic>? paginationHelper});
  Future<Basket?> getBaskets({Map<String, dynamic>? paginationHelper});
  Future<Response> closeBasket(
      {required Basket basket,
      required InvoiceTransactionModel invoiceTransaction,
      Map<String, dynamic>? paginationHelper});
  Future<Basket> updateBasket({required Basket basket});
}
