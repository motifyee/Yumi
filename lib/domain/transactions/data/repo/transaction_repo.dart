import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';

abstract class TransactionRepo {
  TaskEither<Failure, PaginatedData<Transaction>> getAllTransaction(
      {required PaginatedData<Transaction> pagination, required String userId});
}
