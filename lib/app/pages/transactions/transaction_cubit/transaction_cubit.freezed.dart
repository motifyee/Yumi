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
  Pagination<Transaction> get pagination => throw _privateConstructorUsedError;

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
  $Res call({Pagination<Transaction> pagination});

  $PaginationCopyWith<Transaction, $Res> get pagination;
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
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination<Transaction>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<Transaction, $Res> get pagination {
    return $PaginationCopyWith<Transaction, $Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
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
  $Res call({Pagination<Transaction> pagination});

  @override
  $PaginationCopyWith<Transaction, $Res> get pagination;
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
    Object? pagination = null,
  }) {
    return _then(_$TransactionStateImpl(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination<Transaction>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionStateImpl implements _TransactionState {
  const _$TransactionStateImpl({required this.pagination});

  factory _$TransactionStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionStateImplFromJson(json);

  @override
  final Pagination<Transaction> pagination;

  @override
  String toString() {
    return 'TransactionState(pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionStateImpl &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pagination);

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
  const factory _TransactionState(
          {required final Pagination<Transaction> pagination}) =
      _$TransactionStateImpl;

  factory _TransactionState.fromJson(Map<String, dynamic> json) =
      _$TransactionStateImpl.fromJson;

  @override
  Pagination<Transaction> get pagination;
  @override
  @JsonKey(ignore: true)
  _$$TransactionStateImplCopyWith<_$TransactionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
