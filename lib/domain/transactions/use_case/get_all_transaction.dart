import 'package:fpdart/src/either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/transactions/data/repo/transaction_repo.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/statics/pagination.dart';

class GetAllTransaction
    extends UseCase<Pagination<Transaction>, GetAllTransactionParams> {
  final TransactionRepo transactionRepo;

  GetAllTransaction({TransactionRepo? transactionRepo})
      : transactionRepo = transactionRepo ?? getIt<TransactionRepo>();

  @override
  Future<Either<Failure, Pagination<Transaction>>> call(
          GetAllTransactionParams params) =>
      transactionRepo
          .getAllTransaction(
              pagination: params.pagination, userId: params.userId)
          .run();
}

class GetAllTransactionParams extends Params {
  final Pagination<Transaction> pagination;
  final String userId;

  GetAllTransactionParams({required this.pagination, required this.userId});

  @override
  List<Object?> get props => [pagination, userId];
}
