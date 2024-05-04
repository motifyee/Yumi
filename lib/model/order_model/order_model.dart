import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_model.freezed.dart';
part 'order_model.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const factory OrderModel({
    int? id,
    @JsonKey(name: 'chef_ID') String? chefID,
    @JsonKey(name: 'driver_ID') String? driverID,
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
    String? clientName,
    String? clientMobile,
    String? clientDefaultAddress,
    @JsonKey(name: 'driver_Accept') bool? driverAccept,
    @JsonKey(name: 'driver_Accept_Date') String? driverAcceptDate,
    @JsonKey(name: 'driver_Received') bool? driverReceived,
    @JsonKey(name: 'driver_Received_Date') String? driverReceivedDate,
    @JsonKey(name: 'chef_Accept') bool? chefAccept,
    @JsonKey(name: 'chef_Accept_Date') String? chefAcceptDate,
    @JsonKey(name: 'chef_Start') bool? chefStart,
    @JsonKey(name: 'chef_Start_Date') String? chefStartDate,
    @JsonKey(name: 'chef_Finished') bool? chefFinished,
    @JsonKey(name: 'chef_Finished_Date') String? chefFinishedDate,
    @JsonKey(name: 'client_Received') bool? clientReceived,
    @JsonKey(name: 'client_Received_Date') String? clientReceivedDate,
    @JsonKey(name: 'is_Pickup') final bool? isPickUp,
    @Default([]) List<InvoiceDetails>? invoiceDetails,
  }) = _OrderModel;

  const OrderModel._();

  bool get isChefDelayed =>
      DateTime.now()
              .difference(
                  DateTime.tryParse(createdDate ?? '') ?? DateTime.now())
              .inMinutes >
          35 &&
      chefStart == true &&
      chefFinished != true;

  bool get isDriverDelayed =>
      DateTime.now()
              .difference(
                  DateTime.tryParse(createdDate ?? '') ?? DateTime.now())
              .inMinutes >
          70 &&
      chefFinished == true &&
      clientReceived != true;

  bool get isDriverOrderPendingEnd =>
      DateTime.now().difference(DateTime.parse(createdDate ?? '')).inSeconds >
      120;

  bool get isDriverPreOrderPendingEnd =>
      DateTime.now().difference(DateTime.parse(createdDate ?? '')).inMinutes >
      (24 * 60);

  String get driverOrderPendingCount =>
      '${120 - DateTime.now().difference(DateTime.parse(createdDate ?? '')).inSeconds}s';

  String get driverPreOrderPendingCount => [
        if ((24 -
                DateTime.now()
                    .difference(DateTime.parse(createdDate ?? ''))
                    .inHours) >
            0)
          '${24 - DateTime.now().difference(DateTime.parse(createdDate ?? '')).inHours}h ',
        if ((24 -
                DateTime.now()
                    .difference(DateTime.parse(createdDate ?? ''))
                    .inHours) ==
            0)
          '${(24 * 60) - DateTime.now().difference(DateTime.parse(createdDate ?? '')).inMinutes}m'
      ].join(' ');

  bool get isClientReceivedOverDay =>
      DateTime.now()
              .difference(
                  DateTime.tryParse(clientReceivedDate ?? '') ?? DateTime.now())
              .inHours >
          24 &&
      clientReceived == true;

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

  chefPending,
  chefReceived,
  chefPreparing,
  chefReady,
  chefHistory,

  view
}
