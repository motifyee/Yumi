// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoriesState {
  PaginatedData<Category> get categoriesPage =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoriesStateCopyWith<CategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateCopyWith(
          CategoriesState value, $Res Function(CategoriesState) then) =
      _$CategoriesStateCopyWithImpl<$Res, CategoriesState>;
  @useResult
  $Res call({PaginatedData<Category> categoriesPage});

  $PaginatedDataCopyWith<Category, $Res> get categoriesPage;
}

/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res, $Val extends CategoriesState>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoriesPage = null,
  }) {
    return _then(_value.copyWith(
      categoriesPage: null == categoriesPage
          ? _value.categoriesPage
          : categoriesPage // ignore: cast_nullable_to_non_nullable
              as PaginatedData<Category>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginatedDataCopyWith<Category, $Res> get categoriesPage {
    return $PaginatedDataCopyWith<Category, $Res>(_value.categoriesPage,
        (value) {
      return _then(_value.copyWith(categoriesPage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaginatedData<Category> categoriesPage});

  @override
  $PaginatedDataCopyWith<Category, $Res> get categoriesPage;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoriesPage = null,
  }) {
    return _then(_$InitialImpl(
      categoriesPage: null == categoriesPage
          ? _value.categoriesPage
          : categoriesPage // ignore: cast_nullable_to_non_nullable
              as PaginatedData<Category>,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  _$InitialImpl({this.categoriesPage = const PaginatedData()});

  @override
  @JsonKey()
  final PaginatedData<Category> categoriesPage;

  @override
  String toString() {
    return 'CategoriesState(categoriesPage: $categoriesPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.categoriesPage, categoriesPage) ||
                other.categoriesPage == categoriesPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoriesPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements CategoriesState {
  factory _Initial({final PaginatedData<Category> categoriesPage}) =
      _$InitialImpl;

  @override
  PaginatedData<Category> get categoriesPage;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
