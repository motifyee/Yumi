// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredients_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IngredientsState {
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  /// Create a copy of IngredientsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientsStateCopyWith<IngredientsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientsStateCopyWith<$Res> {
  factory $IngredientsStateCopyWith(
          IngredientsState value, $Res Function(IngredientsState) then) =
      _$IngredientsStateCopyWithImpl<$Res, IngredientsState>;
  @useResult
  $Res call({List<Ingredient> ingredients, bool loading});
}

/// @nodoc
class _$IngredientsStateCopyWithImpl<$Res, $Val extends IngredientsState>
    implements $IngredientsStateCopyWith<$Res> {
  _$IngredientsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IngredientsState
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$IngredientsStateImplCopyWith<$Res>
    implements $IngredientsStateCopyWith<$Res> {
  factory _$$IngredientsStateImplCopyWith(_$IngredientsStateImpl value,
          $Res Function(_$IngredientsStateImpl) then) =
      __$$IngredientsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Ingredient> ingredients, bool loading});
}

/// @nodoc
class __$$IngredientsStateImplCopyWithImpl<$Res>
    extends _$IngredientsStateCopyWithImpl<$Res, _$IngredientsStateImpl>
    implements _$$IngredientsStateImplCopyWith<$Res> {
  __$$IngredientsStateImplCopyWithImpl(_$IngredientsStateImpl _value,
      $Res Function(_$IngredientsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of IngredientsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredients = null,
    Object? loading = null,
  }) {
    return _then(_$IngredientsStateImpl(
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

class _$IngredientsStateImpl implements _IngredientsState {
  const _$IngredientsStateImpl(
      {final List<Ingredient> ingredients = const [], this.loading = false})
      : _ingredients = ingredients;

  final List<Ingredient> _ingredients;
  @override
  @JsonKey()
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'IngredientsState(ingredients: $ingredients, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientsStateImpl &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_ingredients), loading);

  /// Create a copy of IngredientsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientsStateImplCopyWith<_$IngredientsStateImpl> get copyWith =>
      __$$IngredientsStateImplCopyWithImpl<_$IngredientsStateImpl>(
          this, _$identity);
}

abstract class _IngredientsState implements IngredientsState {
  const factory _IngredientsState(
      {final List<Ingredient> ingredients,
      final bool loading}) = _$IngredientsStateImpl;

  @override
  List<Ingredient> get ingredients;
  @override
  bool get loading;

  /// Create a copy of IngredientsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientsStateImplCopyWith<_$IngredientsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
