// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bankinfo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BankInfo _$BankInfoFromJson(Map<String, dynamic> json) {
  return _bankInfo.fromJson(json);
}

/// @nodoc
mixin _$BankInfo {
  String get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_Name')
  String get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_Name')
  String get accountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_Number')
  String get accountNumber => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get iban => throw _privateConstructorUsedError;
  @JsonKey(name: 'swift_Code')
  String get swiftCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_Branch_Address')
  String get branchAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankInfoCopyWith<BankInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankInfoCopyWith<$Res> {
  factory $BankInfoCopyWith(BankInfo value, $Res Function(BankInfo) then) =
      _$BankInfoCopyWithImpl<$Res, BankInfo>;
  @useResult
  $Res call(
      {String id,
      String code,
      @JsonKey(name: 'bank_Name') String bankName,
      @JsonKey(name: 'account_Name') String accountName,
      @JsonKey(name: 'account_Number') String accountNumber,
      String currency,
      String iban,
      @JsonKey(name: 'swift_Code') String swiftCode,
      @JsonKey(name: 'bank_Branch_Address') String branchAddress});
}

/// @nodoc
class _$BankInfoCopyWithImpl<$Res, $Val extends BankInfo>
    implements $BankInfoCopyWith<$Res> {
  _$BankInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? bankName = null,
    Object? accountName = null,
    Object? accountNumber = null,
    Object? currency = null,
    Object? iban = null,
    Object? swiftCode = null,
    Object? branchAddress = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      iban: null == iban
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String,
      swiftCode: null == swiftCode
          ? _value.swiftCode
          : swiftCode // ignore: cast_nullable_to_non_nullable
              as String,
      branchAddress: null == branchAddress
          ? _value.branchAddress
          : branchAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$bankInfoImplCopyWith<$Res>
    implements $BankInfoCopyWith<$Res> {
  factory _$$bankInfoImplCopyWith(
          _$bankInfoImpl value, $Res Function(_$bankInfoImpl) then) =
      __$$bankInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String code,
      @JsonKey(name: 'bank_Name') String bankName,
      @JsonKey(name: 'account_Name') String accountName,
      @JsonKey(name: 'account_Number') String accountNumber,
      String currency,
      String iban,
      @JsonKey(name: 'swift_Code') String swiftCode,
      @JsonKey(name: 'bank_Branch_Address') String branchAddress});
}

/// @nodoc
class __$$bankInfoImplCopyWithImpl<$Res>
    extends _$BankInfoCopyWithImpl<$Res, _$bankInfoImpl>
    implements _$$bankInfoImplCopyWith<$Res> {
  __$$bankInfoImplCopyWithImpl(
      _$bankInfoImpl _value, $Res Function(_$bankInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? bankName = null,
    Object? accountName = null,
    Object? accountNumber = null,
    Object? currency = null,
    Object? iban = null,
    Object? swiftCode = null,
    Object? branchAddress = null,
  }) {
    return _then(_$bankInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountNumber: null == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      iban: null == iban
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String,
      swiftCode: null == swiftCode
          ? _value.swiftCode
          : swiftCode // ignore: cast_nullable_to_non_nullable
              as String,
      branchAddress: null == branchAddress
          ? _value.branchAddress
          : branchAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$bankInfoImpl implements _bankInfo {
  const _$bankInfoImpl(
      {this.id = '',
      this.code = '',
      @JsonKey(name: 'bank_Name') this.bankName = '',
      @JsonKey(name: 'account_Name') this.accountName = '',
      @JsonKey(name: 'account_Number') this.accountNumber = '',
      this.currency = '',
      this.iban = '',
      @JsonKey(name: 'swift_Code') this.swiftCode = '',
      @JsonKey(name: 'bank_Branch_Address') this.branchAddress = ''});

  factory _$bankInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$bankInfoImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey(name: 'bank_Name')
  final String bankName;
  @override
  @JsonKey(name: 'account_Name')
  final String accountName;
  @override
  @JsonKey(name: 'account_Number')
  final String accountNumber;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final String iban;
  @override
  @JsonKey(name: 'swift_Code')
  final String swiftCode;
  @override
  @JsonKey(name: 'bank_Branch_Address')
  final String branchAddress;

  @override
  String toString() {
    return 'BankInfo(id: $id, code: $code, bankName: $bankName, accountName: $accountName, accountNumber: $accountNumber, currency: $currency, iban: $iban, swiftCode: $swiftCode, branchAddress: $branchAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$bankInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.iban, iban) || other.iban == iban) &&
            (identical(other.swiftCode, swiftCode) ||
                other.swiftCode == swiftCode) &&
            (identical(other.branchAddress, branchAddress) ||
                other.branchAddress == branchAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, bankName, accountName,
      accountNumber, currency, iban, swiftCode, branchAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$bankInfoImplCopyWith<_$bankInfoImpl> get copyWith =>
      __$$bankInfoImplCopyWithImpl<_$bankInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$bankInfoImplToJson(
      this,
    );
  }
}

abstract class _bankInfo implements BankInfo {
  const factory _bankInfo(
          {final String id,
          final String code,
          @JsonKey(name: 'bank_Name') final String bankName,
          @JsonKey(name: 'account_Name') final String accountName,
          @JsonKey(name: 'account_Number') final String accountNumber,
          final String currency,
          final String iban,
          @JsonKey(name: 'swift_Code') final String swiftCode,
          @JsonKey(name: 'bank_Branch_Address') final String branchAddress}) =
      _$bankInfoImpl;

  factory _bankInfo.fromJson(Map<String, dynamic> json) =
      _$bankInfoImpl.fromJson;

  @override
  String get id;
  @override
  String get code;
  @override
  @JsonKey(name: 'bank_Name')
  String get bankName;
  @override
  @JsonKey(name: 'account_Name')
  String get accountName;
  @override
  @JsonKey(name: 'account_Number')
  String get accountNumber;
  @override
  String get currency;
  @override
  String get iban;
  @override
  @JsonKey(name: 'swift_Code')
  String get swiftCode;
  @override
  @JsonKey(name: 'bank_Branch_Address')
  String get branchAddress;
  @override
  @JsonKey(ignore: true)
  _$$bankInfoImplCopyWith<_$bankInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
