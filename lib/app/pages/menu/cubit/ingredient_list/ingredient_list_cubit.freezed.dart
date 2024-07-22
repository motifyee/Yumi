// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IngredientListState _$IngredientListStateFromJson(Map<String, dynamic> json) {
  return _IngredientListState.fromJson(json);
}

/// @nodoc
mixin _$IngredientListState {
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientListStateCopyWith<IngredientListState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientListStateCopyWith<$Res> {
  factory $IngredientListStateCopyWith(IngredientListState value, $Res Function(IngredientListState) then) = _$IngredientListStateCopyWithImpl<$Res, IngredientListState>;
  @useResult
  $Res call({List<Ingredient> ingredients, bool loading});
}

/// @nodoc
class _$IngredientListStateCopyWithImpl<$Res, $Val extends IngredientListState> implements $IngredientListStateCopyWith<$Res> {
  _$IngredientListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredients = null,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientListStateImplCopyWith<$Res> implements $IngredientListStateCopyWith<$Res> {
  factory _$$IngredientListStateImplCopyWith(_$IngredientListStateImpl value, $Res Function(_$IngredientListStateImpl) then) = __$$IngredientListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Ingredient> ingredients, bool loading});
}

/// @nodoc
class __$$IngredientListStateImplCopyWithImpl<$Res> extends _$IngredientListStateCopyWithImpl<$Res, _$IngredientListStateImpl> implements _$$IngredientListStateImplCopyWith<$Res> {
  __$$IngredientListStateImplCopyWithImpl(_$IngredientListStateImpl _value, $Res Function(_$IngredientListStateImpl) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredients = null,
    Object? loading = null,
  }) {
    return _then(_$IngredientListStateImpl(
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientListStateImpl implements _IngredientListState {
  const _$IngredientListStateImpl({required final List<Ingredient> ingredients, required this.loading}) : _ingredients = ingredients;

  factory _$IngredientListStateImpl.fromJson(Map<String, dynamic> json) => _$$IngredientListStateImplFromJson(json);

  final List<Ingredient> _ingredients;
  @override
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  final bool loading;

  @override
  String toString() {
    return 'IngredientListState(ingredients: $ingredients, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IngredientListStateImpl && const DeepCollectionEquality().equals(other._ingredients, _ingredients) && (identical(other.loading, loading) || other.loading == loading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(_ingredients), loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientListStateImplCopyWith<_$IngredientListStateImpl> get copyWith => __$$IngredientListStateImplCopyWithImpl<_$IngredientListStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientListStateImplToJson(
      this,
    );
  }
}

abstract class _IngredientListState implements IngredientListState {
  const factory _IngredientListState({required final List<Ingredient> ingredients, required final bool loading}) = _$IngredientListStateImpl;

  factory _IngredientListState.fromJson(Map<String, dynamic> json) = _$IngredientListStateImpl.fromJson;

  @override
  List<Ingredient> get ingredients;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$IngredientListStateImplCopyWith<_$IngredientListStateImpl> get copyWith => throw _privateConstructorUsedError;
}
