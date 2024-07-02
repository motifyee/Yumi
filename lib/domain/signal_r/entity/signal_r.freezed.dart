// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signal_r.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignalRM _$SignalRMFromJson(Map<String, dynamic> json) {
  return _SignalRM.fromJson(json);
}

/// @nodoc
mixin _$SignalRM {
  Signals get type => throw _privateConstructorUsedError;
  dynamic get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignalRMCopyWith<SignalRM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignalRMCopyWith<$Res> {
  factory $SignalRMCopyWith(SignalRM value, $Res Function(SignalRM) then) =
      _$SignalRMCopyWithImpl<$Res, SignalRM>;
  @useResult
  $Res call({Signals type, dynamic message});
}

/// @nodoc
class _$SignalRMCopyWithImpl<$Res, $Val extends SignalRM>
    implements $SignalRMCopyWith<$Res> {
  _$SignalRMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Signals,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignalRMImplCopyWith<$Res>
    implements $SignalRMCopyWith<$Res> {
  factory _$$SignalRMImplCopyWith(
          _$SignalRMImpl value, $Res Function(_$SignalRMImpl) then) =
      __$$SignalRMImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Signals type, dynamic message});
}

/// @nodoc
class __$$SignalRMImplCopyWithImpl<$Res>
    extends _$SignalRMCopyWithImpl<$Res, _$SignalRMImpl>
    implements _$$SignalRMImplCopyWith<$Res> {
  __$$SignalRMImplCopyWithImpl(
      _$SignalRMImpl _value, $Res Function(_$SignalRMImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? message = freezed,
  }) {
    return _then(_$SignalRMImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Signals,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignalRMImpl implements _SignalRM {
  const _$SignalRMImpl({required this.type, this.message});

  factory _$SignalRMImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignalRMImplFromJson(json);

  @override
  final Signals type;
  @override
  final dynamic message;

  @override
  String toString() {
    return 'SignalRM(type: $type, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignalRMImpl &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignalRMImplCopyWith<_$SignalRMImpl> get copyWith =>
      __$$SignalRMImplCopyWithImpl<_$SignalRMImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignalRMImplToJson(
      this,
    );
  }
}

abstract class _SignalRM implements SignalRM {
  const factory _SignalRM(
      {required final Signals type, final dynamic message}) = _$SignalRMImpl;

  factory _SignalRM.fromJson(Map<String, dynamic> json) =
      _$SignalRMImpl.fromJson;

  @override
  Signals get type;
  @override
  dynamic get message;
  @override
  @JsonKey(ignore: true)
  _$$SignalRMImplCopyWith<_$SignalRMImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
