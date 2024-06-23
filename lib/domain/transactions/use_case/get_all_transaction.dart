import 'package:fpdart/src/either.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/transactions/data/repo/transaction_repo.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/statics/pager.dart';

class GetAllTransaction
    extends UseCase<Pager<Transaction>, GetAllTransactionParams> {
  final TransactionRepo transactionRepo;

  GetAllTransaction({TransactionRepo? transactionRepo})
      : transactionRepo = transactionRepo ?? getIt<TransactionRepo>();

  @override
  Future<Either<Failure, Pager<Transaction>>> call(
          GetAllTransactionParams params) =>
      transactionRepo
          .getAllTransaction(pager: params.pager, userId: params.userId)
          .run();
}

class GetAllTransactionParams extends Params {
  final Pager<Transaction> pager;
  final String userId;

  GetAllTransactionParams({required this.pager, required this.userId});

  @override
  List<Object?> get props => [pager, userId];
}
