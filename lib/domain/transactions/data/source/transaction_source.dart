import 'package:common_code/common_code.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';

abstract class TransactionSource {
  Future<PaginatedData<Transaction>> getAllTransactions({
    required PaginatedData<Transaction> pagination,
    required String userId,
  });
}
