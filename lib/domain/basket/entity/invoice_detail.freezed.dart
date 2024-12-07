// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvoiceDetail _$InvoiceDetailFromJson(Map<String, dynamic> json) {
  return _InvoiceDetail.fromJson(json);
}

/// @nodoc
mixin _$InvoiceDetail {
  int? get productVarintId => throw _privateConstructorUsedError;
  @StringToDoubleAsIntStringConverter()
  String get quantity => throw _privateConstructorUsedError;
  double get productVarintPrice => throw _privateConstructorUsedError;
  int get discountListId => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  Meal? get meal => throw _privateConstructorUsedError;

  /// Serializes this InvoiceDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceDetailCopyWith<InvoiceDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceDetailCopyWith<$Res> {
  factory $InvoiceDetailCopyWith(
          InvoiceDetail value, $Res Function(InvoiceDetail) then) =
      _$InvoiceDetailCopyWithImpl<$Res, InvoiceDetail>;
  @useResult
  $Res call(
      {int? productVarintId,
      @StringToDoubleAsIntStringConverter() String quantity,
      double productVarintPrice,
      int discountListId,
      String note,
      @JsonKey(includeToJson: false) Meal? meal});

  $MealCopyWith<$Res>? get meal;
}

/// @nodoc
class _$InvoiceDetailCopyWithImpl<$Res, $Val extends InvoiceDetail>
    implements $InvoiceDetailCopyWith<$Res> {
  _$InvoiceDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceDetail
  /// with the given fields replaced by the non-null parameter values.
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
              as Meal?,
    ) as $Val);
  }

  /// Create a copy of InvoiceDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MealCopyWith<$Res>? get meal {
    if (_value.meal == null) {
      return null;
    }

    return $MealCopyWith<$Res>(_value.meal!, (value) {
      return _then(_value.copyWith(meal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvoiceDetailImplCopyWith<$Res>
    implements $InvoiceDetailCopyWith<$Res> {
  factory _$$InvoiceDetailImplCopyWith(
          _$InvoiceDetailImpl value, $Res Function(_$InvoiceDetailImpl) then) =
      __$$InvoiceDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? productVarintId,
      @StringToDoubleAsIntStringConverter() String quantity,
      double productVarintPrice,
      int discountListId,
      String note,
      @JsonKey(includeToJson: false) Meal? meal});

  @override
  $MealCopyWith<$Res>? get meal;
}

/// @nodoc
class __$$InvoiceDetailImplCopyWithImpl<$Res>
    extends _$InvoiceDetailCopyWithImpl<$Res, _$InvoiceDetailImpl>
    implements _$$InvoiceDetailImplCopyWith<$Res> {
  __$$InvoiceDetailImplCopyWithImpl(
      _$InvoiceDetailImpl _value, $Res Function(_$InvoiceDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceDetail
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_$InvoiceDetailImpl(
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
              as Meal?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceDetailImpl implements _InvoiceDetail {
  const _$InvoiceDetailImpl(
      {this.productVarintId,
      @StringToDoubleAsIntStringConverter() this.quantity = "0",
      this.productVarintPrice = 0,
      this.discountListId = 1205,
      this.note = '',
      @JsonKey(includeToJson: false) this.meal});

  factory _$InvoiceDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceDetailImplFromJson(json);

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
  @JsonKey(includeToJson: false)
  final Meal? meal;

  @override
  String toString() {
    return 'InvoiceDetail(productVarintId: $productVarintId, quantity: $quantity, productVarintPrice: $productVarintPrice, discountListId: $discountListId, note: $note, meal: $meal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceDetailImpl &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, productVarintId, quantity,
      productVarintPrice, discountListId, note, meal);

  /// Create a copy of InvoiceDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceDetailImplCopyWith<_$InvoiceDetailImpl> get copyWith =>
      __$$InvoiceDetailImplCopyWithImpl<_$InvoiceDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceDetailImplToJson(
      this,
    );
  }
}

abstract class _InvoiceDetail implements InvoiceDetail {
  const factory _InvoiceDetail(
      {final int? productVarintId,
      @StringToDoubleAsIntStringConverter() final String quantity,
      final double productVarintPrice,
      final int discountListId,
      final String note,
      @JsonKey(includeToJson: false) final Meal? meal}) = _$InvoiceDetailImpl;

  factory _InvoiceDetail.fromJson(Map<String, dynamic> json) =
      _$InvoiceDetailImpl.fromJson;

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
  @JsonKey(includeToJson: false)
  Meal? get meal;

  /// Create a copy of InvoiceDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceDetailImplCopyWith<_$InvoiceDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
