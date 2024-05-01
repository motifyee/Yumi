// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Basket _$BasketFromJson(Map<String, dynamic> json) {
  return _Basket.fromJson(json);
}

/// @nodoc
mixin _$Basket {
  int? get id => throw _privateConstructorUsedError;
  Invoice get invoice => throw _privateConstructorUsedError;
  List<InvoiceDetails> get invoiceDetails => throw _privateConstructorUsedError;
  int? get bankId => throw _privateConstructorUsedError;
  int? get shippedAddressId => throw _privateConstructorUsedError;
  bool get isSchedule => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_Pickup')
  bool get isPickup => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get isPickupOnly => throw _privateConstructorUsedError;
  bool get isDelivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_Preorder')
  bool get isPreorder => throw _privateConstructorUsedError;
  int? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasketCopyWith<Basket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasketCopyWith<$Res> {
  factory $BasketCopyWith(Basket value, $Res Function(Basket) then) =
      _$BasketCopyWithImpl<$Res, Basket>;
  @useResult
  $Res call(
      {int? id,
      Invoice invoice,
      List<InvoiceDetails> invoiceDetails,
      int? bankId,
      int? shippedAddressId,
      bool isSchedule,
      @JsonKey(name: 'is_Pickup') bool isPickup,
      @JsonKey(includeToJson: false, includeFromJson: false) bool isPickupOnly,
      bool isDelivery,
      @JsonKey(name: 'is_Preorder') bool isPreorder,
      int? status});

  $InvoiceCopyWith<$Res> get invoice;
}

/// @nodoc
class _$BasketCopyWithImpl<$Res, $Val extends Basket>
    implements $BasketCopyWith<$Res> {
  _$BasketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? invoice = null,
    Object? invoiceDetails = null,
    Object? bankId = freezed,
    Object? shippedAddressId = freezed,
    Object? isSchedule = null,
    Object? isPickup = null,
    Object? isPickupOnly = null,
    Object? isDelivery = null,
    Object? isPreorder = null,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as Invoice,
      invoiceDetails: null == invoiceDetails
          ? _value.invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int?,
      shippedAddressId: freezed == shippedAddressId
          ? _value.shippedAddressId
          : shippedAddressId // ignore: cast_nullable_to_non_nullable
              as int?,
      isSchedule: null == isSchedule
          ? _value.isSchedule
          : isSchedule // ignore: cast_nullable_to_non_nullable
              as bool,
      isPickup: null == isPickup
          ? _value.isPickup
          : isPickup // ignore: cast_nullable_to_non_nullable
              as bool,
      isPickupOnly: null == isPickupOnly
          ? _value.isPickupOnly
          : isPickupOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      isDelivery: null == isDelivery
          ? _value.isDelivery
          : isDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      isPreorder: null == isPreorder
          ? _value.isPreorder
          : isPreorder // ignore: cast_nullable_to_non_nullable
              as bool,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InvoiceCopyWith<$Res> get invoice {
    return $InvoiceCopyWith<$Res>(_value.invoice, (value) {
      return _then(_value.copyWith(invoice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BasketImplCopyWith<$Res> implements $BasketCopyWith<$Res> {
  factory _$$BasketImplCopyWith(
          _$BasketImpl value, $Res Function(_$BasketImpl) then) =
      __$$BasketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      Invoice invoice,
      List<InvoiceDetails> invoiceDetails,
      int? bankId,
      int? shippedAddressId,
      bool isSchedule,
      @JsonKey(name: 'is_Pickup') bool isPickup,
      @JsonKey(includeToJson: false, includeFromJson: false) bool isPickupOnly,
      bool isDelivery,
      @JsonKey(name: 'is_Preorder') bool isPreorder,
      int? status});

  @override
  $InvoiceCopyWith<$Res> get invoice;
}

/// @nodoc
class __$$BasketImplCopyWithImpl<$Res>
    extends _$BasketCopyWithImpl<$Res, _$BasketImpl>
    implements _$$BasketImplCopyWith<$Res> {
  __$$BasketImplCopyWithImpl(
      _$BasketImpl _value, $Res Function(_$BasketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? invoice = null,
    Object? invoiceDetails = null,
    Object? bankId = freezed,
    Object? shippedAddressId = freezed,
    Object? isSchedule = null,
    Object? isPickup = null,
    Object? isPickupOnly = null,
    Object? isDelivery = null,
    Object? isPreorder = null,
    Object? status = freezed,
  }) {
    return _then(_$BasketImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      invoice: null == invoice
          ? _value.invoice
          : invoice // ignore: cast_nullable_to_non_nullable
              as Invoice,
      invoiceDetails: null == invoiceDetails
          ? _value._invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as int?,
      shippedAddressId: freezed == shippedAddressId
          ? _value.shippedAddressId
          : shippedAddressId // ignore: cast_nullable_to_non_nullable
              as int?,
      isSchedule: null == isSchedule
          ? _value.isSchedule
          : isSchedule // ignore: cast_nullable_to_non_nullable
              as bool,
      isPickup: null == isPickup
          ? _value.isPickup
          : isPickup // ignore: cast_nullable_to_non_nullable
              as bool,
      isPickupOnly: null == isPickupOnly
          ? _value.isPickupOnly
          : isPickupOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      isDelivery: null == isDelivery
          ? _value.isDelivery
          : isDelivery // ignore: cast_nullable_to_non_nullable
              as bool,
      isPreorder: null == isPreorder
          ? _value.isPreorder
          : isPreorder // ignore: cast_nullable_to_non_nullable
              as bool,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$BasketImpl implements _Basket {
  const _$BasketImpl(
      {this.id,
      required this.invoice,
      required final List<InvoiceDetails> invoiceDetails,
      this.bankId,
      this.shippedAddressId,
      this.isSchedule = false,
      @JsonKey(name: 'is_Pickup') this.isPickup = true,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.isPickupOnly = false,
      this.isDelivery = false,
      @JsonKey(name: 'is_Preorder') this.isPreorder = false,
      this.status = 1})
      : _invoiceDetails = invoiceDetails;

  factory _$BasketImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasketImplFromJson(json);

  @override
  final int? id;
  @override
  final Invoice invoice;
  final List<InvoiceDetails> _invoiceDetails;
  @override
  List<InvoiceDetails> get invoiceDetails {
    if (_invoiceDetails is EqualUnmodifiableListView) return _invoiceDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoiceDetails);
  }

  @override
  final int? bankId;
  @override
  final int? shippedAddressId;
  @override
  @JsonKey()
  final bool isSchedule;
  @override
  @JsonKey(name: 'is_Pickup')
  final bool isPickup;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final bool isPickupOnly;
  @override
  @JsonKey()
  final bool isDelivery;
  @override
  @JsonKey(name: 'is_Preorder')
  final bool isPreorder;
  @override
  @JsonKey()
  final int? status;

  @override
  String toString() {
    return 'Basket(id: $id, invoice: $invoice, invoiceDetails: $invoiceDetails, bankId: $bankId, shippedAddressId: $shippedAddressId, isSchedule: $isSchedule, isPickup: $isPickup, isPickupOnly: $isPickupOnly, isDelivery: $isDelivery, isPreorder: $isPreorder, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasketImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.invoice, invoice) || other.invoice == invoice) &&
            const DeepCollectionEquality()
                .equals(other._invoiceDetails, _invoiceDetails) &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.shippedAddressId, shippedAddressId) ||
                other.shippedAddressId == shippedAddressId) &&
            (identical(other.isSchedule, isSchedule) ||
                other.isSchedule == isSchedule) &&
            (identical(other.isPickup, isPickup) ||
                other.isPickup == isPickup) &&
            (identical(other.isPickupOnly, isPickupOnly) ||
                other.isPickupOnly == isPickupOnly) &&
            (identical(other.isDelivery, isDelivery) ||
                other.isDelivery == isDelivery) &&
            (identical(other.isPreorder, isPreorder) ||
                other.isPreorder == isPreorder) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      invoice,
      const DeepCollectionEquality().hash(_invoiceDetails),
      bankId,
      shippedAddressId,
      isSchedule,
      isPickup,
      isPickupOnly,
      isDelivery,
      isPreorder,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasketImplCopyWith<_$BasketImpl> get copyWith =>
      __$$BasketImplCopyWithImpl<_$BasketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasketImplToJson(
      this,
    );
  }
}

abstract class _Basket implements Basket {
  const factory _Basket(
      {final int? id,
      required final Invoice invoice,
      required final List<InvoiceDetails> invoiceDetails,
      final int? bankId,
      final int? shippedAddressId,
      final bool isSchedule,
      @JsonKey(name: 'is_Pickup') final bool isPickup,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final bool isPickupOnly,
      final bool isDelivery,
      @JsonKey(name: 'is_Preorder') final bool isPreorder,
      final int? status}) = _$BasketImpl;

  factory _Basket.fromJson(Map<String, dynamic> json) = _$BasketImpl.fromJson;

  @override
  int? get id;
  @override
  Invoice get invoice;
  @override
  List<InvoiceDetails> get invoiceDetails;
  @override
  int? get bankId;
  @override
  int? get shippedAddressId;
  @override
  bool get isSchedule;
  @override
  @JsonKey(name: 'is_Pickup')
  bool get isPickup;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get isPickupOnly;
  @override
  bool get isDelivery;
  @override
  @JsonKey(name: 'is_Preorder')
  bool get isPreorder;
  @override
  int? get status;
  @override
  @JsonKey(ignore: true)
  _$$BasketImplCopyWith<_$BasketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return _Invoice.fromJson(json);
}

/// @nodoc
mixin _$Invoice {
  int? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'chef_ID')
  String? get chefID => throw _privateConstructorUsedError;
  String get clientNote => throw _privateConstructorUsedError;
  String get preparationNotes => throw _privateConstructorUsedError;
  String get employeeNote => throw _privateConstructorUsedError;
  double get deliveryCostPrice => throw _privateConstructorUsedError;
  double get deliveryAreaPrice => throw _privateConstructorUsedError;
  double get invoiceDiscount => throw _privateConstructorUsedError;
  double get invoiceTax => throw _privateConstructorUsedError;
  double get finalPrice => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'schedule_Date')
  @DateTimeToIso8601StringConverter()
  DateTime? get scheduleDate => throw _privateConstructorUsedError;
  String? get invoiceCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceCopyWith<Invoice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceCopyWith<$Res> {
  factory $InvoiceCopyWith(Invoice value, $Res Function(Invoice) then) =
      _$InvoiceCopyWithImpl<$Res, Invoice>;
  @useResult
  $Res call(
      {int? createdBy,
      @JsonKey(name: 'chef_ID') String? chefID,
      String clientNote,
      String preparationNotes,
      String employeeNote,
      double deliveryCostPrice,
      double deliveryAreaPrice,
      double invoiceDiscount,
      double invoiceTax,
      double finalPrice,
      double totalPrice,
      @JsonKey(name: 'schedule_Date')
      @DateTimeToIso8601StringConverter()
      DateTime? scheduleDate,
      String? invoiceCode});
}

/// @nodoc
class _$InvoiceCopyWithImpl<$Res, $Val extends Invoice>
    implements $InvoiceCopyWith<$Res> {
  _$InvoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = freezed,
    Object? chefID = freezed,
    Object? clientNote = null,
    Object? preparationNotes = null,
    Object? employeeNote = null,
    Object? deliveryCostPrice = null,
    Object? deliveryAreaPrice = null,
    Object? invoiceDiscount = null,
    Object? invoiceTax = null,
    Object? finalPrice = null,
    Object? totalPrice = null,
    Object? scheduleDate = freezed,
    Object? invoiceCode = freezed,
  }) {
    return _then(_value.copyWith(
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      chefID: freezed == chefID
          ? _value.chefID
          : chefID // ignore: cast_nullable_to_non_nullable
              as String?,
      clientNote: null == clientNote
          ? _value.clientNote
          : clientNote // ignore: cast_nullable_to_non_nullable
              as String,
      preparationNotes: null == preparationNotes
          ? _value.preparationNotes
          : preparationNotes // ignore: cast_nullable_to_non_nullable
              as String,
      employeeNote: null == employeeNote
          ? _value.employeeNote
          : employeeNote // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryCostPrice: null == deliveryCostPrice
          ? _value.deliveryCostPrice
          : deliveryCostPrice // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryAreaPrice: null == deliveryAreaPrice
          ? _value.deliveryAreaPrice
          : deliveryAreaPrice // ignore: cast_nullable_to_non_nullable
              as double,
      invoiceDiscount: null == invoiceDiscount
          ? _value.invoiceDiscount
          : invoiceDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      invoiceTax: null == invoiceTax
          ? _value.invoiceTax
          : invoiceTax // ignore: cast_nullable_to_non_nullable
              as double,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      scheduleDate: freezed == scheduleDate
          ? _value.scheduleDate
          : scheduleDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      invoiceCode: freezed == invoiceCode
          ? _value.invoiceCode
          : invoiceCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceImplCopyWith<$Res> implements $InvoiceCopyWith<$Res> {
  factory _$$InvoiceImplCopyWith(
          _$InvoiceImpl value, $Res Function(_$InvoiceImpl) then) =
      __$$InvoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? createdBy,
      @JsonKey(name: 'chef_ID') String? chefID,
      String clientNote,
      String preparationNotes,
      String employeeNote,
      double deliveryCostPrice,
      double deliveryAreaPrice,
      double invoiceDiscount,
      double invoiceTax,
      double finalPrice,
      double totalPrice,
      @JsonKey(name: 'schedule_Date')
      @DateTimeToIso8601StringConverter()
      DateTime? scheduleDate,
      String? invoiceCode});
}

/// @nodoc
class __$$InvoiceImplCopyWithImpl<$Res>
    extends _$InvoiceCopyWithImpl<$Res, _$InvoiceImpl>
    implements _$$InvoiceImplCopyWith<$Res> {
  __$$InvoiceImplCopyWithImpl(
      _$InvoiceImpl _value, $Res Function(_$InvoiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdBy = freezed,
    Object? chefID = freezed,
    Object? clientNote = null,
    Object? preparationNotes = null,
    Object? employeeNote = null,
    Object? deliveryCostPrice = null,
    Object? deliveryAreaPrice = null,
    Object? invoiceDiscount = null,
    Object? invoiceTax = null,
    Object? finalPrice = null,
    Object? totalPrice = null,
    Object? scheduleDate = freezed,
    Object? invoiceCode = freezed,
  }) {
    return _then(_$InvoiceImpl(
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      chefID: freezed == chefID
          ? _value.chefID
          : chefID // ignore: cast_nullable_to_non_nullable
              as String?,
      clientNote: null == clientNote
          ? _value.clientNote
          : clientNote // ignore: cast_nullable_to_non_nullable
              as String,
      preparationNotes: null == preparationNotes
          ? _value.preparationNotes
          : preparationNotes // ignore: cast_nullable_to_non_nullable
              as String,
      employeeNote: null == employeeNote
          ? _value.employeeNote
          : employeeNote // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryCostPrice: null == deliveryCostPrice
          ? _value.deliveryCostPrice
          : deliveryCostPrice // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryAreaPrice: null == deliveryAreaPrice
          ? _value.deliveryAreaPrice
          : deliveryAreaPrice // ignore: cast_nullable_to_non_nullable
              as double,
      invoiceDiscount: null == invoiceDiscount
          ? _value.invoiceDiscount
          : invoiceDiscount // ignore: cast_nullable_to_non_nullable
              as double,
      invoiceTax: null == invoiceTax
          ? _value.invoiceTax
          : invoiceTax // ignore: cast_nullable_to_non_nullable
              as double,
      finalPrice: null == finalPrice
          ? _value.finalPrice
          : finalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      scheduleDate: freezed == scheduleDate
          ? _value.scheduleDate
          : scheduleDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      invoiceCode: freezed == invoiceCode
          ? _value.invoiceCode
          : invoiceCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceImpl implements _Invoice {
  const _$InvoiceImpl(
      {this.createdBy,
      @JsonKey(name: 'chef_ID') this.chefID,
      this.clientNote = '',
      this.preparationNotes = '',
      this.employeeNote = '',
      this.deliveryCostPrice = 4.5,
      this.deliveryAreaPrice = 4.5,
      this.invoiceDiscount = 0.0,
      this.invoiceTax = 0.0,
      this.finalPrice = 0.0,
      this.totalPrice = 0.0,
      @JsonKey(name: 'schedule_Date')
      @DateTimeToIso8601StringConverter()
      this.scheduleDate,
      this.invoiceCode});

  factory _$InvoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceImplFromJson(json);

  @override
  final int? createdBy;
  @override
  @JsonKey(name: 'chef_ID')
  final String? chefID;
  @override
  @JsonKey()
  final String clientNote;
  @override
  @JsonKey()
  final String preparationNotes;
  @override
  @JsonKey()
  final String employeeNote;
  @override
  @JsonKey()
  final double deliveryCostPrice;
  @override
  @JsonKey()
  final double deliveryAreaPrice;
  @override
  @JsonKey()
  final double invoiceDiscount;
  @override
  @JsonKey()
  final double invoiceTax;
  @override
  @JsonKey()
  final double finalPrice;
  @override
  @JsonKey()
  final double totalPrice;
  @override
  @JsonKey(name: 'schedule_Date')
  @DateTimeToIso8601StringConverter()
  final DateTime? scheduleDate;
  @override
  final String? invoiceCode;

  @override
  String toString() {
    return 'Invoice(createdBy: $createdBy, chefID: $chefID, clientNote: $clientNote, preparationNotes: $preparationNotes, employeeNote: $employeeNote, deliveryCostPrice: $deliveryCostPrice, deliveryAreaPrice: $deliveryAreaPrice, invoiceDiscount: $invoiceDiscount, invoiceTax: $invoiceTax, finalPrice: $finalPrice, totalPrice: $totalPrice, scheduleDate: $scheduleDate, invoiceCode: $invoiceCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceImpl &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.chefID, chefID) || other.chefID == chefID) &&
            (identical(other.clientNote, clientNote) ||
                other.clientNote == clientNote) &&
            (identical(other.preparationNotes, preparationNotes) ||
                other.preparationNotes == preparationNotes) &&
            (identical(other.employeeNote, employeeNote) ||
                other.employeeNote == employeeNote) &&
            (identical(other.deliveryCostPrice, deliveryCostPrice) ||
                other.deliveryCostPrice == deliveryCostPrice) &&
            (identical(other.deliveryAreaPrice, deliveryAreaPrice) ||
                other.deliveryAreaPrice == deliveryAreaPrice) &&
            (identical(other.invoiceDiscount, invoiceDiscount) ||
                other.invoiceDiscount == invoiceDiscount) &&
            (identical(other.invoiceTax, invoiceTax) ||
                other.invoiceTax == invoiceTax) &&
            (identical(other.finalPrice, finalPrice) ||
                other.finalPrice == finalPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.scheduleDate, scheduleDate) ||
                other.scheduleDate == scheduleDate) &&
            (identical(other.invoiceCode, invoiceCode) ||
                other.invoiceCode == invoiceCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdBy,
      chefID,
      clientNote,
      preparationNotes,
      employeeNote,
      deliveryCostPrice,
      deliveryAreaPrice,
      invoiceDiscount,
      invoiceTax,
      finalPrice,
      totalPrice,
      scheduleDate,
      invoiceCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceImplCopyWith<_$InvoiceImpl> get copyWith =>
      __$$InvoiceImplCopyWithImpl<_$InvoiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceImplToJson(
      this,
    );
  }
}

abstract class _Invoice implements Invoice {
  const factory _Invoice(
      {final int? createdBy,
      @JsonKey(name: 'chef_ID') final String? chefID,
      final String clientNote,
      final String preparationNotes,
      final String employeeNote,
      final double deliveryCostPrice,
      final double deliveryAreaPrice,
      final double invoiceDiscount,
      final double invoiceTax,
      final double finalPrice,
      final double totalPrice,
      @JsonKey(name: 'schedule_Date')
      @DateTimeToIso8601StringConverter()
      final DateTime? scheduleDate,
      final String? invoiceCode}) = _$InvoiceImpl;

  factory _Invoice.fromJson(Map<String, dynamic> json) = _$InvoiceImpl.fromJson;

  @override
  int? get createdBy;
  @override
  @JsonKey(name: 'chef_ID')
  String? get chefID;
  @override
  String get clientNote;
  @override
  String get preparationNotes;
  @override
  String get employeeNote;
  @override
  double get deliveryCostPrice;
  @override
  double get deliveryAreaPrice;
  @override
  double get invoiceDiscount;
  @override
  double get invoiceTax;
  @override
  double get finalPrice;
  @override
  double get totalPrice;
  @override
  @JsonKey(name: 'schedule_Date')
  @DateTimeToIso8601StringConverter()
  DateTime? get scheduleDate;
  @override
  String? get invoiceCode;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceImplCopyWith<_$InvoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceDetails _$InvoiceDetailsFromJson(Map<String, dynamic> json) {
  return _InvoiceDetails.fromJson(json);
}

/// @nodoc
mixin _$InvoiceDetails {
  int? get productVarintId => throw _privateConstructorUsedError;
  @StringToDoubleAsIntStringConverter()
  String get quantity => throw _privateConstructorUsedError;
  double get productVarintPrice => throw _privateConstructorUsedError;
  int get discountListId => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  MealModel? get meal => throw _privateConstructorUsedError;

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
      @StringToDoubleAsIntStringConverter() String quantity,
      double productVarintPrice,
      int discountListId,
      String note,
      @JsonKey(includeFromJson: false, includeToJson: false) MealModel? meal});
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
    Object? quantity = null,
    Object? productVarintPrice = null,
    Object? discountListId = null,
    Object? note = null,
    Object? meal = freezed,
  }) {
    return _then(_value.copyWith(
      productVarintId: freezed == productVarintId
          ? _value.productVarintId
          : productVarintId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      productVarintPrice: null == productVarintPrice
          ? _value.productVarintPrice
          : productVarintPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountListId: null == discountListId
          ? _value.discountListId
          : discountListId // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      meal: freezed == meal
          ? _value.meal
          : meal // ignore: cast_nullable_to_non_nullable
              as MealModel?,
    ) as $Val);
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
      @StringToDoubleAsIntStringConverter() String quantity,
      double productVarintPrice,
      int discountListId,
      String note,
      @JsonKey(includeFromJson: false, includeToJson: false) MealModel? meal});
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
    Object? quantity = null,
    Object? productVarintPrice = null,
    Object? discountListId = null,
    Object? note = null,
    Object? meal = freezed,
  }) {
    return _then(_$InvoiceDetailsImpl(
      productVarintId: freezed == productVarintId
          ? _value.productVarintId
          : productVarintId // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      productVarintPrice: null == productVarintPrice
          ? _value.productVarintPrice
          : productVarintPrice // ignore: cast_nullable_to_non_nullable
              as double,
      discountListId: null == discountListId
          ? _value.discountListId
          : discountListId // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      meal: freezed == meal
          ? _value.meal
          : meal // ignore: cast_nullable_to_non_nullable
              as MealModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceDetailsImpl implements _InvoiceDetails {
  const _$InvoiceDetailsImpl(
      {this.productVarintId,
      @StringToDoubleAsIntStringConverter() this.quantity = "0",
      this.productVarintPrice = 0,
      this.discountListId = 1205,
      this.note = '',
      @JsonKey(includeFromJson: false, includeToJson: false) this.meal});

  factory _$InvoiceDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceDetailsImplFromJson(json);

  @override
  final int? productVarintId;
  @override
  @JsonKey()
  @StringToDoubleAsIntStringConverter()
  final String quantity;
  @override
  @JsonKey()
  final double productVarintPrice;
  @override
  @JsonKey()
  final int discountListId;
  @override
  @JsonKey()
  final String note;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final MealModel? meal;

  @override
  String toString() {
    return 'InvoiceDetails(productVarintId: $productVarintId, quantity: $quantity, productVarintPrice: $productVarintPrice, discountListId: $discountListId, note: $note, meal: $meal)';
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
            (identical(other.discountListId, discountListId) ||
                other.discountListId == discountListId) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.meal, meal) || other.meal == meal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productVarintId, quantity,
      productVarintPrice, discountListId, note, meal);

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
      @StringToDoubleAsIntStringConverter() final String quantity,
      final double productVarintPrice,
      final int discountListId,
      final String note,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final MealModel? meal}) = _$InvoiceDetailsImpl;

  factory _InvoiceDetails.fromJson(Map<String, dynamic> json) =
      _$InvoiceDetailsImpl.fromJson;

  @override
  int? get productVarintId;
  @override
  @StringToDoubleAsIntStringConverter()
  String get quantity;
  @override
  double get productVarintPrice;
  @override
  int get discountListId;
  @override
  String get note;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  MealModel? get meal;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceDetailsImplCopyWith<_$InvoiceDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
