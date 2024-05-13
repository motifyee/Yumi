import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/statics/pagination_helper.dart';

abstract class TransactionSource {
  Future<PaginationHelper<Transaction>> getAllTransactions({
    required PaginationHelper<Transaction> paginationHelper,
    required String userId,
  });
}
