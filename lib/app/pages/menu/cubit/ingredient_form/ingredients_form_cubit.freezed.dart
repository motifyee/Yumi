// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredients_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IngredientsFormState _$IngredientsFormStateFromJson(Map<String, dynamic> json) {
  return _IngredientsState.fromJson(json);
}

/// @nodoc
mixin _$IngredientsFormState {
  List<Ingredient> get ingredientsModelList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientsFormStateCopyWith<IngredientsFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientsFormStateCopyWith<$Res> {
  factory $IngredientsFormStateCopyWith(IngredientsFormState value,
          $Res Function(IngredientsFormState) then) =
      _$IngredientsFormStateCopyWithImpl<$Res, IngredientsFormState>;
  @useResult
  $Res call({List<Ingredient> ingredientsModelList});
}

/// @nodoc
class _$IngredientsFormStateCopyWithImpl<$Res,
        $Val extends IngredientsFormState>
    implements $IngredientsFormStateCopyWith<$Res> {
  _$IngredientsFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredientsModelList = null,
  }) {
    return _then(_value.copyWith(
      ingredientsModelList: null == ingredientsModelList
          ? _value.ingredientsModelList
          : ingredientsModelList // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientsStateImplCopyWith<$Res>
    implements $IngredientsFormStateCopyWith<$Res> {
  factory _$$IngredientsStateImplCopyWith(_$IngredientsStateImpl value,
          $Res Function(_$IngredientsStateImpl) then) =
      __$$IngredientsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Ingredient> ingredientsModelList});
}

/// @nodoc
class __$$IngredientsStateImplCopyWithImpl<$Res>
    extends _$IngredientsFormStateCopyWithImpl<$Res, _$IngredientsStateImpl>
    implements _$$IngredientsStateImplCopyWith<$Res> {
  __$$IngredientsStateImplCopyWithImpl(_$IngredientsStateImpl _value,
      $Res Function(_$IngredientsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredientsModelList = null,
  }) {
    return _then(_$IngredientsStateImpl(
      ingredientsModelList: null == ingredientsModelList
          ? _value._ingredientsModelList
          : ingredientsModelList // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientsStateImpl implements _IngredientsState {
  const _$IngredientsStateImpl(
      {required final List<Ingredient> ingredientsModelList})
      : _ingredientsModelList = ingredientsModelList;

  factory _$IngredientsStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientsStateImplFromJson(json);

  final List<Ingredient> _ingredientsModelList;
  @override
  List<Ingredient> get ingredientsModelList {
    if (_ingredientsModelList is EqualUnmodifiableListView)
      return _ingredientsModelList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredientsModelList);
  }

  @override
  String toString() {
    return 'IngredientsFormState(ingredientsModelList: $ingredientsModelList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._ingredientsModelList, _ingredientsModelList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_ingredientsModelList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientsStateImplCopyWith<_$IngredientsStateImpl> get copyWith =>
      __$$IngredientsStateImplCopyWithImpl<_$IngredientsStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientsStateImplToJson(
      this,
    );
  }
}

abstract class _IngredientsState implements IngredientsFormState {
  const factory _IngredientsState(
          {required final List<Ingredient> ingredientsModelList}) =
      _$IngredientsStateImpl;

  factory _IngredientsState.fromJson(Map<String, dynamic> json) =
      _$IngredientsStateImpl.fromJson;

  @override
  List<Ingredient> get ingredientsModelList;
  @override
  @JsonKey(ignore: true)
  _$$IngredientsStateImplCopyWith<_$IngredientsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
