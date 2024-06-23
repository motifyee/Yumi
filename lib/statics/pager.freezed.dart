// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pager.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pager<T> _$PagerFromJson<T>(Map<String, dynamic> json) {
  return _Pager<T>.fromJson(json);
}

/// @nodoc
mixin _$Pager<T> {
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
  $PagerCopyWith<T, Pager<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagerCopyWith<T, $Res> {
  factory $PagerCopyWith(Pager<T> value, $Res Function(Pager<T>) then) =
      _$PagerCopyWithImpl<T, $Res, Pager<T>>;
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
class _$PagerCopyWithImpl<T, $Res, $Val extends Pager<T>>
    implements $PagerCopyWith<T, $Res> {
  _$PagerCopyWithImpl(this._value, this._then);

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
abstract class _$$PagerImplCopyWith<T, $Res>
    implements $PagerCopyWith<T, $Res> {
  factory _$$PagerImplCopyWith(
          _$PagerImpl<T> value, $Res Function(_$PagerImpl<T>) then) =
      __$$PagerImplCopyWithImpl<T, $Res>;
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
class __$$PagerImplCopyWithImpl<T, $Res>
    extends _$PagerCopyWithImpl<T, $Res, _$PagerImpl<T>>
    implements _$$PagerImplCopyWith<T, $Res> {
  __$$PagerImplCopyWithImpl(
      _$PagerImpl<T> _value, $Res Function(_$PagerImpl<T>) _then)
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
    return _then(_$PagerImpl<T>(
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
class _$PagerImpl<T> extends _Pager<T> {
  const _$PagerImpl(
      {@JsonKey(toJson: _pageNumberToJson) this.pageNumber = 0,
      this.pageSize = 20,
      @JsonKey(includeFromJson: false) this.lastPage = 1,
      @JsonKey(includeFromJson: false) this.total = 0,
      @JsonKey(includeFromJson: false) this.isLoading = false,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final List<T> data = const []})
      : _data = data,
        super._();

  factory _$PagerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PagerImplFromJson(json);

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
    return 'Pager<$T>(pageNumber: $pageNumber, pageSize: $pageSize, lastPage: $lastPage, total: $total, isLoading: $isLoading, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PagerImpl<T> &&
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
  _$$PagerImplCopyWith<T, _$PagerImpl<T>> get copyWith =>
      __$$PagerImplCopyWithImpl<T, _$PagerImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PagerImplToJson<T>(
      this,
    );
  }
}

abstract class _Pager<T> extends Pager<T> {
  const factory _Pager(
      {@JsonKey(toJson: _pageNumberToJson) final int pageNumber,
      final int pageSize,
      @JsonKey(includeFromJson: false) final int lastPage,
      @JsonKey(includeFromJson: false) final int total,
      @JsonKey(includeFromJson: false) final bool isLoading,
      @JsonKey(includeToJson: false, includeFromJson: false)
      final List<T> data}) = _$PagerImpl<T>;
  const _Pager._() : super._();

  factory _Pager.fromJson(Map<String, dynamic> json) = _$PagerImpl<T>.fromJson;

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
  _$$PagerImplCopyWith<T, _$PagerImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
