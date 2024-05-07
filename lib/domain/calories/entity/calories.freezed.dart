// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Calories _$CaloriesFromJson(Map<String, dynamic> json) {
  return _Calories.fromJson(json);
}

/// @nodoc
mixin _$Calories {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'calories_Value')
  double get caloriesValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaloriesCopyWith<Calories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaloriesCopyWith<$Res> {
  factory $CaloriesCopyWith(Calories value, $Res Function(Calories) then) =
      _$CaloriesCopyWithImpl<$Res, Calories>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'calories_Value') double caloriesValue});
}

/// @nodoc
class _$CaloriesCopyWithImpl<$Res, $Val extends Calories>
    implements $CaloriesCopyWith<$Res> {
  _$CaloriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? caloriesValue = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      caloriesValue: null == caloriesValue
          ? _value.caloriesValue
          : caloriesValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CaloriesImplCopyWith<$Res>
    implements $CaloriesCopyWith<$Res> {
  factory _$$CaloriesImplCopyWith(
          _$CaloriesImpl value, $Res Function(_$CaloriesImpl) then) =
      __$$CaloriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'calories_Value') double caloriesValue});
}

/// @nodoc
class __$$CaloriesImplCopyWithImpl<$Res>
    extends _$CaloriesCopyWithImpl<$Res, _$CaloriesImpl>
    implements _$$CaloriesImplCopyWith<$Res> {
  __$$CaloriesImplCopyWithImpl(
      _$CaloriesImpl _value, $Res Function(_$CaloriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? caloriesValue = null,
  }) {
    return _then(_$CaloriesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      caloriesValue: null == caloriesValue
          ? _value.caloriesValue
          : caloriesValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaloriesImpl implements _Calories {
  const _$CaloriesImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'calories_Value') this.caloriesValue = 0});

  factory _$CaloriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CaloriesImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'calories_Value')
  final double caloriesValue;

  @override
  String toString() {
    return 'Calories(id: $id, name: $name, caloriesValue: $caloriesValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaloriesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.caloriesValue, caloriesValue) ||
                other.caloriesValue == caloriesValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, caloriesValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CaloriesImplCopyWith<_$CaloriesImpl> get copyWith =>
      __$$CaloriesImplCopyWithImpl<_$CaloriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CaloriesImplToJson(
      this,
    );
  }
}

abstract class _Calories implements Calories {
  const factory _Calories(
          {required final int id,
          required final String name,
          @JsonKey(name: 'calories_Value') final double caloriesValue}) =
      _$CaloriesImpl;

  factory _Calories.fromJson(Map<String, dynamic> json) =
      _$CaloriesImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'calories_Value')
  double get caloriesValue;
  @override
  @JsonKey(ignore: true)
  _$$CaloriesImplCopyWith<_$CaloriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
