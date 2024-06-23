import 'package:fpdart/src/task_either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/order/entity/order.dart';
import 'package:yumi/statics/pager.dart';

abstract class OrderRepo {
  TaskEither<Failure, Pager<Order>> getOrders(
      {required String apiKeys, required Pager<Order> pager});
}
