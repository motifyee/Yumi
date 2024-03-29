import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    int? id,
    String? chefID,
    String? employeeNote,
    String? clientNote,
    String? preparationNote,
    String? shippedAddressId,
    double? deliveryAreaPrice,
    double? deliveryCostPrice,
    double? finalPrice,
    double? totalPrice,
    double? invoiceTax,
    double? invoiceDiscount,
    int? bankID,
    List<InvoiceDetails>? invoiceDetails,
  }) = _OrderModel;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
}

@freezed
class InvoiceDetails with _$InvoiceDetails {
  const factory InvoiceDetails({
    int? productVarintId,
    double? quantity,
    double? productVarintPrice,
    double? totalProductVarintFinalPrice,
  }) = _InvoiceDetails;

  factory InvoiceDetails.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailsFromJson(json);
}
