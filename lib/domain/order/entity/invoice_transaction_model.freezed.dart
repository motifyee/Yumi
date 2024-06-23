// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvoiceTransactionModel _$InvoiceTransactionModelFromJson(
    Map<String, dynamic> json) {
  return _InvoiceTransactionModel.fromJson(json);
}

/// @nodoc
mixin _$InvoiceTransactionModel {
  int? get status => throw _privateConstructorUsedError;
  int? get paymentType => throw _privateConstructorUsedError;
  double? get treasuryAmountPaid => throw _privateConstructorUsedError;
  int? get treasuryId => throw _privateConstructorUsedError;
  int? get transactionType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceTransactionModelCopyWith<InvoiceTransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceTransactionModelCopyWith<$Res> {
  factory $InvoiceTransactionModelCopyWith(InvoiceTransactionModel value,
          $Res Function(InvoiceTransactionModel) then) =
      _$InvoiceTransactionModelCopyWithImpl<$Res, InvoiceTransactionModel>;
  @useResult
  $Res call(
      {int? status,
      int? paymentType,
      double? treasuryAmountPaid,
      int? treasuryId,
      int? transactionType});
}

/// @nodoc
class _$InvoiceTransactionModelCopyWithImpl<$Res,
        $Val extends InvoiceTransactionModel>
    implements $InvoiceTransactionModelCopyWith<$Res> {
  _$InvoiceTransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? paymentType = freezed,
    Object? treasuryAmountPaid = freezed,
    Object? treasuryId = freezed,
    Object? transactionType = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as int?,
      treasuryAmountPaid: freezed == treasuryAmountPaid
          ? _value.treasuryAmountPaid
          : treasuryAmountPaid // ignore: cast_nullable_to_non_nullable
              as double?,
      treasuryId: freezed == treasuryId
          ? _value.treasuryId
          : treasuryId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceTransactionModelImplCopyWith<$Res>
    implements $InvoiceTransactionModelCopyWith<$Res> {
  factory _$$InvoiceTransactionModelImplCopyWith(
          _$InvoiceTransactionModelImpl value,
          $Res Function(_$InvoiceTransactionModelImpl) then) =
      __$$InvoiceTransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? status,
      int? paymentType,
      double? treasuryAmountPaid,
      int? treasuryId,
      int? transactionType});
}

/// @nodoc
class __$$InvoiceTransactionModelImplCopyWithImpl<$Res>
    extends _$InvoiceTransactionModelCopyWithImpl<$Res,
        _$InvoiceTransactionModelImpl>
    implements _$$InvoiceTransactionModelImplCopyWith<$Res> {
  __$$InvoiceTransactionModelImplCopyWithImpl(
      _$InvoiceTransactionModelImpl _value,
      $Res Function(_$InvoiceTransactionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? paymentType = freezed,
    Object? treasuryAmountPaid = freezed,
    Object? treasuryId = freezed,
    Object? transactionType = freezed,
  }) {
    return _then(_$InvoiceTransactionModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as int?,
      treasuryAmountPaid: freezed == treasuryAmountPaid
          ? _value.treasuryAmountPaid
          : treasuryAmountPaid // ignore: cast_nullable_to_non_nullable
              as double?,
      treasuryId: freezed == treasuryId
          ? _value.treasuryId
          : treasuryId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceTransactionModelImpl implements _InvoiceTransactionModel {
  const _$InvoiceTransactionModelImpl(
      {this.status,
      this.paymentType,
      this.treasuryAmountPaid,
      this.treasuryId,
      this.transactionType});

  factory _$InvoiceTransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceTransactionModelImplFromJson(json);

  @override
  final int? status;
  @override
  final int? paymentType;
  @override
  final double? treasuryAmountPaid;
  @override
  final int? treasuryId;
  @override
  final int? transactionType;

  @override
  String toString() {
    return 'InvoiceTransactionModel(status: $status, paymentType: $paymentType, treasuryAmountPaid: $treasuryAmountPaid, treasuryId: $treasuryId, transactionType: $transactionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceTransactionModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.treasuryAmountPaid, treasuryAmountPaid) ||
                other.treasuryAmountPaid == treasuryAmountPaid) &&
            (identical(other.treasuryId, treasuryId) ||
                other.treasuryId == treasuryId) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, paymentType,
      treasuryAmountPaid, treasuryId, transactionType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceTransactionModelImplCopyWith<_$InvoiceTransactionModelImpl>
      get copyWith => __$$InvoiceTransactionModelImplCopyWithImpl<
          _$InvoiceTransactionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceTransactionModelImplToJson(
      this,
    );
  }
}

abstract class _InvoiceTransactionModel implements InvoiceTransactionModel {
  const factory _InvoiceTransactionModel(
      {final int? status,
      final int? paymentType,
      final double? treasuryAmountPaid,
      final int? treasuryId,
      final int? transactionType}) = _$InvoiceTransactionModelImpl;

  factory _InvoiceTransactionModel.fromJson(Map<String, dynamic> json) =
      _$InvoiceTransactionModelImpl.fromJson;

  @override
  int? get status;
  @override
  int? get paymentType;
  @override
  double? get treasuryAmountPaid;
  @override
  int? get treasuryId;
  @override
  int? get transactionType;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceTransactionModelImplCopyWith<_$InvoiceTransactionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
