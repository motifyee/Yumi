import 'package:fpdart/src/task_either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/transactions/data/repo/transaction_repo.dart';
import 'package:yumi/domain/transactions/data/source/transaction_source.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/statics/pager.dart';

class TransactionRepoRemote implements TransactionRepo {
  final TransactionSource transactionSource;

  TransactionRepoRemote({TransactionSource? transactionSource})
      : transactionSource = transactionSource ?? getIt<TransactionSource>();

  @override
  TaskEither<Failure, Pager<Transaction>> getAllTransaction(
          {required Pager<Transaction> pager, required String userId}) =>
      TaskEither.tryCatch(
          () => transactionSource.getAllTransactions(
              pager: pager, userId: userId),
          (error, stackTrace) => ServerFailure(error, stackTrace));
}
