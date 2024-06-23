// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reviews_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReviewsState {
  List<ReviewModel> get reviews => throw _privateConstructorUsedError;
  Pager<dynamic> get pager => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewsStateCopyWith<ReviewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewsStateCopyWith<$Res> {
  factory $ReviewsStateCopyWith(
          ReviewsState value, $Res Function(ReviewsState) then) =
      _$ReviewsStateCopyWithImpl<$Res, ReviewsState>;
  @useResult
  $Res call({List<ReviewModel> reviews, Pager<dynamic> pager});

  $PagerCopyWith<dynamic, $Res> get pager;
}

/// @nodoc
class _$ReviewsStateCopyWithImpl<$Res, $Val extends ReviewsState>
    implements $ReviewsStateCopyWith<$Res> {
  _$ReviewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
    Object? pager = null,
  }) {
    return _then(_value.copyWith(
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>,
      pager: null == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Pager<dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PagerCopyWith<dynamic, $Res> get pager {
    return $PagerCopyWith<dynamic, $Res>(_value.pager, (value) {
      return _then(_value.copyWith(pager: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewsStateImplCopyWith<$Res>
    implements $ReviewsStateCopyWith<$Res> {
  factory _$$ReviewsStateImplCopyWith(
          _$ReviewsStateImpl value, $Res Function(_$ReviewsStateImpl) then) =
      __$$ReviewsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ReviewModel> reviews, Pager<dynamic> pager});

  @override
  $PagerCopyWith<dynamic, $Res> get pager;
}

/// @nodoc
class __$$ReviewsStateImplCopyWithImpl<$Res>
    extends _$ReviewsStateCopyWithImpl<$Res, _$ReviewsStateImpl>
    implements _$$ReviewsStateImplCopyWith<$Res> {
  __$$ReviewsStateImplCopyWithImpl(
      _$ReviewsStateImpl _value, $Res Function(_$ReviewsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
    Object? pager = null,
  }) {
    return _then(_$ReviewsStateImpl(
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>,
      pager: null == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Pager<dynamic>,
    ));
  }
}

/// @nodoc

class _$ReviewsStateImpl implements _ReviewsState {
  const _$ReviewsStateImpl(
      {final List<ReviewModel> reviews = const [],
      this.pager = const Pager(
          pageSize: 20, pageNumber: 0, lastPage: 1, isLoading: false)})
      : _reviews = reviews;

  final List<ReviewModel> _reviews;
  @override
  @JsonKey()
  List<ReviewModel> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  @JsonKey()
  final Pager<dynamic> pager;

  @override
  String toString() {
    return 'ReviewsState(reviews: $reviews, pager: $pager)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewsStateImpl &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.pager, pager) || other.pager == pager));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_reviews), pager);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewsStateImplCopyWith<_$ReviewsStateImpl> get copyWith =>
      __$$ReviewsStateImplCopyWithImpl<_$ReviewsStateImpl>(this, _$identity);
}

abstract class _ReviewsState implements ReviewsState {
  const factory _ReviewsState(
      {final List<ReviewModel> reviews,
      final Pager<dynamic> pager}) = _$ReviewsStateImpl;

  @override
  List<ReviewModel> get reviews;
  @override
  Pager<dynamic> get pager;
  @override
  @JsonKey(ignore: true)
  _$$ReviewsStateImplCopyWith<_$ReviewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
