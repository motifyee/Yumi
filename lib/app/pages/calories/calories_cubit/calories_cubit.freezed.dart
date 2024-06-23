// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calories_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CaloriesState _$CaloriesStateFromJson(Map<String, dynamic> json) {
  return _CaloriesState.fromJson(json);
}

/// @nodoc
mixin _$CaloriesState {
  Pager<Calories> get pager => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaloriesStateCopyWith<CaloriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaloriesStateCopyWith<$Res> {
  factory $CaloriesStateCopyWith(
          CaloriesState value, $Res Function(CaloriesState) then) =
      _$CaloriesStateCopyWithImpl<$Res, CaloriesState>;
  @useResult
  $Res call({Pager<Calories> pager});

  $PagerCopyWith<Calories, $Res> get pager;
}

/// @nodoc
class _$CaloriesStateCopyWithImpl<$Res, $Val extends CaloriesState>
    implements $CaloriesStateCopyWith<$Res> {
  _$CaloriesStateCopyWithImpl(this._value, this._then);

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
              as Pager<Calories>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PagerCopyWith<Calories, $Res> get pager {
    return $PagerCopyWith<Calories, $Res>(_value.pager, (value) {
      return _then(_value.copyWith(pager: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CaloriesStateImplCopyWith<$Res>
    implements $CaloriesStateCopyWith<$Res> {
  factory _$$CaloriesStateImplCopyWith(
          _$CaloriesStateImpl value, $Res Function(_$CaloriesStateImpl) then) =
      __$$CaloriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Pager<Calories> pager});

  @override
  $PagerCopyWith<Calories, $Res> get pager;
}

/// @nodoc
class __$$CaloriesStateImplCopyWithImpl<$Res>
    extends _$CaloriesStateCopyWithImpl<$Res, _$CaloriesStateImpl>
    implements _$$CaloriesStateImplCopyWith<$Res> {
  __$$CaloriesStateImplCopyWithImpl(
      _$CaloriesStateImpl _value, $Res Function(_$CaloriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pager = null,
  }) {
    return _then(_$CaloriesStateImpl(
      pager: null == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Pager<Calories>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaloriesStateImpl implements _CaloriesState {
  const _$CaloriesStateImpl({required this.pager});

  factory _$CaloriesStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CaloriesStateImplFromJson(json);

  @override
  final Pager<Calories> pager;

  @override
  String toString() {
    return 'CaloriesState(pager: $pager)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaloriesStateImpl &&
            (identical(other.pager, pager) || other.pager == pager));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pager);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CaloriesStateImplCopyWith<_$CaloriesStateImpl> get copyWith =>
      __$$CaloriesStateImplCopyWithImpl<_$CaloriesStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CaloriesStateImplToJson(
      this,
    );
  }
}

abstract class _CaloriesState implements CaloriesState {
  const factory _CaloriesState({required final Pager<Calories> pager}) =
      _$CaloriesStateImpl;

  factory _CaloriesState.fromJson(Map<String, dynamic> json) =
      _$CaloriesStateImpl.fromJson;

  @override
  Pager<Calories> get pager;
  @override
  @JsonKey(ignore: true)
  _$$CaloriesStateImplCopyWith<_$CaloriesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
