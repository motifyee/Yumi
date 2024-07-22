import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_transaction_model.freezed.dart';
part 'invoice_transaction_model.g.dart';

@freezed
class InvoiceTransactionModel with _$InvoiceTransactionModel {
  const factory InvoiceTransactionModel({
    int? status,
    int? paymentType,
    double? treasuryAmountPaid,
    int? treasuryId,
    int? transactionType,
  }) = _InvoiceTransactionModel;

  factory InvoiceTransactionModel.initial({double? treasuryAmountPaid}) {
    return InvoiceTransactionModel(
        status: 2,
        paymentType: 1,
        transactionType: 36,
        treasuryId: 47,
        treasuryAmountPaid: treasuryAmountPaid ?? 0);
  }

  factory InvoiceTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceTransactionModelFromJson(json);
}
