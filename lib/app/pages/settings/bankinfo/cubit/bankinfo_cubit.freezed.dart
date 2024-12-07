// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bankinfo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BankInfoState {
  BankInfo get bankInfo => throw _privateConstructorUsedError;
  BankInfo get bankInfoForm => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  /// Create a copy of BankInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankInfoStateCopyWith<BankInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankInfoStateCopyWith<$Res> {
  factory $BankInfoStateCopyWith(
          BankInfoState value, $Res Function(BankInfoState) then) =
      _$BankInfoStateCopyWithImpl<$Res, BankInfoState>;
  @useResult
  $Res call(
      {BankInfo bankInfo, BankInfo bankInfoForm, bool isLoading, String error});

  $BankInfoCopyWith<$Res> get bankInfo;
  $BankInfoCopyWith<$Res> get bankInfoForm;
}

/// @nodoc
class _$BankInfoStateCopyWithImpl<$Res, $Val extends BankInfoState>
    implements $BankInfoStateCopyWith<$Res> {
  _$BankInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankInfo = null,
    Object? bankInfoForm = null,
    Object? isLoading = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      bankInfo: null == bankInfo
          ? _value.bankInfo
          : bankInfo // ignore: cast_nullable_to_non_nullable
              as BankInfo,
      bankInfoForm: null == bankInfoForm
          ? _value.bankInfoForm
          : bankInfoForm // ignore: cast_nullable_to_non_nullable
              as BankInfo,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of BankInfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BankInfoCopyWith<$Res> get bankInfo {
    return $BankInfoCopyWith<$Res>(_value.bankInfo, (value) {
      return _then(_value.copyWith(bankInfo: value) as $Val);
    });
  }

  /// Create a copy of BankInfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BankInfoCopyWith<$Res> get bankInfoForm {
    return $BankInfoCopyWith<$Res>(_value.bankInfoForm, (value) {
      return _then(_value.copyWith(bankInfoForm: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $BankInfoStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BankInfo bankInfo, BankInfo bankInfoForm, bool isLoading, String error});

  @override
  $BankInfoCopyWith<$Res> get bankInfo;
  @override
  $BankInfoCopyWith<$Res> get bankInfoForm;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$BankInfoStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of BankInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankInfo = null,
    Object? bankInfoForm = null,
    Object? isLoading = null,
    Object? error = null,
  }) {
    return _then(_$InitialImpl(
      bankInfo: null == bankInfo
          ? _value.bankInfo
          : bankInfo // ignore: cast_nullable_to_non_nullable
              as BankInfo,
      bankInfoForm: null == bankInfoForm
          ? _value.bankInfoForm
          : bankInfoForm // ignore: cast_nullable_to_non_nullable
              as BankInfo,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.bankInfo = const BankInfo(),
      this.bankInfoForm = const BankInfo(),
      this.isLoading = false,
      this.error = ''});

  @override
  @JsonKey()
  final BankInfo bankInfo;
  @override
  @JsonKey()
  final BankInfo bankInfoForm;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String error;

  @override
  String toString() {
    return 'BankInfoState(bankInfo: $bankInfo, bankInfoForm: $bankInfoForm, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.bankInfo, bankInfo) ||
                other.bankInfo == bankInfo) &&
            (identical(other.bankInfoForm, bankInfoForm) ||
                other.bankInfoForm == bankInfoForm) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, bankInfo, bankInfoForm, isLoading, error);

  /// Create a copy of BankInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements BankInfoState {
  const factory _Initial(
      {final BankInfo bankInfo,
      final BankInfo bankInfoForm,
      final bool isLoading,
      final String error}) = _$InitialImpl;

  @override
  BankInfo get bankInfo;
  @override
  BankInfo get bankInfoForm;
  @override
  bool get isLoading;
  @override
  String get error;

  /// Create a copy of BankInfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
