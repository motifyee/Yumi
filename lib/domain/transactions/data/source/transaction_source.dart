import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/statics/pagination.dart';

abstract class TransactionSource {
  Future<Pagination<Transaction>> getAllTransactions({
    required Pagination<Transaction> pagination,
    required String userId,
  });
}
