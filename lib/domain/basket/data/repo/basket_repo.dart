import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:common_code/core/failures.dart';
import 'package:yumi/domain/basket/entity/basket.dart';

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
      {required String apiKeys, Map<String, dynamic>? pagination});

  TaskEither<Failure, Response> getOrderOrPreOrderDriverById(
      {required String apiKeys,
      required String id,
      Map<String, dynamic>? pagination});

  TaskEither<Failure, Response> putActionOrderOrPreOrder(
      {required String apiKeys, Map<String, dynamic>? pagination});

  TaskEither<Failure, Basket?> getBaskets({Map<String, dynamic>? pagination});

  TaskEither<Failure, Response> closeBasket(
      {required Basket basket, Map<String, dynamic>? pagination});

  TaskEither<Failure, Basket> updateBasket({required Basket basket});
  TaskEither<Failure, Basket> checkVoucherBasket(
      {required Basket basket, required String voucher});
}
