import 'package:dependencies/dependencies.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    int? guid,
    int? accountId,
    int? invoiceId,
    String? accountName,
    String? journalType,
    String? createdDate,
    double? debit,
    double? credit,
    @JsonKey(name: 'previous_Balance') double? previousBalance,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
}
