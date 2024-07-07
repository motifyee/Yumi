import 'package:dio/src/response.dart';
import 'package:fpdart/src/task_either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/basket/data/repo/basket_repo.dart';
import 'package:yumi/domain/basket/data/source/basket_source.dart';
import 'package:yumi/domain/basket/entity/basket.dart';

class BasketRemoteRepo implements BasketRepo {
  final BasketSource basketSource;
  BasketRemoteRepo({BasketSource? basketSource}) : basketSource = basketSource ?? getIt<BasketSource>();

  @override
  TaskEither<Failure, Response> deleteBasket({required Basket basket}) => TaskEither.tryCatch(() => basketSource.deleteBasket(basket: basket), (error, stackTrace) => ServerFailure(error, stackTrace));

  @override
  TaskEither<Failure, Response> closeBasket({required Basket basket, Map<String, dynamic>? pagination}) =>
      TaskEither.tryCatch(() => basketSource.closeBasket(basket: basket, pagination: pagination), (error, stackTrace) => ServerFailure(error, stackTrace));

  @override
  TaskEither<Failure, Basket> createOrderOrPreOrderDelivery({required Basket basket, required bool isPreOrder}) =>
      TaskEither.tryCatch(() => basketSource.createOrderOrPreOrderDelivery(basket: basket, isPreOrder: isPreOrder), (error, stackTrace) => ServerFailure(error, stackTrace));

  @override
  TaskEither<Failure, Basket> createOrderOrPreOrderPickUp({required Basket basket, required bool isPreOrder}) => TaskEither.tryCatch(() => basketSource.createOrderOrPreOrderPickUp(basket: basket, isPreOrder: isPreOrder), (error, stackTrace) {
        return ServerFailure(error, stackTrace);
      });

  @override
  TaskEither<Failure, Basket?> getBaskets({Map<String, dynamic>? pagination}) => TaskEither.tryCatch(() => basketSource.getBaskets(pagination: pagination), (error, stackTrace) => ServerFailure(error, stackTrace));

  @override
  TaskEither<Failure, Response> getOrderOrPreOrder({required String apiKeys, Map<String, dynamic>? pagination}) =>
      TaskEither.tryCatch(() => basketSource.getOrderOrPreOrder(apiKeys: apiKeys, pagination: pagination), (error, stackTrace) => ServerFailure(error, stackTrace));

  @override
  TaskEither<Failure, Response> getOrderOrPreOrderDriverById({required String apiKeys, required String id, Map<String, dynamic>? pagination}) =>
      TaskEither.tryCatch(() => basketSource.getOrderOrPreOrderDriverById(apiKeys: apiKeys, id: id, pagination: pagination), (error, stackTrace) => ServerFailure(error, stackTrace));

  @override
  TaskEither<Failure, Response> putActionOrderOrPreOrder({required String apiKeys, Map<String, dynamic>? pagination}) =>
      TaskEither.tryCatch(() => basketSource.putActionOrderOrPreOrder(apiKeys: apiKeys, pagination: pagination), (error, stackTrace) => ServerFailure(error, stackTrace));

  @override
  TaskEither<Failure, Basket> updateBasket({required Basket basket}) => TaskEither.tryCatch(() => basketSource.updateBasket(basket: basket), (error, stackTrace) => ServerFailure(error, stackTrace));

  @override
  TaskEither<Failure, Basket> checkVoucherBasket({required Basket basket, required String voucher}) =>
      TaskEither.tryCatch(() => basketSource.checkVoucherBasket(basket: basket, voucher: voucher), (error, stackTrace) => ServerFailure(error, stackTrace));
}
