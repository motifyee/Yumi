// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  int? get guid => throw _privateConstructorUsedError;
  int? get accountId => throw _privateConstructorUsedError;
  String? get accountName => throw _privateConstructorUsedError;
  String? get journalType => throw _privateConstructorUsedError;
  String? get createdDate => throw _privateConstructorUsedError;
  double? get debit => throw _privateConstructorUsedError;
  double? get credit => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous_Balance')
  double? get previousBalance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {int? guid,
      int? accountId,
      String? accountName,
      String? journalType,
      String? createdDate,
      double? debit,
      double? credit,
      @JsonKey(name: 'previous_Balance') double? previousBalance});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guid = freezed,
    Object? accountId = freezed,
    Object? accountName = freezed,
    Object? journalType = freezed,
    Object? createdDate = freezed,
    Object? debit = freezed,
    Object? credit = freezed,
    Object? previousBalance = freezed,
  }) {
    return _then(_value.copyWith(
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      journalType: freezed == journalType
          ? _value.journalType
          : journalType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      debit: freezed == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as double?,
      credit: freezed == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double?,
      previousBalance: freezed == previousBalance
          ? _value.previousBalance
          : previousBalance // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? guid,
      int? accountId,
      String? accountName,
      String? journalType,
      String? createdDate,
      double? debit,
      double? credit,
      @JsonKey(name: 'previous_Balance') double? previousBalance});
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guid = freezed,
    Object? accountId = freezed,
    Object? accountName = freezed,
    Object? journalType = freezed,
    Object? createdDate = freezed,
    Object? debit = freezed,
    Object? credit = freezed,
    Object? previousBalance = freezed,
  }) {
    return _then(_$TransactionImpl(
      guid: freezed == guid
          ? _value.guid
          : guid // ignore: cast_nullable_to_non_nullable
              as int?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      accountName: freezed == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String?,
      journalType: freezed == journalType
          ? _value.journalType
          : journalType // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
      debit: freezed == debit
          ? _value.debit
          : debit // ignore: cast_nullable_to_non_nullable
              as double?,
      credit: freezed == credit
          ? _value.credit
          : credit // ignore: cast_nullable_to_non_nullable
              as double?,
      previousBalance: freezed == previousBalance
          ? _value.previousBalance
          : previousBalance // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl implements _Transaction {
  const _$TransactionImpl(
      {this.guid,
      this.accountId,
      this.accountName,
      this.journalType,
      this.createdDate,
      this.debit,
      this.credit,
      @JsonKey(name: 'previous_Balance') this.previousBalance});

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final int? guid;
  @override
  final int? accountId;
  @override
  final String? accountName;
  @override
  final String? journalType;
  @override
  final String? createdDate;
  @override
  final double? debit;
  @override
  final double? credit;
  @override
  @JsonKey(name: 'previous_Balance')
  final double? previousBalance;

  @override
  String toString() {
    return 'Transaction(guid: $guid, accountId: $accountId, accountName: $accountName, journalType: $journalType, createdDate: $createdDate, debit: $debit, credit: $credit, previousBalance: $previousBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.guid, guid) || other.guid == guid) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.journalType, journalType) ||
                other.journalType == journalType) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.debit, debit) || other.debit == debit) &&
            (identical(other.credit, credit) || other.credit == credit) &&
            (identical(other.previousBalance, previousBalance) ||
                other.previousBalance == previousBalance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, guid, accountId, accountName,
      journalType, createdDate, debit, credit, previousBalance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
          {final int? guid,
          final int? accountId,
          final String? accountName,
          final String? journalType,
          final String? createdDate,
          final double? debit,
          final double? credit,
          @JsonKey(name: 'previous_Balance') final double? previousBalance}) =
      _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  int? get guid;
  @override
  int? get accountId;
  @override
  String? get accountName;
  @override
  String? get journalType;
  @override
  String? get createdDate;
  @override
  double? get debit;
  @override
  double? get credit;
  @override
  @JsonKey(name: 'previous_Balance')
  double? get previousBalance;
  @override
  @JsonKey(ignore: true)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
