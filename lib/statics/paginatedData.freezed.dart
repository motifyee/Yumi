// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginatedData.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaginatedData<T> _$PaginatedDataFromJson<T>(Map<String, dynamic> json) {
  return _Pagination<T>.fromJson(json);
}

/// @nodoc
mixin _$PaginatedData<T> {
  @JsonKey(toJson: _pageNumberToJson)
  int get pageNumber => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  int get total => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false)
  bool get isLoading => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<T> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaginatedDataCopyWith<T, PaginatedData<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedDataCopyWith<T, $Res> {
  factory $PaginatedDataCopyWith(
          PaginatedData<T> value, $Res Function(PaginatedData<T>) then) =
      _$PaginatedDataCopyWithImpl<T, $Res, PaginatedData<T>>;
  @useResult
  $Res call(
      {@JsonKey(toJson: _pageNumberToJson) int pageNumber,
      int pageSize,
      @JsonKey(includeFromJson: false) int lastPage,
      @JsonKey(includeFromJson: false) int total,
      @JsonKey(includeFromJson: false) bool isLoading,
      @JsonKey(includeToJson: false, includeFromJson: false) List<T> data});
}

/// @nodoc
class _$PaginatedDataCopyWithImpl<T, $Res, $Val extends PaginatedData<T>>
    implements $PaginatedDataCopyWith<T, $Res> {
  _$PaginatedDataCopyWithImpl(this._value, this._then);

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
    Object? total = null,
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
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
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
abstract class _$$PaginationImplCopyWith<T, $Res>
    implements $PaginatedDataCopyWith<T, $Res> {
  factory _$$PaginationImplCopyWith(
          _$PaginationImpl<T> value, $Res Function(_$PaginationImpl<T>) then) =
      __$$PaginationImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(toJson: _pageNumberToJson) int pageNumber,
      int pageSize,
      @JsonKey(includeFromJson: false) int lastPage,
      @JsonKey(includeFromJson: false) int total,
      @JsonKey(includeFromJson: false) bool isLoading,
      @JsonKey(includeToJson: false, includeFromJson: false) List<T> data});
}

/// @nodoc
class __$$PaginationImplCopyWithImpl<T, $Res>
    extends _$PaginatedDataCopyWithImpl<T, $Res, _$PaginationImpl<T>>
    implements _$$PaginationImplCopyWith<T, $Res> {
  __$$PaginationImplCopyWithImpl(
      _$PaginationImpl<T> _value, $Res Function(_$PaginationImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageNumber = null,
    Object? pageSize = null,
    Object? lastPage = null,
    Object? total = null,
    Object? isLoading = null,
    Object? data = null,
  }) {
    return _then(_$PaginationImpl<T>(
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
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
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
class _$PaginationImpl<T> extends _Pagination<T> {
  const _$PaginationImpl(
      {@JsonKey(toJson: _pageNumberToJson) this.pageNumber = 0,
      this.pageSize = 20,
      @JsonKey(includeFromJson: false) this.lastPage = 1,
      @JsonKey(includeFromJson: false) this.total = 0,
      @JsonKey(includeFromJson: false) this.isLoading = false,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final List<T> data = const []})
      : _data = data,
        super._();

  factory _$PaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationImplFromJson(json);

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
  final int total;
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
    return 'PaginatedData<$T>(pageNumber: $pageNumber, pageSize: $pageSize, lastPage: $lastPage, total: $total, isLoading: $isLoading, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationImpl<T> &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pageNumber, pageSize, lastPage,
      total, isLoading, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationImplCopyWith<T, _$PaginationImpl<T>> get copyWith =>
      __$$PaginationImplCopyWithImpl<T, _$PaginationImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationImplToJson<T>(
      this,
    );
  }
}

abstract class _Pagination<T> extends PaginatedData<T> {
  const factory _Pagination(
      {@JsonKey(toJson: _pageNumberToJson) final int pageNumber,
      final int pageSize,
      @JsonKey(includeFromJson: false) final int lastPage,
      @JsonKey(includeFromJson: false) final int total,
      @JsonKey(includeFromJson: false) final bool isLoading,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final List<T> data}) = _$PaginationImpl<T>;
  const _Pagination._() : super._();

  factory _Pagination.fromJson(Map<String, dynamic> json) =
      _$PaginationImpl<T>.fromJson;

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
  int get total;
  @override
  @JsonKey(includeFromJson: false)
  bool get isLoading;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<T> get data;
  @override
  @JsonKey(ignore: true)
  _$$PaginationImplCopyWith<T, _$PaginationImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
