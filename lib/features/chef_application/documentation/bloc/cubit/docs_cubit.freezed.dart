// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'docs_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DocsState {
  Profile get profile => throw _privateConstructorUsedError;
  BlocStatus get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<BlocStatus?> get docsStatuses => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DocsStateCopyWith<DocsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocsStateCopyWith<$Res> {
  factory $DocsStateCopyWith(DocsState value, $Res Function(DocsState) then) =
      _$DocsStateCopyWithImpl<$Res, DocsState>;
  @useResult
  $Res call(
      {Profile profile,
      BlocStatus status,
      String message,
      List<BlocStatus?> docsStatuses});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$DocsStateCopyWithImpl<$Res, $Val extends DocsState>
    implements $DocsStateCopyWith<$Res> {
  _$DocsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? status = null,
    Object? message = null,
    Object? docsStatuses = null,
  }) {
    return _then(_value.copyWith(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      docsStatuses: null == docsStatuses
          ? _value.docsStatuses
          : docsStatuses // ignore: cast_nullable_to_non_nullable
              as List<BlocStatus?>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> implements $DocsStateCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Profile profile,
      BlocStatus status,
      String message,
      List<BlocStatus?> docsStatuses});

  @override
  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$DocsStateCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? status = null,
    Object? message = null,
    Object? docsStatuses = null,
  }) {
    return _then(_$InitImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      docsStatuses: null == docsStatuses
          ? _value._docsStatuses
          : docsStatuses // ignore: cast_nullable_to_non_nullable
              as List<BlocStatus?>,
    ));
  }
}

/// @nodoc

class _$InitImpl extends _Init {
  const _$InitImpl(
      {this.profile = const Profile(),
      this.status = BlocStatus.init,
      this.message = '',
      final List<BlocStatus?> docsStatuses = const [
        null,
        null,
        null,
        null,
        null
      ]})
      : _docsStatuses = docsStatuses,
        super._();

  @override
  @JsonKey()
  final Profile profile;
  @override
  @JsonKey()
  final BlocStatus status;
  @override
  @JsonKey()
  final String message;
  final List<BlocStatus?> _docsStatuses;
  @override
  @JsonKey()
  List<BlocStatus?> get docsStatuses {
    if (_docsStatuses is EqualUnmodifiableListView) return _docsStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_docsStatuses);
  }

  @override
  String toString() {
    return 'DocsState(profile: $profile, status: $status, message: $message, docsStatuses: $docsStatuses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitImpl &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._docsStatuses, _docsStatuses));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile, status, message,
      const DeepCollectionEquality().hash(_docsStatuses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      __$$InitImplCopyWithImpl<_$InitImpl>(this, _$identity);
}

abstract class _Init extends DocsState {
  const factory _Init(
      {final Profile profile,
      final BlocStatus status,
      final String message,
      final List<BlocStatus?> docsStatuses}) = _$InitImpl;
  const _Init._() : super._();

  @override
  Profile get profile;
  @override
  BlocStatus get status;
  @override
  String get message;
  @override
  List<BlocStatus?> get docsStatuses;
  @override
  @JsonKey(ignore: true)
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
