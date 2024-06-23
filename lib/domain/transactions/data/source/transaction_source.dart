import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/statics/pager.dart';

abstract class TransactionSource {
  Future<Pager<Transaction>> getAllTransactions({
    required Pager<Transaction> pager,
    required String userId,
  });
}
