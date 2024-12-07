// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigator_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NavigatorStates _$NavigatorStatesFromJson(Map<String, dynamic> json) {
  return _NavigatorStates.fromJson(json);
}

/// @nodoc
mixin _$NavigatorStates {
  int get selectedIndex => throw _privateConstructorUsedError;

  /// Serializes this NavigatorStates to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NavigatorStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NavigatorStatesCopyWith<NavigatorStates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigatorStatesCopyWith<$Res> {
  factory $NavigatorStatesCopyWith(
          NavigatorStates value, $Res Function(NavigatorStates) then) =
      _$NavigatorStatesCopyWithImpl<$Res, NavigatorStates>;
  @useResult
  $Res call({int selectedIndex});
}

/// @nodoc
class _$NavigatorStatesCopyWithImpl<$Res, $Val extends NavigatorStates>
    implements $NavigatorStatesCopyWith<$Res> {
  _$NavigatorStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NavigatorStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
  }) {
    return _then(_value.copyWith(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavigatorStatesImplCopyWith<$Res>
    implements $NavigatorStatesCopyWith<$Res> {
  factory _$$NavigatorStatesImplCopyWith(_$NavigatorStatesImpl value,
          $Res Function(_$NavigatorStatesImpl) then) =
      __$$NavigatorStatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectedIndex});
}

/// @nodoc
class __$$NavigatorStatesImplCopyWithImpl<$Res>
    extends _$NavigatorStatesCopyWithImpl<$Res, _$NavigatorStatesImpl>
    implements _$$NavigatorStatesImplCopyWith<$Res> {
  __$$NavigatorStatesImplCopyWithImpl(
      _$NavigatorStatesImpl _value, $Res Function(_$NavigatorStatesImpl) _then)
      : super(_value, _then);

  /// Create a copy of NavigatorStates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
  }) {
    return _then(_$NavigatorStatesImpl(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NavigatorStatesImpl implements _NavigatorStates {
  const _$NavigatorStatesImpl({this.selectedIndex = 0});

  factory _$NavigatorStatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$NavigatorStatesImplFromJson(json);

  @override
  @JsonKey()
  final int selectedIndex;

  @override
  String toString() {
    return 'NavigatorStates(selectedIndex: $selectedIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavigatorStatesImpl &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, selectedIndex);

  /// Create a copy of NavigatorStates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NavigatorStatesImplCopyWith<_$NavigatorStatesImpl> get copyWith =>
      __$$NavigatorStatesImplCopyWithImpl<_$NavigatorStatesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NavigatorStatesImplToJson(
      this,
    );
  }
}

abstract class _NavigatorStates implements NavigatorStates {
  const factory _NavigatorStates({final int selectedIndex}) =
      _$NavigatorStatesImpl;

  factory _NavigatorStates.fromJson(Map<String, dynamic> json) =
      _$NavigatorStatesImpl.fromJson;

  @override
  int get selectedIndex;

  /// Create a copy of NavigatorStates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NavigatorStatesImplCopyWith<_$NavigatorStatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
