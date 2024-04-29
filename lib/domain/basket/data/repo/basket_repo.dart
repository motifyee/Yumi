import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/model/invoice_transaction_model/invoice_transaction_model.dart';

abstract class BasketRepo {
  TaskEither<Failure, Response> deleteBasket({required Basket basket});

  TaskEither<Failure, Basket> createOrderOrPreOrderDelivery({
    required Basket basket,
    required bool isPreOrder,
  });

  TaskEither<Failure, Basket> createOrderOrPreOrderPickUp({
    required Basket basket,
    required bool isPreOrder,
  });

  TaskEither<Failure, Response> getOrderOrPreOrder(
      {required String apiKeys, Map<String, dynamic>? paginationHelper});

  TaskEither<Failure, Response> getOrderOrPreOrderDriverById(
      {required String apiKeys,
      required String id,
      Map<String, dynamic>? paginationHelper});

  TaskEither<Failure, Response> putActionOrderOrPreOrder(
      {required String apiKeys, Map<String, dynamic>? paginationHelper});

  TaskEither<Failure, Basket?> getBaskets(
      {Map<String, dynamic>? paginationHelper});

  TaskEither<Failure, Response> closeBasket(
      {required Basket basket,
      required InvoiceTransactionModel invoiceTransaction,
      Map<String, dynamic>? paginationHelper});

  TaskEither<Failure, Basket> updateBasket({required Basket basket});
}
