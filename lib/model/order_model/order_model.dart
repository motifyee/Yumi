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
    String? createdDate,
    List<InvoiceDetails>? invoiceDetails,
    @JsonKey(name: 'is_Pickup') final bool? isPickUp,
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
    String? productVarintName,
    String? image,
    String? note,
    Product? product,
  }) = _InvoiceDetails;

  factory InvoiceDetails.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailsFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    int? productID,
    String? productName,
    List<Ingredients>? ingredients,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class Ingredients with _$Ingredients {
  const factory Ingredients({
    String? id,
    String? name,
    @JsonKey(name: 'portion_Grams') double? portionGrams,
  }) = _Ingredients;

  factory Ingredients.fromJson(Map<String, dynamic> json) =>
      _$IngredientsFromJson(json);
}

enum OrderCardTargetPage {
  customerHistory,
  driverAccept,
  driverReceived,
  driverHistory,
  chefReceived,
  chefPreparing,
  chefReady,
  chefHistory
}
