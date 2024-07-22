// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calorie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Calorie _$CalorieFromJson(Map<String, dynamic> json) {
  return _Calorie.fromJson(json);
}

/// @nodoc
mixin _$Calorie {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'calories_Value')
  double get caloriesValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CalorieCopyWith<Calorie> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalorieCopyWith<$Res> {
  factory $CalorieCopyWith(Calorie value, $Res Function(Calorie) then) =
      _$CalorieCopyWithImpl<$Res, Calorie>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'calories_Value') double caloriesValue});
}

/// @nodoc
class _$CalorieCopyWithImpl<$Res, $Val extends Calorie>
    implements $CalorieCopyWith<$Res> {
  _$CalorieCopyWithImpl(this._value, this._then);

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
abstract class _$$CalorieImplCopyWith<$Res> implements $CalorieCopyWith<$Res> {
  factory _$$CalorieImplCopyWith(
          _$CalorieImpl value, $Res Function(_$CalorieImpl) then) =
      __$$CalorieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'calories_Value') double caloriesValue});
}

/// @nodoc
class __$$CalorieImplCopyWithImpl<$Res>
    extends _$CalorieCopyWithImpl<$Res, _$CalorieImpl>
    implements _$$CalorieImplCopyWith<$Res> {
  __$$CalorieImplCopyWithImpl(
      _$CalorieImpl _value, $Res Function(_$CalorieImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? caloriesValue = null,
  }) {
    return _then(_$CalorieImpl(
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
class _$CalorieImpl implements _Calorie {
  const _$CalorieImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'calories_Value') this.caloriesValue = 0});

  factory _$CalorieImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalorieImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'calories_Value')
  final double caloriesValue;

  @override
  String toString() {
    return 'Calorie(id: $id, name: $name, caloriesValue: $caloriesValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalorieImpl &&
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
  _$$CalorieImplCopyWith<_$CalorieImpl> get copyWith =>
      __$$CalorieImplCopyWithImpl<_$CalorieImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalorieImplToJson(
      this,
    );
  }
}

abstract class _Calorie implements Calorie {
  const factory _Calorie(
          {required final int id,
          required final String name,
          @JsonKey(name: 'calories_Value') final double caloriesValue}) =
      _$CalorieImpl;

  factory _Calorie.fromJson(Map<String, dynamic> json) = _$CalorieImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'calories_Value')
  double get caloriesValue;
  @override
  @JsonKey(ignore: true)
  _$$CalorieImplCopyWith<_$CalorieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
