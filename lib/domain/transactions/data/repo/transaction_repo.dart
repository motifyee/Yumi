import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/statics/pagination_helper.dart';

abstract class TransactionRepo {
  TaskEither<Failure, PaginationHelper<Transaction>> getAllTransaction(
      {required PaginationHelper<Transaction> paginationHelper,
      required String userId});
}
