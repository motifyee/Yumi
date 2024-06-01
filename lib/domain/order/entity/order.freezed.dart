// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'chef_ID')
  String? get chefID => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_ID')
  String? get driverID => throw _privateConstructorUsedError;
  String? get employeeNote => throw _privateConstructorUsedError;
  String? get clientNote => throw _privateConstructorUsedError;
  String? get preparationNote => throw _privateConstructorUsedError;
  String? get shippedAddressId => throw _privateConstructorUsedError;
  double? get deliveryAreaPrice => throw _privateConstructorUsedError;
  double? get deliveryCostPrice => throw _privateConstructorUsedError;
  double? get finalPrice => throw _privateConstructorUsedError;
  double? get totalPrice => throw _privateConstructorUsedError;
  double? get invoiceTax => throw _privateConstructorUsedError;
  double? get invoiceDiscount => throw _privateConstructorUsedError;
  int? get bankID => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;
  String? get updatedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_Date')
  String? get scheduleDate => throw _privateConstructorUsedError;
  String? get clientName => throw _privateConstructorUsedError;
  String? get clientMobile => throw _privateConstructorUsedError;
  String? get clientDefaultAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_Accept')
  bool? get driverAccept => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_Accept_Date')
  String? get driverAcceptDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_Received')
  bool? get driverReceived => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_Received_Date')
  String? get driverReceivedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'chef_Accept')
  bool? get chefAccept => throw _privateConstructorUsedError;
  @JsonKey(name: 'chef_Accept_Date')
  String? get chefAcceptDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'chef_Start')
  bool? get chefStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'chef_Start_Date')
  String? get chefStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'chef_Finished')
  bool? get chefFinished => throw _privateConstructorUsedError;
  @JsonKey(name: 'chef_Finished_Date')
  String? get chefFinishedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_Received')
  bool? get clientReceived => throw _privateConstructorUsedError;
  @JsonKey(name: 'client_Received_Date')
  String? get clientReceivedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_Pickup')
  bool? get isPickUp => throw _privateConstructorUsedError;
  List<InvoiceDetails>? get invoiceDetails =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {int? id,
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
      String? updatedDate,
      @JsonKey(name: 'schedule_Date') String? scheduleDate,
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
      @JsonKey(name: 'is_Pickup') bool? isPickUp,
      List<InvoiceDetails>? invoiceDetails,
      bool isLoading});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chefID = freezed,
    Object? driverID = freezed,
    Object? employeeNote = freezed,
    Object? clientNote = freezed,
    Object? preparationNote = freezed,
    Object? shippedAddressId = freezed,
    Object? deliveryAreaPrice = freezed,
    Object? deliveryCostPrice = freezed,
    Object? finalPrice = freezed,
    Object? totalPrice = freezed,
    Object? invoiceTax = freezed,
    Object? invoiceDiscount = freezed,
    Object? bankID = freezed,
    Object? createdDate = freezed,
    Object? updatedDate = freezed,
    Object? scheduleDate = freezed,
    Object? clientName = freezed,
    Object? clientMobile = freezed,
    Object? clientDefaultAddress = freezed,
    Object? driverAccept = freezed,
    Object? driverAcceptDate = freezed,
    Object? driverReceived = freezed,
    Object? driverReceivedDate = freezed,
    Object? chefAccept = freezed,
    Object? chefAcceptDate = freezed,
    Object? chefStart = freezed,
    Object? chefStartDate = freezed,
    Object? chefFinished = freezed,
    Object? chefFinishedDate = freezed,
    Object? clientReceived = freezed,
    Object? clientReceivedDate = freezed,
    Object? isPickUp = freezed,
    Object? invoiceDetails = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      chefID: freezed == chefID
          ? _value.chefID
          : chefID // ignore: cast_nullable_to_non_nullable
              as String?,
      driverID: freezed == driverID
          ? _value.driverID
          : driverID // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeNote: freezed == employeeNote
          ? _value.employeeNote
          : employeeNote // ignore: cast_nullable_to_non_nullable
              as String?,
      clientNote: freezed == clientNote
          ? _value.clientNote
          : clientNote // ignore: cast_nullable_to_non_nullable
              as String?,
      preparationNote: freezed == preparationNote
          ? _value.preparationNote
          : preparationNote // ignore: cast_nullable_to_non_nullable
              as String?,
      shippedAddressId: freezed == shippedAddressId
          ? _value.shippedAddressId
          : shippedAddressId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAreaPrice: freezed == deliveryAreaPrice
          ? _value.deliveryAreaPrice
          : deliveryAreaPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryCostPrice: freezed == deliveryCostPrice
          ? _value.deliveryCostPrice
          : deliveryCostPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      finalPrice: freezed == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      invoiceTax: freezed == invoiceTax
          ? _value.invoiceTax
          : invoiceTax // ignore: cast_nullable_to_non_nullable
              as double?,
      invoiceDiscount: freezed == invoiceDiscount
          ? _value.invoiceDiscount
          : invoiceDiscount // ignore: cast_nullable_to_non_nullable
              as double?,
      bankID: freezed == bankID
          ? _value.bankID
          : bankID // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleDate: freezed == scheduleDate
          ? _value.scheduleDate
          : scheduleDate // ignore: cast_nullable_to_non_nullable
              as String?,
      clientName: freezed == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientMobile: freezed == clientMobile
          ? _value.clientMobile
          : clientMobile // ignore: cast_nullable_to_non_nullable
              as String?,
      clientDefaultAddress: freezed == clientDefaultAddress
          ? _value.clientDefaultAddress
          : clientDefaultAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      driverAccept: freezed == driverAccept
          ? _value.driverAccept
          : driverAccept // ignore: cast_nullable_to_non_nullable
              as bool?,
      driverAcceptDate: freezed == driverAcceptDate
          ? _value.driverAcceptDate
          : driverAcceptDate // ignore: cast_nullable_to_non_nullable
              as String?,
      driverReceived: freezed == driverReceived
          ? _value.driverReceived
          : driverReceived // ignore: cast_nullable_to_non_nullable
              as bool?,
      driverReceivedDate: freezed == driverReceivedDate
          ? _value.driverReceivedDate
          : driverReceivedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      chefAccept: freezed == chefAccept
          ? _value.chefAccept
          : chefAccept // ignore: cast_nullable_to_non_nullable
              as bool?,
      chefAcceptDate: freezed == chefAcceptDate
          ? _value.chefAcceptDate
          : chefAcceptDate // ignore: cast_nullable_to_non_nullable
              as String?,
      chefStart: freezed == chefStart
          ? _value.chefStart
          : chefStart // ignore: cast_nullable_to_non_nullable
              as bool?,
      chefStartDate: freezed == chefStartDate
          ? _value.chefStartDate
          : chefStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      chefFinished: freezed == chefFinished
          ? _value.chefFinished
          : chefFinished // ignore: cast_nullable_to_non_nullable
              as bool?,
      chefFinishedDate: freezed == chefFinishedDate
          ? _value.chefFinishedDate
          : chefFinishedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      clientReceived: freezed == clientReceived
          ? _value.clientReceived
          : clientReceived // ignore: cast_nullable_to_non_nullable
              as bool?,
      clientReceivedDate: freezed == clientReceivedDate
          ? _value.clientReceivedDate
          : clientReceivedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isPickUp: freezed == isPickUp
          ? _value.isPickUp
          : isPickUp // ignore: cast_nullable_to_non_nullable
              as bool?,
      invoiceDetails: freezed == invoiceDetails
          ? _value.invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
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
      String? updatedDate,
      @JsonKey(name: 'schedule_Date') String? scheduleDate,
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
      @JsonKey(name: 'is_Pickup') bool? isPickUp,
      List<InvoiceDetails>? invoiceDetails,
      bool isLoading});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chefID = freezed,
    Object? driverID = freezed,
    Object? employeeNote = freezed,
    Object? clientNote = freezed,
    Object? preparationNote = freezed,
    Object? shippedAddressId = freezed,
    Object? deliveryAreaPrice = freezed,
    Object? deliveryCostPrice = freezed,
    Object? finalPrice = freezed,
    Object? totalPrice = freezed,
    Object? invoiceTax = freezed,
    Object? invoiceDiscount = freezed,
    Object? bankID = freezed,
    Object? createdDate = freezed,
    Object? updatedDate = freezed,
    Object? scheduleDate = freezed,
    Object? clientName = freezed,
    Object? clientMobile = freezed,
    Object? clientDefaultAddress = freezed,
    Object? driverAccept = freezed,
    Object? driverAcceptDate = freezed,
    Object? driverReceived = freezed,
    Object? driverReceivedDate = freezed,
    Object? chefAccept = freezed,
    Object? chefAcceptDate = freezed,
    Object? chefStart = freezed,
    Object? chefStartDate = freezed,
    Object? chefFinished = freezed,
    Object? chefFinishedDate = freezed,
    Object? clientReceived = freezed,
    Object? clientReceivedDate = freezed,
    Object? isPickUp = freezed,
    Object? invoiceDetails = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$OrderImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      chefID: freezed == chefID
          ? _value.chefID
          : chefID // ignore: cast_nullable_to_non_nullable
              as String?,
      driverID: freezed == driverID
          ? _value.driverID
          : driverID // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeNote: freezed == employeeNote
          ? _value.employeeNote
          : employeeNote // ignore: cast_nullable_to_non_nullable
              as String?,
      clientNote: freezed == clientNote
          ? _value.clientNote
          : clientNote // ignore: cast_nullable_to_non_nullable
              as String?,
      preparationNote: freezed == preparationNote
          ? _value.preparationNote
          : preparationNote // ignore: cast_nullable_to_non_nullable
              as String?,
      shippedAddressId: freezed == shippedAddressId
          ? _value.shippedAddressId
          : shippedAddressId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryAreaPrice: freezed == deliveryAreaPrice
          ? _value.deliveryAreaPrice
          : deliveryAreaPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryCostPrice: freezed == deliveryCostPrice
          ? _value.deliveryCostPrice
          : deliveryCostPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      finalPrice: freezed == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      invoiceTax: freezed == invoiceTax
          ? _value.invoiceTax
          : invoiceTax // ignore: cast_nullable_to_non_nullable
              as double?,
      invoiceDiscount: freezed == invoiceDiscount
          ? _value.invoiceDiscount
          : invoiceDiscount // ignore: cast_nullable_to_non_nullable
              as double?,
      bankID: freezed == bankID
          ? _value.bankID
          : bankID // ignore: cast_nullable_to_non_nullable
              as int?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedDate: freezed == updatedDate
          ? _value.updatedDate
          : updatedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduleDate: freezed == scheduleDate
          ? _value.scheduleDate
          : scheduleDate // ignore: cast_nullable_to_non_nullable
              as String?,
      clientName: freezed == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientMobile: freezed == clientMobile
          ? _value.clientMobile
          : clientMobile // ignore: cast_nullable_to_non_nullable
              as String?,
      clientDefaultAddress: freezed == clientDefaultAddress
          ? _value.clientDefaultAddress
          : clientDefaultAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      driverAccept: freezed == driverAccept
          ? _value.driverAccept
          : driverAccept // ignore: cast_nullable_to_non_nullable
              as bool?,
      driverAcceptDate: freezed == driverAcceptDate
          ? _value.driverAcceptDate
          : driverAcceptDate // ignore: cast_nullable_to_non_nullable
              as String?,
      driverReceived: freezed == driverReceived
          ? _value.driverReceived
          : driverReceived // ignore: cast_nullable_to_non_nullable
              as bool?,
      driverReceivedDate: freezed == driverReceivedDate
          ? _value.driverReceivedDate
          : driverReceivedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      chefAccept: freezed == chefAccept
          ? _value.chefAccept
          : chefAccept // ignore: cast_nullable_to_non_nullable
              as bool?,
      chefAcceptDate: freezed == chefAcceptDate
          ? _value.chefAcceptDate
          : chefAcceptDate // ignore: cast_nullable_to_non_nullable
              as String?,
      chefStart: freezed == chefStart
          ? _value.chefStart
          : chefStart // ignore: cast_nullable_to_non_nullable
              as bool?,
      chefStartDate: freezed == chefStartDate
          ? _value.chefStartDate
          : chefStartDate // ignore: cast_nullable_to_non_nullable
              as String?,
      chefFinished: freezed == chefFinished
          ? _value.chefFinished
          : chefFinished // ignore: cast_nullable_to_non_nullable
              as bool?,
      chefFinishedDate: freezed == chefFinishedDate
          ? _value.chefFinishedDate
          : chefFinishedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      clientReceived: freezed == clientReceived
          ? _value.clientReceived
          : clientReceived // ignore: cast_nullable_to_non_nullable
              as bool?,
      clientReceivedDate: freezed == clientReceivedDate
          ? _value.clientReceivedDate
          : clientReceivedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      isPickUp: freezed == isPickUp
          ? _value.isPickUp
          : isPickUp // ignore: cast_nullable_to_non_nullable
              as bool?,
      invoiceDetails: freezed == invoiceDetails
          ? _value._invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl extends _Order {
  const _$OrderImpl(
      {this.id,
      @JsonKey(name: 'chef_ID') this.chefID,
      @JsonKey(name: 'driver_ID') this.driverID,
      this.employeeNote,
      this.clientNote,
      this.preparationNote,
      this.shippedAddressId,
      this.deliveryAreaPrice,
      this.deliveryCostPrice,
      this.finalPrice,
      this.totalPrice,
      this.invoiceTax,
      this.invoiceDiscount,
      this.bankID,
      this.createdDate,
      this.updatedDate,
      @JsonKey(name: 'schedule_Date') this.scheduleDate,
      this.clientName,
      this.clientMobile,
      this.clientDefaultAddress,
      @JsonKey(name: 'driver_Accept') this.driverAccept,
      @JsonKey(name: 'driver_Accept_Date') this.driverAcceptDate,
      @JsonKey(name: 'driver_Received') this.driverReceived,
      @JsonKey(name: 'driver_Received_Date') this.driverReceivedDate,
      @JsonKey(name: 'chef_Accept') this.chefAccept,
      @JsonKey(name: 'chef_Accept_Date') this.chefAcceptDate,
      @JsonKey(name: 'chef_Start') this.chefStart,
      @JsonKey(name: 'chef_Start_Date') this.chefStartDate,
      @JsonKey(name: 'chef_Finished') this.chefFinished,
      @JsonKey(name: 'chef_Finished_Date') this.chefFinishedDate,
      @JsonKey(name: 'client_Received') this.clientReceived,
      @JsonKey(name: 'client_Received_Date') this.clientReceivedDate,
      @JsonKey(name: 'is_Pickup') this.isPickUp,
      final List<InvoiceDetails>? invoiceDetails = const [],
      this.isLoading = false})
      : _invoiceDetails = invoiceDetails,
        super._();

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'chef_ID')
  final String? chefID;
  @override
  @JsonKey(name: 'driver_ID')
  final String? driverID;
  @override
  final String? employeeNote;
  @override
  final String? clientNote;
  @override
  final String? preparationNote;
  @override
  final String? shippedAddressId;
  @override
  final double? deliveryAreaPrice;
  @override
  final double? deliveryCostPrice;
  @override
  final double? finalPrice;
  @override
  final double? totalPrice;
  @override
  final double? invoiceTax;
  @override
  final double? invoiceDiscount;
  @override
  final int? bankID;
  @override
  final String? createdDate;
  @override
  final String? updatedDate;
  @override
  @JsonKey(name: 'schedule_Date')
  final String? scheduleDate;
  @override
  final String? clientName;
  @override
  final String? clientMobile;
  @override
  final String? clientDefaultAddress;
  @override
  @JsonKey(name: 'driver_Accept')
  final bool? driverAccept;
  @override
  @JsonKey(name: 'driver_Accept_Date')
  final String? driverAcceptDate;
  @override
  @JsonKey(name: 'driver_Received')
  final bool? driverReceived;
  @override
  @JsonKey(name: 'driver_Received_Date')
  final String? driverReceivedDate;
  @override
  @JsonKey(name: 'chef_Accept')
  final bool? chefAccept;
  @override
  @JsonKey(name: 'chef_Accept_Date')
  final String? chefAcceptDate;
  @override
  @JsonKey(name: 'chef_Start')
  final bool? chefStart;
  @override
  @JsonKey(name: 'chef_Start_Date')
  final String? chefStartDate;
  @override
  @JsonKey(name: 'chef_Finished')
  final bool? chefFinished;
  @override
  @JsonKey(name: 'chef_Finished_Date')
  final String? chefFinishedDate;
  @override
  @JsonKey(name: 'client_Received')
  final bool? clientReceived;
  @override
  @JsonKey(name: 'client_Received_Date')
  final String? clientReceivedDate;
  @override
  @JsonKey(name: 'is_Pickup')
  final bool? isPickUp;
  final List<InvoiceDetails>? _invoiceDetails;
  @override
  @JsonKey()
  List<InvoiceDetails>? get invoiceDetails {
    final value = _invoiceDetails;
    if (value == null) return null;
    if (_invoiceDetails is EqualUnmodifiableListView) return _invoiceDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'Order(id: $id, chefID: $chefID, driverID: $driverID, employeeNote: $employeeNote, clientNote: $clientNote, preparationNote: $preparationNote, shippedAddressId: $shippedAddressId, deliveryAreaPrice: $deliveryAreaPrice, deliveryCostPrice: $deliveryCostPrice, finalPrice: $finalPrice, totalPrice: $totalPrice, invoiceTax: $invoiceTax, invoiceDiscount: $invoiceDiscount, bankID: $bankID, createdDate: $createdDate, updatedDate: $updatedDate, scheduleDate: $scheduleDate, clientName: $clientName, clientMobile: $clientMobile, clientDefaultAddress: $clientDefaultAddress, driverAccept: $driverAccept, driverAcceptDate: $driverAcceptDate, driverReceived: $driverReceived, driverReceivedDate: $driverReceivedDate, chefAccept: $chefAccept, chefAcceptDate: $chefAcceptDate, chefStart: $chefStart, chefStartDate: $chefStartDate, chefFinished: $chefFinished, chefFinishedDate: $chefFinishedDate, clientReceived: $clientReceived, clientReceivedDate: $clientReceivedDate, isPickUp: $isPickUp, invoiceDetails: $invoiceDetails, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chefID, chefID) || other.chefID == chefID) &&
            (identical(other.driverID, driverID) ||
                other.driverID == driverID) &&
            (identical(other.employeeNote, employeeNote) ||
                other.employeeNote == employeeNote) &&
            (identical(other.clientNote, clientNote) ||
                other.clientNote == clientNote) &&
            (identical(other.preparationNote, preparationNote) ||
                other.preparationNote == preparationNote) &&
            (identical(other.shippedAddressId, shippedAddressId) ||
                other.shippedAddressId == shippedAddressId) &&
            (identical(other.deliveryAreaPrice, deliveryAreaPrice) ||
                other.deliveryAreaPrice == deliveryAreaPrice) &&
            (identical(other.deliveryCostPrice, deliveryCostPrice) ||
                other.deliveryCostPrice == deliveryCostPrice) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.invoiceTax, invoiceTax) ||
                other.invoiceTax == invoiceTax) &&
            (identical(other.invoiceDiscount, invoiceDiscount) ||
                other.invoiceDiscount == invoiceDiscount) &&
            (identical(other.bankID, bankID) || other.bankID == bankID) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.updatedDate, updatedDate) ||
                other.updatedDate == updatedDate) &&
            (identical(other.scheduleDate, scheduleDate) ||
                other.scheduleDate == scheduleDate) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.clientMobile, clientMobile) ||
                other.clientMobile == clientMobile) &&
            (identical(other.clientDefaultAddress, clientDefaultAddress) ||
                other.clientDefaultAddress == clientDefaultAddress) &&
            (identical(other.driverAccept, driverAccept) ||
                other.driverAccept == driverAccept) &&
            (identical(other.driverAcceptDate, driverAcceptDate) ||
                other.driverAcceptDate == driverAcceptDate) &&
            (identical(other.driverReceived, driverReceived) ||
                other.driverReceived == driverReceived) &&
            (identical(other.driverReceivedDate, driverReceivedDate) ||
                other.driverReceivedDate == driverReceivedDate) &&
            (identical(other.chefAccept, chefAccept) ||
                other.chefAccept == chefAccept) &&
            (identical(other.chefAcceptDate, chefAcceptDate) ||
                other.chefAcceptDate == chefAcceptDate) &&
            (identical(other.chefStart, chefStart) ||
                other.chefStart == chefStart) &&
            (identical(other.chefStartDate, chefStartDate) ||
                other.chefStartDate == chefStartDate) &&
            (identical(other.chefFinished, chefFinished) ||
                other.chefFinished == chefFinished) &&
            (identical(other.chefFinishedDate, chefFinishedDate) ||
                other.chefFinishedDate == chefFinishedDate) &&
            (identical(other.clientReceived, clientReceived) ||
                other.clientReceived == clientReceived) &&
            (identical(other.clientReceivedDate, clientReceivedDate) ||
                other.clientReceivedDate == clientReceivedDate) &&
            (identical(other.isPickUp, isPickUp) ||
                other.isPickUp == isPickUp) &&
            const DeepCollectionEquality()
                .equals(other._invoiceDetails, _invoiceDetails) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        chefID,
        driverID,
        employeeNote,
        clientNote,
        preparationNote,
        shippedAddressId,
        deliveryAreaPrice,
        deliveryCostPrice,
        finalPrice,
        totalPrice,
        invoiceTax,
        invoiceDiscount,
        bankID,
        createdDate,
        updatedDate,
        scheduleDate,
        clientName,
        clientMobile,
        clientDefaultAddress,
        driverAccept,
        driverAcceptDate,
        driverReceived,
        driverReceivedDate,
        chefAccept,
        chefAcceptDate,
        chefStart,
        chefStartDate,
        chefFinished,
        chefFinishedDate,
        clientReceived,
        clientReceivedDate,
        isPickUp,
        const DeepCollectionEquality().hash(_invoiceDetails),
        isLoading
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order extends Order {
  const factory _Order(
      {final int? id,
      @JsonKey(name: 'chef_ID') final String? chefID,
      @JsonKey(name: 'driver_ID') final String? driverID,
      final String? employeeNote,
      final String? clientNote,
      final String? preparationNote,
      final String? shippedAddressId,
      final double? deliveryAreaPrice,
      final double? deliveryCostPrice,
      final double? finalPrice,
      final double? totalPrice,
      final double? invoiceTax,
      final double? invoiceDiscount,
      final int? bankID,
      final String? createdDate,
      final String? updatedDate,
      @JsonKey(name: 'schedule_Date') final String? scheduleDate,
      final String? clientName,
      final String? clientMobile,
      final String? clientDefaultAddress,
      @JsonKey(name: 'driver_Accept') final bool? driverAccept,
      @JsonKey(name: 'driver_Accept_Date') final String? driverAcceptDate,
      @JsonKey(name: 'driver_Received') final bool? driverReceived,
      @JsonKey(name: 'driver_Received_Date') final String? driverReceivedDate,
      @JsonKey(name: 'chef_Accept') final bool? chefAccept,
      @JsonKey(name: 'chef_Accept_Date') final String? chefAcceptDate,
      @JsonKey(name: 'chef_Start') final bool? chefStart,
      @JsonKey(name: 'chef_Start_Date') final String? chefStartDate,
      @JsonKey(name: 'chef_Finished') final bool? chefFinished,
      @JsonKey(name: 'chef_Finished_Date') final String? chefFinishedDate,
      @JsonKey(name: 'client_Received') final bool? clientReceived,
      @JsonKey(name: 'client_Received_Date') final String? clientReceivedDate,
      @JsonKey(name: 'is_Pickup') final bool? isPickUp,
      final List<InvoiceDetails>? invoiceDetails,
      final bool isLoading}) = _$OrderImpl;
  const _Order._() : super._();

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'chef_ID')
  String? get chefID;
  @override
  @JsonKey(name: 'driver_ID')
  String? get driverID;
  @override
  String? get employeeNote;
  @override
  String? get clientNote;
  @override
  String? get preparationNote;
  @override
  String? get shippedAddressId;
  @override
  double? get deliveryAreaPrice;
  @override
  double? get deliveryCostPrice;
  @override
  double? get finalPrice;
  @override
  double? get totalPrice;
  @override
  double? get invoiceTax;
  @override
  double? get invoiceDiscount;
  @override
  int? get bankID;
  @override
  String? get createdDate;
  @override
  String? get updatedDate;
  @override
  @JsonKey(name: 'schedule_Date')
  String? get scheduleDate;
  @override
  String? get clientName;
  @override
  String? get clientMobile;
  @override
  String? get clientDefaultAddress;
  @override
  @JsonKey(name: 'driver_Accept')
  bool? get driverAccept;
  @override
  @JsonKey(name: 'driver_Accept_Date')
  String? get driverAcceptDate;
  @override
  @JsonKey(name: 'driver_Received')
  bool? get driverReceived;
  @override
  @JsonKey(name: 'driver_Received_Date')
  String? get driverReceivedDate;
  @override
  @JsonKey(name: 'chef_Accept')
  bool? get chefAccept;
  @override
  @JsonKey(name: 'chef_Accept_Date')
  String? get chefAcceptDate;
  @override
  @JsonKey(name: 'chef_Start')
  bool? get chefStart;
  @override
  @JsonKey(name: 'chef_Start_Date')
  String? get chefStartDate;
  @override
  @JsonKey(name: 'chef_Finished')
  bool? get chefFinished;
  @override
  @JsonKey(name: 'chef_Finished_Date')
  String? get chefFinishedDate;
  @override
  @JsonKey(name: 'client_Received')
  bool? get clientReceived;
  @override
  @JsonKey(name: 'client_Received_Date')
  String? get clientReceivedDate;
  @override
  @JsonKey(name: 'is_Pickup')
  bool? get isPickUp;
  @override
  List<InvoiceDetails>? get invoiceDetails;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceDetails _$InvoiceDetailsFromJson(Map<String, dynamic> json) {
  return _InvoiceDetails.fromJson(json);
}

