import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/transactions/data/repo/transaction_repo.dart';
import 'package:yumi/domain/transactions/data/source/transaction_source.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';

class TransactionRepoRemote implements TransactionRepo {
  final TransactionSource transactionSource;

  TransactionRepoRemote({TransactionSource? transactionSource})
      : transactionSource = transactionSource ?? getIt<TransactionSource>();

  @override
  TaskEither<Failure, PaginatedData<Transaction>> getAllTransaction({
    required PaginatedData<Transaction> pagination,
    required String userId,
  }) =>
      TaskEither.tryCatch(
        () => transactionSource.getAllTransactions(
          pagination: pagination,
          userId: userId,
        ),
        (error, stackTrace) => ServerFailure(error.toString()),
      );
}
