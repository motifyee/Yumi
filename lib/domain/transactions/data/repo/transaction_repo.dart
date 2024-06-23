import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/statics/pager.dart';

abstract class TransactionRepo {
  TaskEither<Failure, Pager<Transaction>> getAllTransaction(
      {required Pager<Transaction> pager, required String userId});
}
