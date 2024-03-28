// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  int? get id => throw _privateConstructorUsedError;
  String? get chefID => throw _privateConstructorUsedError;
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
  List<InvoiceDetails>? get invoiceDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {int? id,
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
      List<InvoiceDetails>? invoiceDetails});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chefID = freezed,
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
    Object? invoiceDetails = freezed,
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
      invoiceDetails: freezed == invoiceDetails
          ? _value.invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
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
      List<InvoiceDetails>? invoiceDetails});
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chefID = freezed,
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
    Object? invoiceDetails = freezed,
  }) {
    return _then(_$OrderModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      chefID: freezed == chefID
          ? _value.chefID
          : chefID // ignore: cast_nullable_to_non_nullable
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
      invoiceDetails: freezed == invoiceDetails
          ? _value._invoiceDetails
          : invoiceDetails // ignore: cast_nullable_to_non_nullable
              as List<InvoiceDetails>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  const _$OrderModelImpl(
      {this.id,
      this.chefID,
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
      final List<InvoiceDetails>? invoiceDetails})
      : _invoiceDetails = invoiceDetails;

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? chefID;
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
  final List<InvoiceDetails>? _invoiceDetails;
  @override
  List<InvoiceDetails>? get invoiceDetails {
    final value = _invoiceDetails;
    if (value == null) return null;
    if (_invoiceDetails is EqualUnmodifiableListView) return _invoiceDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OrderModel(id: $id, chefID: $chefID, employeeNote: $employeeNote, clientNote: $clientNote, preparationNote: $preparationNote, shippedAddressId: $shippedAddressId, deliveryAreaPrice: $deliveryAreaPrice, deliveryCostPrice: $deliveryCostPrice, finalPrice: $finalPrice, totalPrice: $totalPrice, invoiceTax: $invoiceTax, invoiceDiscount: $invoiceDiscount, bankID: $bankID, invoiceDetails: $invoiceDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chefID, chefID) || other.chefID == chefID) &&
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
            const DeepCollectionEquality()
                .equals(other._invoiceDetails, _invoiceDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      chefID,
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
      const DeepCollectionEquality().hash(_invoiceDetails));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  const factory _OrderModel(
      {final int? id,
      final String? chefID,
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
      final List<InvoiceDetails>? invoiceDetails}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get chefID;
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
  List<InvoiceDetails>? get invoiceDetails;
  @override
  @JsonKey(ignore: true)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
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
      double? totalProductVarintFinalPrice});
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
      double? quantity,
      double? productVarintPrice,
      double? totalProductVarintFinalPrice});
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
      this.totalProductVarintFinalPrice});

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
  String toString() {
    return 'InvoiceDetails(productVarintId: $productVarintId, quantity: $quantity, productVarintPrice: $productVarintPrice, totalProductVarintFinalPrice: $totalProductVarintFinalPrice)';
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
                    totalProductVarintFinalPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productVarintId, quantity,
      productVarintPrice, totalProductVarintFinalPrice);

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
      final double? totalProductVarintFinalPrice}) = _$InvoiceDetailsImpl;

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
  @JsonKey(ignore: true)
  _$$InvoiceDetailsImplCopyWith<_$InvoiceDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
