import 'package:fpdart/src/either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/transactions/data/repo/transaction_repo.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/statics/pagination_helper.dart';

class GetAllTransaction
    extends UseCase<PaginationHelper<Transaction>, GetAllTransactionParams> {
  final TransactionRepo transactionRepo;

  GetAllTransaction({TransactionRepo? transactionRepo})
      : transactionRepo = transactionRepo ?? getIt<TransactionRepo>();

  @override
  Future<Either<Failure, PaginationHelper<Transaction>>> call(
          GetAllTransactionParams params) =>
      transactionRepo
          .getAllTransaction(
              paginationHelper: params.paginationHelper, userId: params.userId)
          .run();
}

class GetAllTransactionParams extends Params {
  final PaginationHelper<Transaction> paginationHelper;
  final String userId;

  GetAllTransactionParams(
      {required this.paginationHelper, required this.userId});

  @override
  List<Object?> get props => [paginationHelper, userId];
}
