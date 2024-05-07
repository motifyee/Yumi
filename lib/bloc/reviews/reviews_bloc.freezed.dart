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
mixin _$ReviewsEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getAllEvent value) getAll,
    required TResult Function(_updateReviewsEvent value) updateReviews,
    required TResult Function(_resetReviewsEvent value) resetReviews,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getAllEvent value)? getAll,
    TResult? Function(_updateReviewsEvent value)? updateReviews,
    TResult? Function(_resetReviewsEvent value)? resetReviews,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewsEventCopyWith<$Res> {
  factory $ReviewsEventCopyWith(
          ReviewsEvent value, $Res Function(ReviewsEvent) then) =
      _$ReviewsEventCopyWithImpl<$Res, ReviewsEvent>;
}

/// @nodoc
class _$ReviewsEventCopyWithImpl<$Res, $Val extends ReviewsEvent>
    implements $ReviewsEventCopyWith<$Res> {
  _$ReviewsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$getAllEventImplCopyWith<$Res> {
  factory _$$getAllEventImplCopyWith(
          _$getAllEventImpl value, $Res Function(_$getAllEventImpl) then) =
      __$$getAllEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String chefID, bool isMyReviews});
}

/// @nodoc
class __$$getAllEventImplCopyWithImpl<$Res>
    extends _$ReviewsEventCopyWithImpl<$Res, _$getAllEventImpl>
    implements _$$getAllEventImplCopyWith<$Res> {
  __$$getAllEventImplCopyWithImpl(
      _$getAllEventImpl _value, $Res Function(_$getAllEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chefID = null,
    Object? isMyReviews = null,
  }) {
    return _then(_$getAllEventImpl(
      chefID: null == chefID
          ? _value.chefID
          : chefID // ignore: cast_nullable_to_non_nullable
              as String,
      isMyReviews: null == isMyReviews
          ? _value.isMyReviews
          : isMyReviews // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$getAllEventImpl implements _getAllEvent {
  const _$getAllEventImpl({required this.chefID, this.isMyReviews = false});

  @override
  final String chefID;
  @override
  @JsonKey()
  final bool isMyReviews;

  @override
  String toString() {
    return 'ReviewsEvent.getAll(chefID: $chefID, isMyReviews: $isMyReviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$getAllEventImpl &&
            (identical(other.chefID, chefID) || other.chefID == chefID) &&
            (identical(other.isMyReviews, isMyReviews) ||
                other.isMyReviews == isMyReviews));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chefID, isMyReviews);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$getAllEventImplCopyWith<_$getAllEventImpl> get copyWith =>
      __$$getAllEventImplCopyWithImpl<_$getAllEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getAllEvent value) getAll,
    required TResult Function(_updateReviewsEvent value) updateReviews,
    required TResult Function(_resetReviewsEvent value) resetReviews,
  }) {
    return getAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getAllEvent value)? getAll,
    TResult? Function(_updateReviewsEvent value)? updateReviews,
    TResult? Function(_resetReviewsEvent value)? resetReviews,
  }) {
    return getAll?.call(this);
  }
}

abstract class _getAllEvent implements ReviewsEvent {
  const factory _getAllEvent(
      {required final String chefID,
      final bool isMyReviews}) = _$getAllEventImpl;

  String get chefID;
  bool get isMyReviews;
  @JsonKey(ignore: true)
  _$$getAllEventImplCopyWith<_$getAllEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$updateReviewsEventImplCopyWith<$Res> {
  factory _$$updateReviewsEventImplCopyWith(_$updateReviewsEventImpl value,
          $Res Function(_$updateReviewsEventImpl) then) =
      __$$updateReviewsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReviewsState reviewsState});

  $ReviewsStateCopyWith<$Res> get reviewsState;
}

/// @nodoc
class __$$updateReviewsEventImplCopyWithImpl<$Res>
    extends _$ReviewsEventCopyWithImpl<$Res, _$updateReviewsEventImpl>
    implements _$$updateReviewsEventImplCopyWith<$Res> {
  __$$updateReviewsEventImplCopyWithImpl(_$updateReviewsEventImpl _value,
      $Res Function(_$updateReviewsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewsState = null,
  }) {
    return _then(_$updateReviewsEventImpl(
      reviewsState: null == reviewsState
          ? _value.reviewsState
          : reviewsState // ignore: cast_nullable_to_non_nullable
              as ReviewsState,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewsStateCopyWith<$Res> get reviewsState {
    return $ReviewsStateCopyWith<$Res>(_value.reviewsState, (value) {
      return _then(_value.copyWith(reviewsState: value));
    });
  }
}

/// @nodoc

class _$updateReviewsEventImpl implements _updateReviewsEvent {
  const _$updateReviewsEventImpl({required this.reviewsState});

  @override
  final ReviewsState reviewsState;

  @override
  String toString() {
    return 'ReviewsEvent.updateReviews(reviewsState: $reviewsState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$updateReviewsEventImpl &&
            (identical(other.reviewsState, reviewsState) ||
                other.reviewsState == reviewsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reviewsState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$updateReviewsEventImplCopyWith<_$updateReviewsEventImpl> get copyWith =>
      __$$updateReviewsEventImplCopyWithImpl<_$updateReviewsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getAllEvent value) getAll,
    required TResult Function(_updateReviewsEvent value) updateReviews,
    required TResult Function(_resetReviewsEvent value) resetReviews,
  }) {
    return updateReviews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getAllEvent value)? getAll,
    TResult? Function(_updateReviewsEvent value)? updateReviews,
    TResult? Function(_resetReviewsEvent value)? resetReviews,
  }) {
    return updateReviews?.call(this);
  }
}

