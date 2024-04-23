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
  ObseleteStatusEnum get status => throw _privateConstructorUsedError;
  Set<ObseleteStatusEnum> get statusSet =>
      throw _privateConstructorUsedError; //
  Profile get profileForm => throw _privateConstructorUsedError;
  ObseleteStatusEnum get formStatus => throw _privateConstructorUsedError; //
  String? get apiMessage => throw _privateConstructorUsedError; //
  Status<List<Review>> get reviews => throw _privateConstructorUsedError;
  Status<Profile>? get test => throw _privateConstructorUsedError;

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
      ObseleteStatusEnum status,
      Set<ObseleteStatusEnum> statusSet,
      Profile profileForm,
      ObseleteStatusEnum formStatus,
      String? apiMessage,
      Status<List<Review>> reviews,
      Status<Profile>? test});

  $ProfileCopyWith<$Res> get profile;
  $ProfileCopyWith<$Res> get profileForm;
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
    Object? status = null,
    Object? statusSet = null,
    Object? profileForm = null,
    Object? formStatus = null,
    Object? apiMessage = freezed,
    Object? reviews = null,
    Object? test = freezed,
  }) {
    return _then(_value.copyWith(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ObseleteStatusEnum,
      statusSet: null == statusSet
          ? _value.statusSet
          : statusSet // ignore: cast_nullable_to_non_nullable
              as Set<ObseleteStatusEnum>,
      profileForm: null == profileForm
          ? _value.profileForm
          : profileForm // ignore: cast_nullable_to_non_nullable
              as Profile,
      formStatus: null == formStatus
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as ObseleteStatusEnum,
      apiMessage: freezed == apiMessage
          ? _value.apiMessage
          : apiMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as Status<List<Review>>,
      test: freezed == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as Status<Profile>?,
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
  $ProfileCopyWith<$Res> get profileForm {
    return $ProfileCopyWith<$Res>(_value.profileForm, (value) {
      return _then(_value.copyWith(profileForm: value) as $Val);
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
      ObseleteStatusEnum status,
      Set<ObseleteStatusEnum> statusSet,
      Profile profileForm,
      ObseleteStatusEnum formStatus,
      String? apiMessage,
      Status<List<Review>> reviews,
      Status<Profile>? test});

  @override
  $ProfileCopyWith<$Res> get profile;
  @override
  $ProfileCopyWith<$Res> get profileForm;
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
    Object? status = null,
    Object? statusSet = null,
    Object? profileForm = null,
    Object? formStatus = null,
    Object? apiMessage = freezed,
    Object? reviews = null,
    Object? test = freezed,
  }) {
    return _then(_$ProfileStateImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ObseleteStatusEnum,
      statusSet: null == statusSet
          ? _value._statusSet
          : statusSet // ignore: cast_nullable_to_non_nullable
              as Set<ObseleteStatusEnum>,
      profileForm: null == profileForm
          ? _value.profileForm
          : profileForm // ignore: cast_nullable_to_non_nullable
              as Profile,
      formStatus: null == formStatus
          ? _value.formStatus
          : formStatus // ignore: cast_nullable_to_non_nullable
              as ObseleteStatusEnum,
      apiMessage: freezed == apiMessage
          ? _value.apiMessage
          : apiMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as Status<List<Review>>,
      test: freezed == test
          ? _value.test
          : test // ignore: cast_nullable_to_non_nullable
              as Status<Profile>?,
    ));
  }
}

/// @nodoc

class _$ProfileStateImpl implements _ProfileState {
  const _$ProfileStateImpl(
      {this.profile = const Profile(),
      this.status = ObseleteStatusEnum.init,
      final Set<ObseleteStatusEnum> statusSet = const {},
      this.profileForm = const Profile(),
      this.formStatus = ObseleteStatusEnum.init,
      this.apiMessage,
      this.reviews = const Status<List<Review>>(),
      this.test})
      : _statusSet = statusSet;

  @override
  @JsonKey()
  final Profile profile;
  @override
  @JsonKey()
  final ObseleteStatusEnum status;
  final Set<ObseleteStatusEnum> _statusSet;
  @override
  @JsonKey()
  Set<ObseleteStatusEnum> get statusSet {
    if (_statusSet is EqualUnmodifiableSetView) return _statusSet;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_statusSet);
  }

//
  @override
  @JsonKey()
  final Profile profileForm;
  @override
  @JsonKey()
  final ObseleteStatusEnum formStatus;
//
  @override
  final String? apiMessage;
//
  @override
  @JsonKey()
  final Status<List<Review>> reviews;
  @override
  final Status<Profile>? test;

  @override
  String toString() {
    return 'ProfileState(profile: $profile, status: $status, statusSet: $statusSet, profileForm: $profileForm, formStatus: $formStatus, apiMessage: $apiMessage, reviews: $reviews, test: $test)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateImpl &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._statusSet, _statusSet) &&
            (identical(other.profileForm, profileForm) ||
                other.profileForm == profileForm) &&
            (identical(other.formStatus, formStatus) ||
                other.formStatus == formStatus) &&
            (identical(other.apiMessage, apiMessage) ||
                other.apiMessage == apiMessage) &&
            (identical(other.reviews, reviews) || other.reviews == reviews) &&
            (identical(other.test, test) || other.test == test));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      profile,
      status,
      const DeepCollectionEquality().hash(_statusSet),
      profileForm,
      formStatus,
      apiMessage,
      reviews,
      test);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      __$$ProfileStateImplCopyWithImpl<_$ProfileStateImpl>(this, _$identity);
}

abstract class _ProfileState implements ProfileState {
  const factory _ProfileState(
      {final Profile profile,
      final ObseleteStatusEnum status,
      final Set<ObseleteStatusEnum> statusSet,
      final Profile profileForm,
      final ObseleteStatusEnum formStatus,
      final String? apiMessage,
      final Status<List<Review>> reviews,
      final Status<Profile>? test}) = _$ProfileStateImpl;

  @override
  Profile get profile;
  @override
  ObseleteStatusEnum get status;
  @override
  Set<ObseleteStatusEnum> get statusSet;
  @override //
  Profile get profileForm;
  @override
  ObseleteStatusEnum get formStatus;
  @override //
  String? get apiMessage;
  @override //
  Status<List<Review>> get reviews;
  @override
  Status<Profile>? get test;
  @override
  @JsonKey(ignore: true)
  _$$ProfileStateImplCopyWith<_$ProfileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
