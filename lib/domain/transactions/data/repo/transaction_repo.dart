import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/statics/paginatedData.dart';

abstract class TransactionRepo {
  TaskEither<Failure, PaginatedData<Transaction>> getAllTransaction(
      {required PaginatedData<Transaction> pagination, required String userId});
}