abstract class _updateReviewsEvent implements ReviewsEvent {
  const factory _updateReviewsEvent(
      {required final ReviewsState reviewsState}) = _$updateReviewsEventImpl;

  ReviewsState get reviewsState;
  @JsonKey(ignore: true)
  _$$updateReviewsEventImplCopyWith<_$updateReviewsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$resetReviewsEventImplCopyWith<$Res> {
  factory _$$resetReviewsEventImplCopyWith(_$resetReviewsEventImpl value,
          $Res Function(_$resetReviewsEventImpl) then) =
      __$$resetReviewsEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$resetReviewsEventImplCopyWithImpl<$Res>
    extends _$ReviewsEventCopyWithImpl<$Res, _$resetReviewsEventImpl>
    implements _$$resetReviewsEventImplCopyWith<$Res> {
  __$$resetReviewsEventImplCopyWithImpl(_$resetReviewsEventImpl _value,
      $Res Function(_$resetReviewsEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$resetReviewsEventImpl implements _resetReviewsEvent {
  const _$resetReviewsEventImpl();

  @override
  String toString() {
    return 'ReviewsEvent.resetReviews()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$resetReviewsEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getAllEvent value) getAll,
    required TResult Function(_updateReviewsEvent value) updateReviews,
    required TResult Function(_resetReviewsEvent value) resetReviews,
  }) {
    return resetReviews(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_getAllEvent value)? getAll,
    TResult? Function(_updateReviewsEvent value)? updateReviews,
    TResult? Function(_resetReviewsEvent value)? resetReviews,
  }) {
    return resetReviews?.call(this);
  }
}

abstract class _resetReviewsEvent implements ReviewsEvent {
  const factory _resetReviewsEvent() = _$resetReviewsEventImpl;
}

/// @nodoc
mixin _$ReviewsState {
  List<ReviewModel> get reviews => throw _privateConstructorUsedError;
  PaginationHelper<dynamic> get paginationHelper =>
      throw _privateConstructorUsedError;

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
  $Res call(
      {List<ReviewModel> reviews, PaginationHelper<dynamic> paginationHelper});

  $PaginationHelperCopyWith<dynamic, $Res> get paginationHelper;
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
    Object? paginationHelper = null,
  }) {
    return _then(_value.copyWith(
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>,
      paginationHelper: null == paginationHelper
          ? _value.paginationHelper
          : paginationHelper // ignore: cast_nullable_to_non_nullable
              as PaginationHelper<dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationHelperCopyWith<dynamic, $Res> get paginationHelper {
    return $PaginationHelperCopyWith<dynamic, $Res>(_value.paginationHelper,
        (value) {
      return _then(_value.copyWith(paginationHelper: value) as $Val);
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
  $Res call(
      {List<ReviewModel> reviews, PaginationHelper<dynamic> paginationHelper});

  @override
  $PaginationHelperCopyWith<dynamic, $Res> get paginationHelper;
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
    Object? paginationHelper = null,
  }) {
    return _then(_$ReviewsStateImpl(
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewModel>,
      paginationHelper: null == paginationHelper
          ? _value.paginationHelper
          : paginationHelper // ignore: cast_nullable_to_non_nullable
              as PaginationHelper<dynamic>,
    ));
  }
}

/// @nodoc

class _$ReviewsStateImpl implements _ReviewsState {
  const _$ReviewsStateImpl(
      {required final List<ReviewModel> reviews,
      required this.paginationHelper})
      : _reviews = reviews;

  final List<ReviewModel> _reviews;
  @override
  List<ReviewModel> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  final PaginationHelper<dynamic> paginationHelper;

  @override
  String toString() {
    return 'ReviewsState(reviews: $reviews, paginationHelper: $paginationHelper)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewsStateImpl &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.paginationHelper, paginationHelper) ||
                other.paginationHelper == paginationHelper));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_reviews), paginationHelper);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewsStateImplCopyWith<_$ReviewsStateImpl> get copyWith =>
      __$$ReviewsStateImplCopyWithImpl<_$ReviewsStateImpl>(this, _$identity);
}

abstract class _ReviewsState implements ReviewsState {
  const factory _ReviewsState(
          {required final List<ReviewModel> reviews,
          required final PaginationHelper<dynamic> paginationHelper}) =
      _$ReviewsStateImpl;

  @override
  List<ReviewModel> get reviews;
  @override
  PaginationHelper<dynamic> get paginationHelper;
  @override
  @JsonKey(ignore: true)
  _$$ReviewsStateImplCopyWith<_$ReviewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
