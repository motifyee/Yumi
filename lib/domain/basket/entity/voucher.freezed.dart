// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Voucher _$VoucherFromJson(Map<String, dynamic> json) {
  return _Voucher.fromJson(json);
}

/// @nodoc
mixin _$Voucher {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'voucher_Name')
  String get voucherName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @DateTimeToIso8601StringConverter()
  @JsonKey(name: 'start_Date')
  DateTime get startDate => throw _privateConstructorUsedError;
  @DateTimeToIso8601StringConverter()
  @JsonKey(name: 'end_Date')
  DateTime get endDate => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoucherCopyWith<Voucher> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoucherCopyWith<$Res> {
  factory $VoucherCopyWith(Voucher value, $Res Function(Voucher) then) =
      _$VoucherCopyWithImpl<$Res, Voucher>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'voucher_Name') String voucherName,
      double amount,
      @DateTimeToIso8601StringConverter()
      @JsonKey(name: 'start_Date')
      DateTime startDate,
      @DateTimeToIso8601StringConverter()
      @JsonKey(name: 'end_Date')
      DateTime endDate,
      String status});
}

/// @nodoc
class _$VoucherCopyWithImpl<$Res, $Val extends Voucher>
    implements $VoucherCopyWith<$Res> {
  _$VoucherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? voucherName = null,
    Object? amount = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      voucherName: null == voucherName
          ? _value.voucherName
          : voucherName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoucherImplCopyWith<$Res> implements $VoucherCopyWith<$Res> {
  factory _$$VoucherImplCopyWith(
          _$VoucherImpl value, $Res Function(_$VoucherImpl) then) =
      __$$VoucherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'voucher_Name') String voucherName,
      double amount,
      @DateTimeToIso8601StringConverter()
      @JsonKey(name: 'start_Date')
      DateTime startDate,
      @DateTimeToIso8601StringConverter()
      @JsonKey(name: 'end_Date')
      DateTime endDate,
      String status});
}

/// @nodoc
class __$$VoucherImplCopyWithImpl<$Res>
    extends _$VoucherCopyWithImpl<$Res, _$VoucherImpl>
    implements _$$VoucherImplCopyWith<$Res> {
  __$$VoucherImplCopyWithImpl(
      _$VoucherImpl _value, $Res Function(_$VoucherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? voucherName = null,
    Object? amount = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
  }) {
    return _then(_$VoucherImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      voucherName: null == voucherName
          ? _value.voucherName
          : voucherName // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoucherImpl extends _Voucher {
  const _$VoucherImpl(
      {required this.id,
      @JsonKey(name: 'voucher_Name') required this.voucherName,
      required this.amount,
      @DateTimeToIso8601StringConverter()
      @JsonKey(name: 'start_Date')
      required this.startDate,
      @DateTimeToIso8601StringConverter()
      @JsonKey(name: 'end_Date')
      required this.endDate,
      required this.status})
      : super._();

  factory _$VoucherImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoucherImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'voucher_Name')
  final String voucherName;
  @override
  final double amount;
  @override
  @DateTimeToIso8601StringConverter()
  @JsonKey(name: 'start_Date')
  final DateTime startDate;
  @override
  @DateTimeToIso8601StringConverter()
  @JsonKey(name: 'end_Date')
  final DateTime endDate;
  @override
  final String status;

  @override
  String toString() {
    return 'Voucher(id: $id, voucherName: $voucherName, amount: $amount, startDate: $startDate, endDate: $endDate, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoucherImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.voucherName, voucherName) ||
                other.voucherName == voucherName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, voucherName, amount, startDate, endDate, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoucherImplCopyWith<_$VoucherImpl> get copyWith =>
      __$$VoucherImplCopyWithImpl<_$VoucherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoucherImplToJson(
      this,
    );
  }
}

abstract class _Voucher extends Voucher {
  const factory _Voucher(
      {required final String id,
      @JsonKey(name: 'voucher_Name') required final String voucherName,
      required final double amount,
      @DateTimeToIso8601StringConverter()
      @JsonKey(name: 'start_Date')
      required final DateTime startDate,
      @DateTimeToIso8601StringConverter()
      @JsonKey(name: 'end_Date')
      required final DateTime endDate,
      required final String status}) = _$VoucherImpl;
  const _Voucher._() : super._();

  factory _Voucher.fromJson(Map<String, dynamic> json) = _$VoucherImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'voucher_Name')
  String get voucherName;
  @override
  double get amount;
  @override
  @DateTimeToIso8601StringConverter()
  @JsonKey(name: 'start_Date')
  DateTime get startDate;
  @override
  @DateTimeToIso8601StringConverter()
  @JsonKey(name: 'end_Date')
  DateTime get endDate;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$VoucherImplCopyWith<_$VoucherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
