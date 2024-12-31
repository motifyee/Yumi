import 'package:dependencies/dependencies.dart';
import 'package:common_code/domain/food_delivery/ingredients/entities/ingredient.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    int? id,
    @JsonKey(name: 'chef_ID') String? chefID,
    @JsonKey(name: 'driver_ID') String? driverID,
    String? employeeNote,
    String? clientNote,
    String? preparationNote,
    int? shippedAddressId,
    double? deliveryAreaPrice,
    double? deliveryCostPrice,
    double? finalPrice,
    double? totalPrice,
    double? invoiceTax,
    double? invoiceDiscount,
    int? bankID,
    String? createdDate,
    String? updatedDate,
    @JsonKey(name: 'schedule_Date') String? scheduleDate,
    String? chefName,
    String? clientName,
    String? clientMobile,
    String? clientDefaultAddress,
    bool? isDeleted,
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
    @JsonKey(name: 'is_Pickup') bool? isPickUp,
    @JsonKey(name: 'address_Latitude') double? addressLatitude,
    @JsonKey(name: 'address_Longitude') double? addressLongitude,
    String? location,
    @Default([]) List<InvoiceDetails>? invoiceDetails,
    @Default(false) bool isLoading,
  }) = _Order;

  const Order._();

  bool get isChefDelayed =>
      DateTime.now()
              .difference(
                  DateTime.tryParse(updatedDate ?? '') ?? DateTime.now())
              .inMinutes >
          35 &&
      chefStart == true &&
      chefFinished != true;

  bool get isDriverOrderDelayed =>
      DateTime.now()
              .difference(
                  DateTime.tryParse(updatedDate ?? '') ?? DateTime.now())
              .inMinutes >
          70 &&
      chefFinished == true &&
      clientReceived != true;
  bool get isDriverPreOrderDelayed =>
      DateTime.now()
              .difference(
                  DateTime.tryParse(scheduleDate ?? '') ?? DateTime.now())
              .inMinutes >
          70 &&
      chefFinished == true &&
      clientReceived != true;

  // TODO : should be 2 min
  bool get isDriverOrderPendingEnd =>
      DateTime.now()
          .difference(DateTime.tryParse(updatedDate ?? '') ?? DateTime.now())
          .inMinutes >
      (24 * 60);

  bool get isDriverPreOrderPendingEnd =>
      DateTime.now()
          .difference(DateTime.tryParse(updatedDate ?? '') ?? DateTime.now())
          .inMinutes >
      (24 * 60);

  String get driverOrderPendingCount =>
      '${120 - DateTime.now().difference(DateTime.tryParse(updatedDate ?? '') ?? DateTime.now()).inSeconds}s';

  String get driverPreOrderPendingCount => [
        if ((24 -
                DateTime.now()
                    .difference(
                        DateTime.tryParse(updatedDate ?? '') ?? DateTime.now())
                    .inHours) >
            0)
          '${24 - DateTime.now().difference(DateTime.tryParse(updatedDate ?? '') ?? DateTime.now()).inHours}h ',
        if ((24 -
                DateTime.now()
                    .difference(
                        DateTime.tryParse(updatedDate ?? '') ?? DateTime.now())
                    .inHours) ==
            0)
          '${(24 * 60) - DateTime.now().difference(DateTime.tryParse(updatedDate ?? '') ?? DateTime.now()).inMinutes}m'
      ].join(' ');

  // for review
  bool get isClientReceivedOverDay =>
      (DateTime.now()
              .difference(
                  DateTime.tryParse(clientReceivedDate ?? '') ?? DateTime.now())
              .inHours <
          24) &&
      clientReceived == true;

  // for customer to cancel pre order
  bool get isOver12H => (DateTime.now()
          .difference(DateTime.tryParse(updatedDate ?? '') ?? DateTime.now())
          .inHours >=
      12);

  // for chef to accept pre order
  bool get isOver3H => (DateTime.now()
          .difference(DateTime.tryParse(updatedDate ?? '') ?? DateTime.now())
          .inHours >=
      3);

  String get isOver3HCount => [
        if ((3 -
                DateTime.now()
                    .difference(
                        DateTime.tryParse(updatedDate ?? '') ?? DateTime.now())
                    .inHours) >
            0)
          '${3 - DateTime.now().difference(DateTime.tryParse(updatedDate ?? '') ?? DateTime.now()).inHours}h',
        if ((3 -
                DateTime.now()
                    .difference(
                        DateTime.tryParse(updatedDate ?? '') ?? DateTime.now())
                    .inHours) <=
            0)
          '${(3 * 60) - DateTime.now().difference(DateTime.tryParse(updatedDate ?? '') ?? DateTime.now()).inMinutes}m'
      ].join(' ');

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
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
    List<Ingredient>? ingredients,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

enum OrderCardType {
  customerOrders,
  customerPreOrders,
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
