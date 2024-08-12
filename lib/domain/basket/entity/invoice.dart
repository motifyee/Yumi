import 'package:common_code/common_code.dart';
import 'package:dependencies/dependencies.dart';

part 'invoice.freezed.dart';
part 'invoice.g.dart';

@freezed
class Invoice with _$Invoice {
  @JsonSerializable(anyMap: true)
  const factory Invoice({
    int? createdBy,
    String? createdDate,
    @JsonKey(name: 'chef_ID') String? chefID,
    @Default('') String clientNote,
    @Default('') String preparationNotes,
    @Default('') String employeeNote,
    @Default(4.5) double deliveryCostPrice,
    @Default(4.5) double deliveryAreaPrice,
    @Default(0.0) double invoiceDiscount,
    @Default(0.0) double invoiceTax,
    @Default(0.0) double finalPrice,
    @Default(0.0) double totalPrice,
    @JsonKey(name: 'schedule_Date') @DateTimeToIso8601StringConverter() DateTime? scheduleDate,
    String? invoiceCode,
    @Default(1) int? paymentType,
  }) = _Invoice;

  const Invoice._();

  bool get isBasketExpired => DateTime.now().difference(DateTime.tryParse(createdDate ?? '') ?? DateTime.now()).inHours > 24;

  DateTime get scheduleDateConstraint => (scheduleDate ?? DateTime.now()).difference(DateTime.now()).inHours < 24 ? DateTime.now().add(const Duration(days: 1)) : scheduleDate!;

  factory Invoice.initial() {
    return Invoice(invoiceCode: CodeGenerator.getRandomCode());
  }

  factory Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);
}
