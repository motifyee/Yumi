// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState {
  Profile get profile => throw _privateConstructorUsedError;
  Profile get form => throw _privateConstructorUsedError;
  GlobalKey<FormState>? get profileFormKey =>
      throw _privateConstructorUsedError;
  List<Review> get reviews => throw _privateConstructorUsedError;
  EntityStatus get reviewsStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
  @useResult
  $Res call(
      {Profile profile,
      Profile form,
      GlobalKey<FormState>? profileFormKey,
      List<Review> reviews,
      EntityStatus reviewsStatus});

  $ProfileCopyWith<$Res> get profile;
  $ProfileCopyWith<$Res> get form;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? form = null,
    Object? profileFormKey = freezed,
    Object? reviews = null,
    Object? reviewsStatus = null,
  }) {
    return _then(_value.copyWith(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as Profile,
      profileFormKey: freezed == profileFormKey
          ? _value.profileFormKey
          : profileFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      reviewsStatus: null == reviewsStatus
          ? _value.reviewsStatus
          : reviewsStatus // ignore: cast_nullable_to_non_nullable
              as EntityStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get form {
    return $ProfileCopyWith<$Res>(_value.form, (value) {
      return _then(_value.copyWith(form: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileStateImplCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$$ProfileStateImplCopyWith(
          _$ProfileStateImpl value, $Res Function(_$ProfileStateImpl) then) =
      __$$ProfileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Profile profile,
      Profile form,
      GlobalKey<FormState>? profileFormKey,
      List<Review> reviews,
      EntityStatus reviewsStatus});

  @override
  $ProfileCopyWith<$Res> get profile;
  @override
  $ProfileCopyWith<$Res> get form;
}

/// @nodoc
class __$$ProfileStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateImpl>
    implements _$$ProfileStateImplCopyWith<$Res> {
  __$$ProfileStateImplCopyWithImpl(
      _$ProfileStateImpl _value, $Res Function(_$ProfileStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? form = null,
    Object? profileFormKey = freezed,
    Object? reviews = null,
    Object? reviewsStatus = null,
  }) {
    return _then(_$ProfileStateImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      form: null == form
          ? _value.form
          : form // ignore: cast_nullable_to_non_nullable
              as Profile,
      profileFormKey: freezed == profileFormKey
          ? _value.profileFormKey
          : profileFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      reviewsStatus: null == reviewsStatus
          ? _value.reviewsStatus
          : reviewsStatus // ignore: cast_nullable_to_non_nullable
              as EntityStatus,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  const _$ProfileStateImpl(
      {this.profile = const Profile(),
      this.form = const Profile(),
      this.profileFormKey,
      final List<Review> reviews = const [],
      this.reviewsStatus = const EntityStatus(status: Status.idle)})
      : _reviews = reviews;

  @override
  @JsonKey()
  final Profile profile;
  @override
  @JsonKey()
  final Profile form;
  @override
  final GlobalKey<FormState>? profileFormKey;
  final List<Review> _reviews;
  @override
  @JsonKey()
  List<Review> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  @JsonKey()
  final EntityStatus reviewsStatus;

  @override
  String toString() {
    return 'ProfileState(profile: $profile, form: $form, profileFormKey: $profileFormKey, reviews: $reviews, reviewsStatus: $reviewsStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.form, form) || other.form == form) &&
            (identical(other.profileFormKey, profileFormKey) ||
                other.profileFormKey == profileFormKey) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.reviewsStatus, reviewsStatus) ||
                other.reviewsStatus == reviewsStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile, form, profileFormKey,
      const DeepCollectionEquality().hash(_reviews), reviewsStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {final Profile profile,
      final Profile form,
      final GlobalKey<FormState>? profileFormKey,
      final List<Review> reviews,
      final EntityStatus reviewsStatus}) = _$ProfileStateImpl;

  @override
  Profile get profile;
  @override
  Profile get form;
  @override
  GlobalKey<FormState>? get profileFormKey;
  @override
  List<Review> get reviews;
  @override
  EntityStatus get reviewsStatus;
  @override
  @JsonKey(ignore: true)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
