// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chef_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChefsState {
  List<Chef> get chefs => throw _privateConstructorUsedError;
  Pagination get chefsPagination => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get errorReported => throw _privateConstructorUsedError;
  int get chefsUpdated => throw _privateConstructorUsedError;

  /// Create a copy of ChefsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChefsStateCopyWith<ChefsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChefsStateCopyWith<$Res> {
  factory $ChefsStateCopyWith(
          ChefsState value, $Res Function(ChefsState) then) =
      _$ChefsStateCopyWithImpl<$Res, ChefsState>;
  @useResult
  $Res call(
      {List<Chef> chefs,
      Pagination chefsPagination,
      String error,
      bool errorReported,
      int chefsUpdated});

  $PaginationCopyWith<$Res> get chefsPagination;
}

/// @nodoc
class _$ChefsStateCopyWithImpl<$Res, $Val extends ChefsState>
    implements $ChefsStateCopyWith<$Res> {
  _$ChefsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChefsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chefs = null,
    Object? chefsPagination = null,
    Object? error = null,
    Object? errorReported = null,
    Object? chefsUpdated = null,
  }) {
    return _then(_value.copyWith(
      chefs: null == chefs
          ? _value.chefs
          : chefs // ignore: cast_nullable_to_non_nullable
              as List<Chef>,
      chefsPagination: null == chefsPagination
          ? _value.chefsPagination
          : chefsPagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      errorReported: null == errorReported
          ? _value.errorReported
          : errorReported // ignore: cast_nullable_to_non_nullable
              as bool,
      chefsUpdated: null == chefsUpdated
          ? _value.chefsUpdated
          : chefsUpdated // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of ChefsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res> get chefsPagination {
    return $PaginationCopyWith<$Res>(_value.chefsPagination, (value) {
      return _then(_value.copyWith(chefsPagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChefsStateImplCopyWith<$Res>
    implements $ChefsStateCopyWith<$Res> {
  factory _$$ChefsStateImplCopyWith(
          _$ChefsStateImpl value, $Res Function(_$ChefsStateImpl) then) =
      __$$ChefsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Chef> chefs,
      Pagination chefsPagination,
      String error,
      bool errorReported,
      int chefsUpdated});

  @override
  $PaginationCopyWith<$Res> get chefsPagination;
}

/// @nodoc
class __$$ChefsStateImplCopyWithImpl<$Res>
    extends _$ChefsStateCopyWithImpl<$Res, _$ChefsStateImpl>
    implements _$$ChefsStateImplCopyWith<$Res> {
  __$$ChefsStateImplCopyWithImpl(
      _$ChefsStateImpl _value, $Res Function(_$ChefsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChefsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chefs = null,
    Object? chefsPagination = null,
    Object? error = null,
    Object? errorReported = null,
    Object? chefsUpdated = null,
  }) {
    return _then(_$ChefsStateImpl(
      chefs: null == chefs
          ? _value._chefs
          : chefs // ignore: cast_nullable_to_non_nullable
              as List<Chef>,
      chefsPagination: null == chefsPagination
          ? _value.chefsPagination
          : chefsPagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      errorReported: null == errorReported
          ? _value.errorReported
          : errorReported // ignore: cast_nullable_to_non_nullable
              as bool,
      chefsUpdated: null == chefsUpdated
          ? _value.chefsUpdated
          : chefsUpdated // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChefsStateImpl extends _ChefsState {
  _$ChefsStateImpl(
      {final List<Chef> chefs = const [],
      this.chefsPagination = const Pagination(),
      this.error = '',
      this.errorReported = false,
      this.chefsUpdated = 0})
      : _chefs = chefs,
        super._();

  final List<Chef> _chefs;
  @override
  @JsonKey()
  List<Chef> get chefs {
    if (_chefs is EqualUnmodifiableListView) return _chefs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chefs);
  }

  @override
  @JsonKey()
  final Pagination chefsPagination;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final bool errorReported;
  @override
  @JsonKey()
  final int chefsUpdated;

  @override
  String toString() {
    return 'ChefsState(chefs: $chefs, chefsPagination: $chefsPagination, error: $error, errorReported: $errorReported, chefsUpdated: $chefsUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChefsStateImpl &&
            const DeepCollectionEquality().equals(other._chefs, _chefs) &&
            (identical(other.chefsPagination, chefsPagination) ||
                other.chefsPagination == chefsPagination) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.errorReported, errorReported) ||
                other.errorReported == errorReported) &&
            (identical(other.chefsUpdated, chefsUpdated) ||
                other.chefsUpdated == chefsUpdated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_chefs),
      chefsPagination,
      error,
      errorReported,
      chefsUpdated);

  /// Create a copy of ChefsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChefsStateImplCopyWith<_$ChefsStateImpl> get copyWith =>
      __$$ChefsStateImplCopyWithImpl<_$ChefsStateImpl>(this, _$identity);
}

abstract class _ChefsState extends ChefsState {
  factory _ChefsState(
      {final List<Chef> chefs,
      final Pagination chefsPagination,
      final String error,
      final bool errorReported,
      final int chefsUpdated}) = _$ChefsStateImpl;
  _ChefsState._() : super._();

  @override
  List<Chef> get chefs;
  @override
  Pagination get chefsPagination;
  @override
  String get error;
  @override
  bool get errorReported;
  @override
  int get chefsUpdated;

  /// Create a copy of ChefsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChefsStateImplCopyWith<_$ChefsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
