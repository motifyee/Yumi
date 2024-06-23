import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/statics/pagination.dart';

abstract class TransactionRepo {
  TaskEither<Failure, Pagination<Transaction>> getAllTransaction(
      {required Pagination<Transaction> pagination, required String userId});
}
