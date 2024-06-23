import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/extensions/datetime_toIso8601string_converter.dart';
import 'package:yumi/extensions/string_to_double_converter.dart';
import 'package:yumi/app/pages/menu/meal_model.dart';
import 'package:yumi/statics/code_generator.dart';

part 'basket.freezed.dart';
part 'basket.g.dart';

@freezed
class Basket with _$Basket {
  @JsonSerializable(includeIfNull: false)
  const factory Basket({
    int? id,
    required Invoice invoice,
    required List<InvoiceDetails> invoiceDetails,
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
    @JsonKey(name: 'schedule_Date')
    @DateTimeToIso8601StringConverter()
    DateTime? scheduleDate,
    String? invoiceCode,
  }) = _Invoice;

  const Invoice._();

  bool get isBasketExpired =>
      DateTime.now()
          .difference(DateTime.tryParse(createdDate ?? '') ?? DateTime.now())
          .inHours >
      24;

  DateTime get scheduleDateConstraint =>
      (scheduleDate ?? DateTime.now()).difference(DateTime.now()).inHours < 24
          ? DateTime.now().add(const Duration(days: 1))
          : scheduleDate!;

  factory Invoice.initial() {
    return Invoice(invoiceCode: CodeGenerator.getRandomCode());
  }

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);
}

@freezed
class InvoiceDetails with _$InvoiceDetails {
  const factory InvoiceDetails({
    int? productVarintId,
    @Default("0") @StringToDoubleAsIntStringConverter() String quantity,
    @Default(0) double productVarintPrice,
    @Default(1205) int discountListId,
    @Default('') String note,
    @JsonKey(includeToJson: false) MealModel? meal,
  }) = _InvoiceDetails;

  factory InvoiceDetails.fromMeal({required MealModel meal}) {
    return InvoiceDetails(
      productVarintId: meal.productVariantID,
      quantity: '1',
      productVarintPrice: double.parse(meal.price1 ?? '0'),
      discountListId: 1205,
      note: '',
      meal: meal,
    );
  }

  factory InvoiceDetails.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailsFromJson(json);
}
