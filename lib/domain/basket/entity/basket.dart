import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/domain/basket/entity/invoice.dart';
import 'package:yumi/domain/basket/entity/invoice_detail.dart';

part 'basket.freezed.dart';
part 'basket.g.dart';

@freezed
class Basket with _$Basket {
  @JsonSerializable(includeIfNull: false)
  const factory Basket({
    int? id,
    required Invoice invoice,
    required List<InvoiceDetail> invoiceDetails,
    String? voucherId,
    int? bankId,
    int? shippedAddressId,
    @Default(false) bool isSchedule,
    @Default(false)
    @JsonKey(includeToJson: false, includeFromJson: false)
    bool isPickupOnly,
    @Default(true) @JsonKey(name: 'is_Pickup') bool isPickup,
    @Default(false) @JsonKey(name: 'is_Delivery') bool isDelivery,
    @Default(false) @JsonKey(name: 'is_Preorder') bool isPreorder,
    @Default(1) int? status,
  }) = _Basket;

  factory Basket.fromJson(Map<String, dynamic> json) => _$BasketFromJson(json);
}
