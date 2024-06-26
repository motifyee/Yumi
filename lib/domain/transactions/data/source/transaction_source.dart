import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/statics/paginatedData.dart';

abstract class TransactionSource {
  Future<PaginatedData<Transaction>> getAllTransactions({
    required PaginatedData<Transaction> pagination,
    required String userId,
  });
}
