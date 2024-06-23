// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionState _$TransactionStateFromJson(Map<String, dynamic> json) {
  return _TransactionState.fromJson(json);
}

/// @nodoc
mixin _$TransactionState {
  Pager<Transaction> get pager => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionStateCopyWith<TransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStateCopyWith<$Res> {
  factory $TransactionStateCopyWith(
          TransactionState value, $Res Function(TransactionState) then) =
      _$TransactionStateCopyWithImpl<$Res, TransactionState>;
  @useResult
  $Res call({Pager<Transaction> pager});

  $PagerCopyWith<Transaction, $Res> get pager;
}

/// @nodoc
class _$TransactionStateCopyWithImpl<$Res, $Val extends TransactionState>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pager = null,
  }) {
    return _then(_value.copyWith(
      pager: null == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Pager<Transaction>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PagerCopyWith<Transaction, $Res> get pager {
    return $PagerCopyWith<Transaction, $Res>(_value.pager, (value) {
      return _then(_value.copyWith(pager: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionStateImplCopyWith<$Res>
    implements $TransactionStateCopyWith<$Res> {
  factory _$$TransactionStateImplCopyWith(_$TransactionStateImpl value,
          $Res Function(_$TransactionStateImpl) then) =
      __$$TransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Pager<Transaction> pager});

  @override
  $PagerCopyWith<Transaction, $Res> get pager;
}

/// @nodoc
class __$$TransactionStateImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionStateImpl>
    implements _$$TransactionStateImplCopyWith<$Res> {
  __$$TransactionStateImplCopyWithImpl(_$TransactionStateImpl _value,
      $Res Function(_$TransactionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pager = null,
  }) {
    return _then(_$TransactionStateImpl(
      pager: null == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Pager<Transaction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionStateImpl implements _TransactionState {
  const _$TransactionStateImpl({required this.pager});

  factory _$TransactionStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionStateImplFromJson(json);

  @override
  final Pager<Transaction> pager;

  @override
  String toString() {
    return 'TransactionState(pager: $pager)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionStateImpl &&
            (identical(other.pager, pager) || other.pager == pager));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pager);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionStateImplCopyWith<_$TransactionStateImpl> get copyWith =>
      __$$TransactionStateImplCopyWithImpl<_$TransactionStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionStateImplToJson(
      this,
    );
  }
}

abstract class _TransactionState implements TransactionState {
  const factory _TransactionState({required final Pager<Transaction> pager}) =
      _$TransactionStateImpl;

  factory _TransactionState.fromJson(Map<String, dynamic> json) =
      _$TransactionStateImpl.fromJson;

  @override
  Pager<Transaction> get pager;
  @override
  @JsonKey(ignore: true)
  _$$TransactionStateImplCopyWith<_$TransactionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
