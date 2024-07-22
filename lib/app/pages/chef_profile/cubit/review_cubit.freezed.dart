// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewState _$ReviewStateFromJson(Map<String, dynamic> json) {
  return _ReviewState.fromJson(json);
}

/// @nodoc
mixin _$ReviewState {
  PaginatedData<Review> get pagination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewStateCopyWith<ReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewStateCopyWith<$Res> {
  factory $ReviewStateCopyWith(
          ReviewState value, $Res Function(ReviewState) then) =
      _$ReviewStateCopyWithImpl<$Res, ReviewState>;
  @useResult
  $Res call({PaginatedData<Review> pagination});

  $PaginatedDataCopyWith<Review, $Res> get pagination;
}

/// @nodoc
class _$ReviewStateCopyWithImpl<$Res, $Val extends ReviewState>
    implements $ReviewStateCopyWith<$Res> {
  _$ReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
  }) {
    return _then(_value.copyWith(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginatedData<Review>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginatedDataCopyWith<Review, $Res> get pagination {
    return $PaginatedDataCopyWith<Review, $Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewStateImplCopyWith<$Res>
    implements $ReviewStateCopyWith<$Res> {
  factory _$$ReviewStateImplCopyWith(
          _$ReviewStateImpl value, $Res Function(_$ReviewStateImpl) then) =
      __$$ReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaginatedData<Review> pagination});

  @override
  $PaginatedDataCopyWith<Review, $Res> get pagination;
}

/// @nodoc
class __$$ReviewStateImplCopyWithImpl<$Res>
    extends _$ReviewStateCopyWithImpl<$Res, _$ReviewStateImpl>
    implements _$$ReviewStateImplCopyWith<$Res> {
  __$$ReviewStateImplCopyWithImpl(
      _$ReviewStateImpl _value, $Res Function(_$ReviewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pagination = null,
  }) {
    return _then(_$ReviewStateImpl(
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as PaginatedData<Review>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewStateImpl implements _ReviewState {
  const _$ReviewStateImpl({required this.pagination});

  factory _$ReviewStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewStateImplFromJson(json);

  @override
  final PaginatedData<Review> pagination;

  @override
  String toString() {
    return 'ReviewState(pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewStateImpl &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pagination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewStateImplCopyWith<_$ReviewStateImpl> get copyWith =>
      __$$ReviewStateImplCopyWithImpl<_$ReviewStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewStateImplToJson(
      this,
    );
  }
}

abstract class _ReviewState implements ReviewState {
  const factory _ReviewState(
      {required final PaginatedData<Review> pagination}) = _$ReviewStateImpl;

  factory _ReviewState.fromJson(Map<String, dynamic> json) =
      _$ReviewStateImpl.fromJson;

  @override
  PaginatedData<Review> get pagination;
  @override
  @JsonKey(ignore: true)
  _$$ReviewStateImplCopyWith<_$ReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
