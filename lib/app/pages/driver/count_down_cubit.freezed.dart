// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'count_down_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CountDownState {
  Unique? get unique => throw _privateConstructorUsedError;
  int? get countDown => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CountDownStateCopyWith<CountDownState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountDownStateCopyWith<$Res> {
  factory $CountDownStateCopyWith(
          CountDownState value, $Res Function(CountDownState) then) =
      _$CountDownStateCopyWithImpl<$Res, CountDownState>;
  @useResult
  $Res call({Unique? unique, int? countDown});
}

/// @nodoc
class _$CountDownStateCopyWithImpl<$Res, $Val extends CountDownState>
    implements $CountDownStateCopyWith<$Res> {
  _$CountDownStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unique = freezed,
    Object? countDown = freezed,
  }) {
    return _then(_value.copyWith(
      unique: freezed == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as Unique?,
      countDown: freezed == countDown
          ? _value.countDown
          : countDown // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CountDownStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Unique? unique, int? countDown});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CountDownStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unique = freezed,
    Object? countDown = freezed,
  }) {
    return _then(_$InitialImpl(
      unique: freezed == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as Unique?,
      countDown: freezed == countDown
          ? _value.countDown
          : countDown // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl({this.unique, this.countDown}) : super._();

  @override
  final Unique? unique;
  @override
  final int? countDown;

  @override
  String toString() {
    return 'CountDownState(unique: $unique, countDown: $countDown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.unique, unique) || other.unique == unique) &&
            (identical(other.countDown, countDown) ||
                other.countDown == countDown));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unique, countDown);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial extends CountDownState {
  const factory _Initial({final Unique? unique, final int? countDown}) =
      _$InitialImpl;
  const _Initial._() : super._();

  @override
  Unique? get unique;
  @override
  int? get countDown;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
