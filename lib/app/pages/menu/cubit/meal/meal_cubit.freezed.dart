// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MealState _$MealStateFromJson(Map<String, dynamic> json) {
  return _MealState.fromJson(json);
}

/// @nodoc
mixin _$MealState {
  Pagination<Meal> get pagination => throw _privateConstructorUsedError;
  int get selectedCategory => throw _privateConstructorUsedError;
  MenuTarget get menuTarget => throw _privateConstructorUsedError;
  int get mealsLength => throw _privateConstructorUsedError;
  int get changesCounter => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MealStateCopyWith<MealState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealStateCopyWith<$Res> {
  factory $MealStateCopyWith(MealState value, $Res Function(MealState) then) =
      _$MealStateCopyWithImpl<$Res, MealState>;
  @useResult
  $Res call(
      {Pagination<Meal> pagination,
      int selectedCategory,
      MenuTarget menuTarget,
      int mealsLength,
      int changesCounter,
      Status status});

  $PaginationCopyWith<Meal, $Res> get pagination;
}

/// @nodoc
class _$MealStateCopyWithImpl<$Res, $Val extends MealState>
    implements $MealStateCopyWith<$Res> {
  _$MealStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
    Object? selectedCategory = null,
    Object? menuTarget = null,
    Object? mealsLength = null,
    Object? changesCounter = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination<Meal>,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as int,
      menuTarget: null == menuTarget
          ? _value.menuTarget
          : menuTarget // ignore: cast_nullable_to_non_nullable
              as MenuTarget,
      mealsLength: null == mealsLength
          ? _value.mealsLength
          : mealsLength // ignore: cast_nullable_to_non_nullable
              as int,
      changesCounter: null == changesCounter
          ? _value.changesCounter
          : changesCounter // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<Meal, $Res> get pagination {
    return $PaginationCopyWith<Meal, $Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MealStateImplCopyWith<$Res>
    implements $MealStateCopyWith<$Res> {
  factory _$$MealStateImplCopyWith(
          _$MealStateImpl value, $Res Function(_$MealStateImpl) then) =
      __$$MealStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Pagination<Meal> pagination,
      int selectedCategory,
      MenuTarget menuTarget,
      int mealsLength,
      int changesCounter,
      Status status});

  @override
  $PaginationCopyWith<Meal, $Res> get pagination;
}

/// @nodoc
class __$$MealStateImplCopyWithImpl<$Res>
    extends _$MealStateCopyWithImpl<$Res, _$MealStateImpl>
    implements _$$MealStateImplCopyWith<$Res> {
  __$$MealStateImplCopyWithImpl(
      _$MealStateImpl _value, $Res Function(_$MealStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
    Object? selectedCategory = null,
    Object? menuTarget = null,
    Object? mealsLength = null,
    Object? changesCounter = null,
    Object? status = null,
  }) {
    return _then(_$MealStateImpl(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination<Meal>,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as int,
      menuTarget: null == menuTarget
          ? _value.menuTarget
          : menuTarget // ignore: cast_nullable_to_non_nullable
              as MenuTarget,
      mealsLength: null == mealsLength
          ? _value.mealsLength
          : mealsLength // ignore: cast_nullable_to_non_nullable
              as int,
      changesCounter: null == changesCounter
          ? _value.changesCounter
          : changesCounter // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealStateImpl implements _MealState {
  const _$MealStateImpl(
      {required this.pagination,
      required this.selectedCategory,
      required this.menuTarget,
      this.mealsLength = 0,
      this.changesCounter = 0,
      this.status = Status.init});

  factory _$MealStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealStateImplFromJson(json);

  @override
  final Pagination<Meal> pagination;
  @override
  final int selectedCategory;
  @override
  final MenuTarget menuTarget;
  @override
  @JsonKey()
  final int mealsLength;
  @override
  @JsonKey()
  final int changesCounter;
  @override
  @JsonKey()
  final Status status;

  @override
  String toString() {
    return 'MealState(pagination: $pagination, selectedCategory: $selectedCategory, menuTarget: $menuTarget, mealsLength: $mealsLength, changesCounter: $changesCounter, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealStateImpl &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.menuTarget, menuTarget) ||
                other.menuTarget == menuTarget) &&
            (identical(other.mealsLength, mealsLength) ||
                other.mealsLength == mealsLength) &&
            (identical(other.changesCounter, changesCounter) ||
                other.changesCounter == changesCounter) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pagination, selectedCategory,
      menuTarget, mealsLength, changesCounter, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MealStateImplCopyWith<_$MealStateImpl> get copyWith =>
      __$$MealStateImplCopyWithImpl<_$MealStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealStateImplToJson(
      this,
    );
  }
}

abstract class _MealState implements MealState {
  const factory _MealState(
      {required final Pagination<Meal> pagination,
      required final int selectedCategory,
      required final MenuTarget menuTarget,
      final int mealsLength,
      final int changesCounter,
      final Status status}) = _$MealStateImpl;

  factory _MealState.fromJson(Map<String, dynamic> json) =
      _$MealStateImpl.fromJson;

  @override
  Pagination<Meal> get pagination;
  @override
  int get selectedCategory;
  @override
  MenuTarget get menuTarget;
  @override
  int get mealsLength;
  @override
  int get changesCounter;
  @override
  Status get status;
  @override
  @JsonKey(ignore: true)
  _$$MealStateImplCopyWith<_$MealStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
