import 'package:fpdart/src/either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/transactions/data/repo/transaction_repo.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/statics/paginatedData.dart';

class GetAllTransaction
    extends UseCase<PaginatedData<Transaction>, GetAllTransactionParams> {
  final TransactionRepo transactionRepo;

  GetAllTransaction({TransactionRepo? transactionRepo})
      : transactionRepo = transactionRepo ?? getIt<TransactionRepo>();

  @override
  Future<Either<Failure, PaginatedData<Transaction>>> call(
          GetAllTransactionParams params) =>
      transactionRepo
          .getAllTransaction(
              pagination: params.pagination, userId: params.userId)
          .run();
}

class GetAllTransactionParams extends Params {
  final PaginatedData<Transaction> pagination;
  final String userId;

  GetAllTransactionParams({required this.pagination, required this.userId});

  @override
  List<Object?> get props => [pagination, userId];
}
