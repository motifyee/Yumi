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
  List<InvoiceDetail> get invoiceDetails => throw _privateConstructorUsedError;
  String? get voucherId => throw _privateConstructorUsedError;
  int? get bankId => throw _privateConstructorUsedError;
  int? get shippedAddressId => throw _privateConstructorUsedError;
  bool get isSchedule => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get isPickupOnly => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_Pickup')
  bool get isPickup => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_Delivery')
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
      List<InvoiceDetail> invoiceDetails,
      String? voucherId,
      int? bankId,
      int? shippedAddressId,
      bool isSchedule,
      @JsonKey(includeToJson: false, includeFromJson: false) bool isPickupOnly,
      @JsonKey(name: 'is_Pickup') bool isPickup,
      @JsonKey(name: 'is_Delivery') bool isDelivery,
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
    Object? voucherId = freezed,
    Object? bankId = freezed,
    Object? shippedAddressId = freezed,
    Object? isSchedule = null,
    Object? isPickupOnly = null,
    Object? isPickup = null,
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
              as List<InvoiceDetail>,
      voucherId: freezed == voucherId
          ? _value.voucherId
          : voucherId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isPickupOnly: null == isPickupOnly
          ? _value.isPickupOnly
          : isPickupOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      isPickup: null == isPickup
          ? _value.isPickup
          : isPickup // ignore: cast_nullable_to_non_nullable
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
      List<InvoiceDetail> invoiceDetails,
      String? voucherId,
      int? bankId,
      int? shippedAddressId,
      bool isSchedule,
      @JsonKey(includeToJson: false, includeFromJson: false) bool isPickupOnly,
      @JsonKey(name: 'is_Pickup') bool isPickup,
      @JsonKey(name: 'is_Delivery') bool isDelivery,
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
    Object? voucherId = freezed,
    Object? bankId = freezed,
    Object? shippedAddressId = freezed,
    Object? isSchedule = null,
    Object? isPickupOnly = null,
    Object? isPickup = null,
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
              as List<InvoiceDetail>,
      voucherId: freezed == voucherId
          ? _value.voucherId
          : voucherId // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isPickupOnly: null == isPickupOnly
          ? _value.isPickupOnly
          : isPickupOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      isPickup: null == isPickup
          ? _value.isPickup
          : isPickup // ignore: cast_nullable_to_non_nullable
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
      required final List<InvoiceDetail> invoiceDetails,
      this.voucherId,
      this.bankId,
      this.shippedAddressId,
      this.isSchedule = false,
      @JsonKey(includeToJson: false, includeFromJson: false)
      this.isPickupOnly = false,
      @JsonKey(name: 'is_Pickup') this.isPickup = true,
      @JsonKey(name: 'is_Delivery') this.isDelivery = false,
      @JsonKey(name: 'is_Preorder') this.isPreorder = false,
      this.status = 1})
      : _invoiceDetails = invoiceDetails;

  factory _$BasketImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasketImplFromJson(json);

  @override
  final int? id;
  @override
  final Invoice invoice;
  final List<InvoiceDetail> _invoiceDetails;
  @override
  List<InvoiceDetail> get invoiceDetails {
    if (_invoiceDetails is EqualUnmodifiableListView) return _invoiceDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_invoiceDetails);
  }

  @override
  final String? voucherId;
  @override
  final int? bankId;
  @override
  final int? shippedAddressId;
  @override
  @JsonKey()
  final bool isSchedule;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  final bool isPickupOnly;
  @override
  @JsonKey(name: 'is_Pickup')
  final bool isPickup;
  @override
  @JsonKey(name: 'is_Delivery')
  final bool isDelivery;
  @override
  @JsonKey(name: 'is_Preorder')
  final bool isPreorder;
  @override
  @JsonKey()
  final int? status;

  @override
  String toString() {
    return 'Basket(id: $id, invoice: $invoice, invoiceDetails: $invoiceDetails, voucherId: $voucherId, bankId: $bankId, shippedAddressId: $shippedAddressId, isSchedule: $isSchedule, isPickupOnly: $isPickupOnly, isPickup: $isPickup, isDelivery: $isDelivery, isPreorder: $isPreorder, status: $status)';
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
            (identical(other.voucherId, voucherId) ||
                other.voucherId == voucherId) &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.shippedAddressId, shippedAddressId) ||
                other.shippedAddressId == shippedAddressId) &&
            (identical(other.isSchedule, isSchedule) ||
                other.isSchedule == isSchedule) &&
            (identical(other.isPickupOnly, isPickupOnly) ||
                other.isPickupOnly == isPickupOnly) &&
            (identical(other.isPickup, isPickup) ||
                other.isPickup == isPickup) &&
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
      voucherId,
      bankId,
      shippedAddressId,
      isSchedule,
      isPickupOnly,
      isPickup,
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
      required final List<InvoiceDetail> invoiceDetails,
      final String? voucherId,
      final int? bankId,
      final int? shippedAddressId,
      final bool isSchedule,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final bool isPickupOnly,
      @JsonKey(name: 'is_Pickup') final bool isPickup,
      @JsonKey(name: 'is_Delivery') final bool isDelivery,
      @JsonKey(name: 'is_Preorder') final bool isPreorder,
      final int? status}) = _$BasketImpl;

  factory _Basket.fromJson(Map<String, dynamic> json) = _$BasketImpl.fromJson;

  @override
  int? get id;
  @override
  Invoice get invoice;
  @override
  List<InvoiceDetail> get invoiceDetails;
  @override
  String? get voucherId;
  @override
  int? get bankId;
  @override
  int? get shippedAddressId;
  @override
  bool get isSchedule;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool get isPickupOnly;
  @override
  @JsonKey(name: 'is_Pickup')
  bool get isPickup;
  @override
  @JsonKey(name: 'is_Delivery')
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
