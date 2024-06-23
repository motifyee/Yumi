// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chef_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChefsState {
  Pagination<Chef> get chefsPage => throw _privateConstructorUsedError;
  int get chefsUpdated => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChefsStateCopyWith<ChefsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChefsStateCopyWith<$Res> {
  factory $ChefsStateCopyWith(
          ChefsState value, $Res Function(ChefsState) then) =
      _$ChefsStateCopyWithImpl<$Res, ChefsState>;
  @useResult
  $Res call({Pagination<Chef> chefsPage, int chefsUpdated});

  $PaginationCopyWith<Chef, $Res> get chefsPage;
}

/// @nodoc
class _$ChefsStateCopyWithImpl<$Res, $Val extends ChefsState>
    implements $ChefsStateCopyWith<$Res> {
  _$ChefsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chefsPage = null,
    Object? chefsUpdated = null,
  }) {
    return _then(_value.copyWith(
      chefsPage: null == chefsPage
          ? _value.chefsPage
          : chefsPage // ignore: cast_nullable_to_non_nullable
              as Pagination<Chef>,
      chefsUpdated: null == chefsUpdated
          ? _value.chefsUpdated
          : chefsUpdated // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<Chef, $Res> get chefsPage {
    return $PaginationCopyWith<Chef, $Res>(_value.chefsPage, (value) {
      return _then(_value.copyWith(chefsPage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChefsStateImplCopyWith<$Res>
    implements $ChefsStateCopyWith<$Res> {
  factory _$$ChefsStateImplCopyWith(
          _$ChefsStateImpl value, $Res Function(_$ChefsStateImpl) then) =
      __$$ChefsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Pagination<Chef> chefsPage, int chefsUpdated});

  @override
  $PaginationCopyWith<Chef, $Res> get chefsPage;
}

/// @nodoc
class __$$ChefsStateImplCopyWithImpl<$Res>
    extends _$ChefsStateCopyWithImpl<$Res, _$ChefsStateImpl>
    implements _$$ChefsStateImplCopyWith<$Res> {
  __$$ChefsStateImplCopyWithImpl(
      _$ChefsStateImpl _value, $Res Function(_$ChefsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chefsPage = null,
    Object? chefsUpdated = null,
  }) {
    return _then(_$ChefsStateImpl(
      chefsPage: null == chefsPage
          ? _value.chefsPage
          : chefsPage // ignore: cast_nullable_to_non_nullable
              as Pagination<Chef>,
      chefsUpdated: null == chefsUpdated
          ? _value.chefsUpdated
          : chefsUpdated // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChefsStateImpl implements _ChefsState {
  _$ChefsStateImpl(
      {this.chefsPage = const Pagination<Chef>(), this.chefsUpdated = 0});

  @override
  @JsonKey()
  final Pagination<Chef> chefsPage;
  @override
  @JsonKey()
  final int chefsUpdated;

  @override
  String toString() {
    return 'ChefsState(chefsPage: $chefsPage, chefsUpdated: $chefsUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChefsStateImpl &&
            (identical(other.chefsPage, chefsPage) ||
                other.chefsPage == chefsPage) &&
            (identical(other.chefsUpdated, chefsUpdated) ||
                other.chefsUpdated == chefsUpdated));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chefsPage, chefsUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChefsStateImplCopyWith<_$ChefsStateImpl> get copyWith =>
      __$$ChefsStateImplCopyWithImpl<_$ChefsStateImpl>(this, _$identity);
}

abstract class _ChefsState implements ChefsState {
  factory _ChefsState(
      {final Pagination<Chef> chefsPage,
      final int chefsUpdated}) = _$ChefsStateImpl;

  @override
  Pagination<Chef> get chefsPage;
  @override
  int get chefsUpdated;
  @override
  @JsonKey(ignore: true)
  _$$ChefsStateImplCopyWith<_$ChefsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