/// @nodoc
mixin _$InvoiceDetails {
  int? get productVarintId => throw _privateConstructorUsedError;
  double? get quantity => throw _privateConstructorUsedError;
  double? get productVarintPrice => throw _privateConstructorUsedError;
  double? get totalProductVarintFinalPrice =>
      throw _privateConstructorUsedError;
  String? get productVarintName => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  Product? get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceDetailsCopyWith<InvoiceDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDetailsCopyWith<$Res> {
  factory $InvoiceDetailsCopyWith(
          InvoiceDetails value, $Res Function(InvoiceDetails) then) =
      _$InvoiceDetailsCopyWithImpl<$Res, InvoiceDetails>;
  @useResult
  $Res call(
      {int? productVarintId,
      double? quantity,
      double? productVarintPrice,
      double? totalProductVarintFinalPrice,
      String? productVarintName,
      String? image,
      String? note,
      Product? product});

  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$InvoiceDetailsCopyWithImpl<$Res, $Val extends InvoiceDetails>
    implements $InvoiceDetailsCopyWith<$Res> {
  _$InvoiceDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productVarintId = freezed,
    Object? quantity = freezed,
    Object? productVarintPrice = freezed,
    Object? totalProductVarintFinalPrice = freezed,
    Object? productVarintName = freezed,
    Object? image = freezed,
    Object? note = freezed,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      productVarintId: freezed == productVarintId
          ? _value.productVarintId
          : productVarintId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      productVarintPrice: freezed == productVarintPrice
          ? _value.productVarintPrice
          : productVarintPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalProductVarintFinalPrice: freezed == totalProductVarintFinalPrice
          ? _value.totalProductVarintFinalPrice
          : totalProductVarintFinalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      productVarintName: freezed == productVarintName
          ? _value.productVarintName
          : productVarintName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvoiceDetailsImplCopyWith<$Res>
    implements $InvoiceDetailsCopyWith<$Res> {
  factory _$$InvoiceDetailsImplCopyWith(_$InvoiceDetailsImpl value,
          $Res Function(_$InvoiceDetailsImpl) then) =
      __$$InvoiceDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? productVarintId,
      double? quantity,
      double? productVarintPrice,
      double? totalProductVarintFinalPrice,
      String? productVarintName,
      String? image,
      String? note,
      Product? product});

  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$InvoiceDetailsImplCopyWithImpl<$Res>
    extends _$InvoiceDetailsCopyWithImpl<$Res, _$InvoiceDetailsImpl>
    implements _$$InvoiceDetailsImplCopyWith<$Res> {
  __$$InvoiceDetailsImplCopyWithImpl(
      _$InvoiceDetailsImpl _value, $Res Function(_$InvoiceDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productVarintId = freezed,
    Object? quantity = freezed,
    Object? productVarintPrice = freezed,
    Object? totalProductVarintFinalPrice = freezed,
    Object? productVarintName = freezed,
    Object? image = freezed,
    Object? note = freezed,
    Object? product = freezed,
  }) {
    return _then(_$InvoiceDetailsImpl(
      productVarintId: freezed == productVarintId
          ? _value.productVarintId
          : productVarintId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double?,
      productVarintPrice: freezed == productVarintPrice
          ? _value.productVarintPrice
          : productVarintPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalProductVarintFinalPrice: freezed == totalProductVarintFinalPrice
          ? _value.totalProductVarintFinalPrice
          : totalProductVarintFinalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      productVarintName: freezed == productVarintName
          ? _value.productVarintName
          : productVarintName // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceDetailsImpl implements _InvoiceDetails {
  const _$InvoiceDetailsImpl(
      {this.productVarintId,
      this.quantity,
      this.productVarintPrice,
      this.totalProductVarintFinalPrice,
      this.productVarintName,
      this.image,
      this.note,
      this.product});

  factory _$InvoiceDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceDetailsImplFromJson(json);

  @override
  final int? productVarintId;
  @override
  final double? quantity;
  @override
  final double? productVarintPrice;
  @override
  final double? totalProductVarintFinalPrice;
  @override
  final String? productVarintName;
  @override
  final String? image;
  @override
  final String? note;
  @override
  final Product? product;

  @override
  String toString() {
    return 'InvoiceDetails(productVarintId: $productVarintId, quantity: $quantity, productVarintPrice: $productVarintPrice, totalProductVarintFinalPrice: $totalProductVarintFinalPrice, productVarintName: $productVarintName, image: $image, note: $note, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceDetailsImpl &&
            (identical(other.productVarintId, productVarintId) ||
                other.productVarintId == productVarintId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.productVarintPrice, productVarintPrice) ||
                other.productVarintPrice == productVarintPrice) &&
            (identical(other.totalProductVarintFinalPrice,
                    totalProductVarintFinalPrice) ||
                other.totalProductVarintFinalPrice ==
                    totalProductVarintFinalPrice) &&
            (identical(other.productVarintName, productVarintName) ||
                other.productVarintName == productVarintName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productVarintId,
      quantity,
      productVarintPrice,
      totalProductVarintFinalPrice,
      productVarintName,
      image,
      note,
      product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceDetailsImplCopyWith<_$InvoiceDetailsImpl> get copyWith =>
      __$$InvoiceDetailsImplCopyWithImpl<_$InvoiceDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceDetailsImplToJson(
      this,
    );
  }
}

abstract class _InvoiceDetails implements InvoiceDetails {
  const factory _InvoiceDetails(
      {final int? productVarintId,
      final double? quantity,
      final double? productVarintPrice,
      final double? totalProductVarintFinalPrice,
      final String? productVarintName,
      final String? image,
      final String? note,
      final Product? product}) = _$InvoiceDetailsImpl;

  factory _InvoiceDetails.fromJson(Map<String, dynamic> json) =
      _$InvoiceDetailsImpl.fromJson;

  @override
  int? get productVarintId;
  @override
  double? get quantity;
  @override
  double? get productVarintPrice;
  @override
  double? get totalProductVarintFinalPrice;
  @override
  String? get productVarintName;
  @override
  String? get image;
  @override
  String? get note;
  @override
  Product? get product;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceDetailsImplCopyWith<_$InvoiceDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  int? get productID => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  List<Ingredients>? get ingredients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {int? productID, String? productName, List<Ingredients>? ingredients});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = freezed,
    Object? productName = freezed,
    Object? ingredients = freezed,
  }) {
    return _then(_value.copyWith(
      productID: freezed == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: freezed == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredients>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? productID, String? productName, List<Ingredients>? ingredients});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productID = freezed,
    Object? productName = freezed,
    Object? ingredients = freezed,
  }) {
    return _then(_$ProductImpl(
      productID: freezed == productID
          ? _value.productID
          : productID // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      ingredients: freezed == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredients>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {this.productID, this.productName, final List<Ingredients>? ingredients})
      : _ingredients = ingredients;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final int? productID;
  @override
  final String? productName;
  final List<Ingredients>? _ingredients;
  @override
  List<Ingredients>? get ingredients {
    final value = _ingredients;
    if (value == null) return null;
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Product(productID: $productID, productName: $productName, ingredients: $ingredients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.productID, productID) ||
                other.productID == productID) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productID, productName,
      const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {final int? productID,
      final String? productName,
      final List<Ingredients>? ingredients}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  int? get productID;
  @override
  String? get productName;
  @override
  List<Ingredients>? get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Ingredients _$IngredientsFromJson(Map<String, dynamic> json) {
  return _Ingredients.fromJson(json);
}

/// @nodoc
mixin _$Ingredients {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'portion_Grams')
  double? get portionGrams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientsCopyWith<Ingredients> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientsCopyWith<$Res> {
  factory $IngredientsCopyWith(
          Ingredients value, $Res Function(Ingredients) then) =
      _$IngredientsCopyWithImpl<$Res, Ingredients>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      @JsonKey(name: 'portion_Grams') double? portionGrams});
}

/// @nodoc
class _$IngredientsCopyWithImpl<$Res, $Val extends Ingredients>
    implements $IngredientsCopyWith<$Res> {
  _$IngredientsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? portionGrams = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      portionGrams: freezed == portionGrams
          ? _value.portionGrams
          : portionGrams // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientsImplCopyWith<$Res>
    implements $IngredientsCopyWith<$Res> {
  factory _$$IngredientsImplCopyWith(
          _$IngredientsImpl value, $Res Function(_$IngredientsImpl) then) =
      __$$IngredientsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      @JsonKey(name: 'portion_Grams') double? portionGrams});
}

/// @nodoc
class __$$IngredientsImplCopyWithImpl<$Res>
    extends _$IngredientsCopyWithImpl<$Res, _$IngredientsImpl>
    implements _$$IngredientsImplCopyWith<$Res> {
  __$$IngredientsImplCopyWithImpl(
      _$IngredientsImpl _value, $Res Function(_$IngredientsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? portionGrams = freezed,
  }) {
    return _then(_$IngredientsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      portionGrams: freezed == portionGrams
          ? _value.portionGrams
          : portionGrams // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientsImpl implements _Ingredients {
  const _$IngredientsImpl(
      {this.id, this.name, @JsonKey(name: 'portion_Grams') this.portionGrams});

  factory _$IngredientsImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientsImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'portion_Grams')
  final double? portionGrams;

  @override
  String toString() {
    return 'Ingredients(id: $id, name: $name, portionGrams: $portionGrams)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.portionGrams, portionGrams) ||
                other.portionGrams == portionGrams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, portionGrams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientsImplCopyWith<_$IngredientsImpl> get copyWith =>
      __$$IngredientsImplCopyWithImpl<_$IngredientsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientsImplToJson(
      this,
    );
  }
}

abstract class _Ingredients implements Ingredients {
  const factory _Ingredients(
          {final String? id,
          final String? name,
          @JsonKey(name: 'portion_Grams') final double? portionGrams}) =
      _$IngredientsImpl;

  factory _Ingredients.fromJson(Map<String, dynamic> json) =
      _$IngredientsImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'portion_Grams')
  double? get portionGrams;
  @override
  @JsonKey(ignore: true)
  _$$IngredientsImplCopyWith<_$IngredientsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
