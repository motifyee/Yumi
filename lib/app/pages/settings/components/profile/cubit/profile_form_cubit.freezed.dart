// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileFormState {
  GlobalKey<FormState>? get profileFormKey =>
      throw _privateConstructorUsedError;
  Profile? get profile => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get mobile => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  bool get pickupOnly => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of ProfileFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileFormStateCopyWith<ProfileFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileFormStateCopyWith<$Res> {
  factory $ProfileFormStateCopyWith(
          ProfileFormState value, $Res Function(ProfileFormState) then) =
      _$ProfileFormStateCopyWithImpl<$Res, ProfileFormState>;
  @useResult
  $Res call(
      {GlobalKey<FormState>? profileFormKey,
      Profile? profile,
      String fullName,
      String mobile,
      String about,
      bool pickupOnly,
      bool isLoading});

  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$ProfileFormStateCopyWithImpl<$Res, $Val extends ProfileFormState>
    implements $ProfileFormStateCopyWith<$Res> {
  _$ProfileFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileFormKey = freezed,
    Object? profile = freezed,
    Object? fullName = null,
    Object? mobile = null,
    Object? about = null,
    Object? pickupOnly = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      profileFormKey: freezed == profileFormKey
          ? _value.profileFormKey
          : profileFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      pickupOnly: null == pickupOnly
          ? _value.pickupOnly
          : pickupOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ProfileFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ProfileFormStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GlobalKey<FormState>? profileFormKey,
      Profile? profile,
      String fullName,
      String mobile,
      String about,
      bool pickupOnly,
      bool isLoading});

  @override
  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProfileFormStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileFormKey = freezed,
    Object? profile = freezed,
    Object? fullName = null,
    Object? mobile = null,
    Object? about = null,
    Object? pickupOnly = null,
    Object? isLoading = null,
  }) {
    return _then(_$InitialImpl(
      profileFormKey: freezed == profileFormKey
          ? _value.profileFormKey
          : profileFormKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      pickupOnly: null == pickupOnly
          ? _value.pickupOnly
          : pickupOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.profileFormKey,
      this.profile,
      this.fullName = '',
      this.mobile = '',
      this.about = '',
      this.pickupOnly = false,
      this.isLoading = false});

  @override
  final GlobalKey<FormState>? profileFormKey;
  @override
  final Profile? profile;
  @override
  @JsonKey()
  final String fullName;
  @override
  @JsonKey()
  final String mobile;
  @override
  @JsonKey()
  final String about;
  @override
  @JsonKey()
  final bool pickupOnly;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ProfileFormState(profileFormKey: $profileFormKey, profile: $profile, fullName: $fullName, mobile: $mobile, about: $about, pickupOnly: $pickupOnly, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.profileFormKey, profileFormKey) ||
                other.profileFormKey == profileFormKey) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.pickupOnly, pickupOnly) ||
                other.pickupOnly == pickupOnly) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileFormKey, profile,
      fullName, mobile, about, pickupOnly, isLoading);

  /// Create a copy of ProfileFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial implements ProfileFormState {
  const factory _Initial(
      {final GlobalKey<FormState>? profileFormKey,
      final Profile? profile,
      final String fullName,
      final String mobile,
      final String about,
      final bool pickupOnly,
      final bool isLoading}) = _$InitialImpl;

  @override
  GlobalKey<FormState>? get profileFormKey;
  @override
  Profile? get profile;
  @override
  String get fullName;
  @override
  String get mobile;
  @override
  String get about;
  @override
  bool get pickupOnly;
  @override
  bool get isLoading;

  /// Create a copy of ProfileFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
