// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MealFormState _$MealFormStateFromJson(Map<String, dynamic> json) {
  return _MealFormState.fromJson(json);
}

/// @nodoc
mixin _$MealFormState {
  Meal get mealModel => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MealFormStateCopyWith<MealFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealFormStateCopyWith<$Res> {
  factory $MealFormStateCopyWith(
          MealFormState value, $Res Function(MealFormState) then) =
      _$MealFormStateCopyWithImpl<$Res, MealFormState>;
  @useResult
  $Res call({Meal mealModel, bool isLoading});

  $MealCopyWith<$Res> get mealModel;
}

/// @nodoc
class _$MealFormStateCopyWithImpl<$Res, $Val extends MealFormState>
    implements $MealFormStateCopyWith<$Res> {
  _$MealFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealModel = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      mealModel: null == mealModel
          ? _value.mealModel
          : mealModel // ignore: cast_nullable_to_non_nullable
              as Meal,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MealCopyWith<$Res> get mealModel {
    return $MealCopyWith<$Res>(_value.mealModel, (value) {
      return _then(_value.copyWith(mealModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MealFormStateImplCopyWith<$Res>
    implements $MealFormStateCopyWith<$Res> {
  factory _$$MealFormStateImplCopyWith(
          _$MealFormStateImpl value, $Res Function(_$MealFormStateImpl) then) =
      __$$MealFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Meal mealModel, bool isLoading});

  @override
  $MealCopyWith<$Res> get mealModel;
}

/// @nodoc
class __$$MealFormStateImplCopyWithImpl<$Res>
    extends _$MealFormStateCopyWithImpl<$Res, _$MealFormStateImpl>
    implements _$$MealFormStateImplCopyWith<$Res> {
  __$$MealFormStateImplCopyWithImpl(
      _$MealFormStateImpl _value, $Res Function(_$MealFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealModel = null,
    Object? isLoading = null,
  }) {
    return _then(_$MealFormStateImpl(
      mealModel: null == mealModel
          ? _value.mealModel
          : mealModel // ignore: cast_nullable_to_non_nullable
              as Meal,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealFormStateImpl implements _MealFormState {
  const _$MealFormStateImpl({required this.mealModel, required this.isLoading});

  factory _$MealFormStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealFormStateImplFromJson(json);

  @override
  final Meal mealModel;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'MealFormState(mealModel: $mealModel, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealFormStateImpl &&
            (identical(other.mealModel, mealModel) ||
                other.mealModel == mealModel) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mealModel, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MealFormStateImplCopyWith<_$MealFormStateImpl> get copyWith =>
      __$$MealFormStateImplCopyWithImpl<_$MealFormStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealFormStateImplToJson(
      this,
    );
  }
}

abstract class _MealFormState implements MealFormState {
  const factory _MealFormState(
      {required final Meal mealModel,
      required final bool isLoading}) = _$MealFormStateImpl;

  factory _MealFormState.fromJson(Map<String, dynamic> json) =
      _$MealFormStateImpl.fromJson;

  @override
  Meal get mealModel;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$MealFormStateImplCopyWith<_$MealFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
