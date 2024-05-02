// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_helper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginationHelper<T> _$PaginationHelperFromJson<T>(Map<String, dynamic> json) {
  return _PaginationHelper<T>.fromJson(json);
}

/// @nodoc
mixin _$PaginationHelper<T> {
  @JsonKey(toJson: _pageNumberToJson)
  int get pageNumber => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  bool get isLoading => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<T> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginationHelperCopyWith<T, PaginationHelper<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationHelperCopyWith<T, $Res> {
  factory $PaginationHelperCopyWith(
          PaginationHelper<T> value, $Res Function(PaginationHelper<T>) then) =
      _$PaginationHelperCopyWithImpl<T, $Res, PaginationHelper<T>>;
  @useResult
  $Res call(
      {@JsonKey(toJson: _pageNumberToJson) int pageNumber,
      int pageSize,
      @JsonKey(includeFromJson: false) int lastPage,
      @JsonKey(includeFromJson: false) bool isLoading,
      @JsonKey(includeToJson: false, includeFromJson: false) List<T> data});
}

/// @nodoc
class _$PaginationHelperCopyWithImpl<T, $Res, $Val extends PaginationHelper<T>>
    implements $PaginationHelperCopyWith<T, $Res> {
  _$PaginationHelperCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? pageSize = null,
    Object? lastPage = null,
    Object? isLoading = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationHelperImplCopyWith<T, $Res>
    implements $PaginationHelperCopyWith<T, $Res> {
  factory _$$PaginationHelperImplCopyWith(_$PaginationHelperImpl<T> value,
          $Res Function(_$PaginationHelperImpl<T>) then) =
      __$$PaginationHelperImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(toJson: _pageNumberToJson) int pageNumber,
      int pageSize,
      @JsonKey(includeFromJson: false) int lastPage,
      @JsonKey(includeFromJson: false) bool isLoading,
      @JsonKey(includeToJson: false, includeFromJson: false) List<T> data});
}

/// @nodoc
class __$$PaginationHelperImplCopyWithImpl<T, $Res>
    extends _$PaginationHelperCopyWithImpl<T, $Res, _$PaginationHelperImpl<T>>
    implements _$$PaginationHelperImplCopyWith<T, $Res> {
  __$$PaginationHelperImplCopyWithImpl(_$PaginationHelperImpl<T> _value,
      $Res Function(_$PaginationHelperImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? pageSize = null,
    Object? lastPage = null,
    Object? isLoading = null,
    Object? data = null,
  }) {
    return _then(_$PaginationHelperImpl<T>(
      pageNumber: null == pageNumber
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationHelperImpl<T> extends _PaginationHelper<T> {
  const _$PaginationHelperImpl(
      {@JsonKey(toJson: _pageNumberToJson) this.pageNumber = 0,
      this.pageSize = 20,
      @JsonKey(includeFromJson: false) this.lastPage = 1,
      @JsonKey(includeFromJson: false) this.isLoading = false,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final List<T> data = const []})
      : _data = data,
        super._();

  factory _$PaginationHelperImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationHelperImplFromJson(json);

  @override
  @JsonKey(toJson: _pageNumberToJson)
  final int pageNumber;
  @override
  @JsonKey()
  final int pageSize;
  @override
  @JsonKey(includeFromJson: false)
  final int lastPage;
  @override
  @JsonKey(includeFromJson: false)
  final bool isLoading;
  final List<T> _data;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'PaginationHelper<$T>(pageNumber: $pageNumber, pageSize: $pageSize, lastPage: $lastPage, isLoading: $isLoading, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationHelperImpl<T> &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pageNumber, pageSize, lastPage,
      isLoading, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationHelperImplCopyWith<T, _$PaginationHelperImpl<T>> get copyWith =>
      __$$PaginationHelperImplCopyWithImpl<T, _$PaginationHelperImpl<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationHelperImplToJson<T>(
      this,
    );
  }
}

abstract class _PaginationHelper<T> extends PaginationHelper<T> {
  const factory _PaginationHelper(
      {@JsonKey(toJson: _pageNumberToJson) final int pageNumber,
      final int pageSize,
      @JsonKey(includeFromJson: false) final int lastPage,
      @JsonKey(includeFromJson: false) final bool isLoading,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final List<T> data}) = _$PaginationHelperImpl<T>;
  const _PaginationHelper._() : super._();

  factory _PaginationHelper.fromJson(Map<String, dynamic> json) =
      _$PaginationHelperImpl<T>.fromJson;

  @override
  @JsonKey(toJson: _pageNumberToJson)
  int get pageNumber;
  @override
  int get pageSize;
  @override
  @JsonKey(includeFromJson: false)
  int get lastPage;
  @override
  @JsonKey(includeFromJson: false)
  bool get isLoading;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<T> get data;
  @override
  @JsonKey(ignore: true)
  _$$PaginationHelperImplCopyWith<T, _$PaginationHelperImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
