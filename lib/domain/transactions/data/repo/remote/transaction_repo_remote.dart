import 'package:fpdart/src/task_either.dart';
import 'package:yumi/app/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/transactions/data/repo/transaction_repo.dart';
import 'package:yumi/domain/transactions/data/source/transaction_source.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/statics/pagination_helper.dart';

class TransactionRepoRemote implements TransactionRepo {
  final TransactionSource transactionSource;

  TransactionRepoRemote({TransactionSource? transactionSource})
      : transactionSource = transactionSource ?? getIt<TransactionSource>();

  @override
  TaskEither<Failure, PaginationHelper<Transaction>> getAllTransaction(
          {required PaginationHelper<Transaction> paginationHelper,
          required String userId}) =>
      TaskEither.tryCatch(
          () => transactionSource.getAllTransactions(
              paginationHelper: paginationHelper, userId: userId),
          (error, stackTrace) => ServerFailure(error, stackTrace));
}
