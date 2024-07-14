import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/transactions/data/repo/transaction_repo.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';

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
