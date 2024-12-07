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
  Status get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Status?> get docsStatuses => throw _privateConstructorUsedError;

  /// Create a copy of DocsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DocsStateCopyWith<DocsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocsStateCopyWith<$Res> {
  factory $DocsStateCopyWith(DocsState value, $Res Function(DocsState) then) =
      _$DocsStateCopyWithImpl<$Res, DocsState>;
  @useResult
  $Res call({Status status, String message, List<Status?> docsStatuses});
}

/// @nodoc
class _$DocsStateCopyWithImpl<$Res, $Val extends DocsState>
    implements $DocsStateCopyWith<$Res> {
  _$DocsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DocsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? docsStatuses = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      docsStatuses: null == docsStatuses
          ? _value.docsStatuses
          : docsStatuses // ignore: cast_nullable_to_non_nullable
              as List<Status?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> implements $DocsStateCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, String message, List<Status?> docsStatuses});
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$DocsStateCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);

  /// Create a copy of DocsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? docsStatuses = null,
  }) {
    return _then(_$InitImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      docsStatuses: null == docsStatuses
          ? _value._docsStatuses
          : docsStatuses // ignore: cast_nullable_to_non_nullable
              as List<Status?>,
    ));
  }
}

/// @nodoc

class _$InitImpl extends _Init {
  const _$InitImpl(
      {this.status = Status.init,
      this.message = '',
      final List<Status?> docsStatuses = const [null, null, null, null, null]})
      : _docsStatuses = docsStatuses,
        super._();

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final String message;
  final List<Status?> _docsStatuses;
  @override
  @JsonKey()
  List<Status?> get docsStatuses {
    if (_docsStatuses is EqualUnmodifiableListView) return _docsStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_docsStatuses);
  }

  @override
  String toString() {
    return 'DocsState(status: $status, message: $message, docsStatuses: $docsStatuses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._docsStatuses, _docsStatuses));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message,
      const DeepCollectionEquality().hash(_docsStatuses));

  /// Create a copy of DocsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      __$$InitImplCopyWithImpl<_$InitImpl>(this, _$identity);
}

abstract class _Init extends DocsState {
  const factory _Init(
      {final Status status,
      final String message,
      final List<Status?> docsStatuses}) = _$InitImpl;
  const _Init._() : super._();

  @override
  Status get status;
  @override
  String get message;
  @override
  List<Status?> get docsStatuses;

  /// Create a copy of DocsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitImplCopyWith<_$InitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
