// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signal_r_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignalRState _$SignalRStateFromJson(Map<String, dynamic> json) {
  return _SignalRState.fromJson(json);
}

/// @nodoc
mixin _$SignalRState {
  List<SignalRM> get signals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignalRStateCopyWith<SignalRState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignalRStateCopyWith<$Res> {
  factory $SignalRStateCopyWith(
          SignalRState value, $Res Function(SignalRState) then) =
      _$SignalRStateCopyWithImpl<$Res, SignalRState>;
  @useResult
  $Res call({List<SignalRM> signals});
}

/// @nodoc
class _$SignalRStateCopyWithImpl<$Res, $Val extends SignalRState>
    implements $SignalRStateCopyWith<$Res> {
  _$SignalRStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signals = null,
  }) {
    return _then(_value.copyWith(
      signals: null == signals
          ? _value.signals
          : signals // ignore: cast_nullable_to_non_nullable
              as List<SignalRM>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignalRStateImplCopyWith<$Res>
    implements $SignalRStateCopyWith<$Res> {
  factory _$$SignalRStateImplCopyWith(
          _$SignalRStateImpl value, $Res Function(_$SignalRStateImpl) then) =
      __$$SignalRStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SignalRM> signals});
}

/// @nodoc
class __$$SignalRStateImplCopyWithImpl<$Res>
    extends _$SignalRStateCopyWithImpl<$Res, _$SignalRStateImpl>
    implements _$$SignalRStateImplCopyWith<$Res> {
  __$$SignalRStateImplCopyWithImpl(
      _$SignalRStateImpl _value, $Res Function(_$SignalRStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signals = null,
  }) {
    return _then(_$SignalRStateImpl(
      signals: null == signals
          ? _value._signals
          : signals // ignore: cast_nullable_to_non_nullable
              as List<SignalRM>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignalRStateImpl extends _SignalRState {
  const _$SignalRStateImpl({required final List<SignalRM> signals})
      : _signals = signals,
        super._();

  factory _$SignalRStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignalRStateImplFromJson(json);

  final List<SignalRM> _signals;
  @override
  List<SignalRM> get signals {
    if (_signals is EqualUnmodifiableListView) return _signals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_signals);
  }

  @override
  String toString() {
    return 'SignalRState(signals: $signals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignalRStateImpl &&
            const DeepCollectionEquality().equals(other._signals, _signals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_signals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignalRStateImplCopyWith<_$SignalRStateImpl> get copyWith =>
      __$$SignalRStateImplCopyWithImpl<_$SignalRStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignalRStateImplToJson(
      this,
    );
  }
}

abstract class _SignalRState extends SignalRState {
  const factory _SignalRState({required final List<SignalRM> signals}) =
      _$SignalRStateImpl;
  const _SignalRState._() : super._();

  factory _SignalRState.fromJson(Map<String, dynamic> json) =
      _$SignalRStateImpl.fromJson;

  @override
  List<SignalRM> get signals;
  @override
  @JsonKey(ignore: true)
  _$$SignalRStateImplCopyWith<_$SignalRStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
