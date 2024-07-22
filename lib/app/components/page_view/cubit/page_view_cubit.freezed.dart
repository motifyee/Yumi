// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_view_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PageViewState _$PageViewStateFromJson(Map<String, dynamic> json) {
  return _PageViewState.fromJson(json);
}

/// @nodoc
mixin _$PageViewState {
  int get selectedList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageViewStateCopyWith<PageViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageViewStateCopyWith<$Res> {
  factory $PageViewStateCopyWith(
          PageViewState value, $Res Function(PageViewState) then) =
      _$PageViewStateCopyWithImpl<$Res, PageViewState>;
  @useResult
  $Res call({int selectedList});
}

/// @nodoc
class _$PageViewStateCopyWithImpl<$Res, $Val extends PageViewState>
    implements $PageViewStateCopyWith<$Res> {
  _$PageViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedList = null,
  }) {
    return _then(_value.copyWith(
      selectedList: null == selectedList
          ? _value.selectedList
          : selectedList // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageViewStateImplCopyWith<$Res>
    implements $PageViewStateCopyWith<$Res> {
  factory _$$PageViewStateImplCopyWith(
          _$PageViewStateImpl value, $Res Function(_$PageViewStateImpl) then) =
      __$$PageViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectedList});
}

/// @nodoc
class __$$PageViewStateImplCopyWithImpl<$Res>
    extends _$PageViewStateCopyWithImpl<$Res, _$PageViewStateImpl>
    implements _$$PageViewStateImplCopyWith<$Res> {
  __$$PageViewStateImplCopyWithImpl(
      _$PageViewStateImpl _value, $Res Function(_$PageViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedList = null,
  }) {
    return _then(_$PageViewStateImpl(
      selectedList: null == selectedList
          ? _value.selectedList
          : selectedList // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageViewStateImpl implements _PageViewState {
  const _$PageViewStateImpl({this.selectedList = 0});

  factory _$PageViewStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageViewStateImplFromJson(json);

  @override
  @JsonKey()
  final int selectedList;

  @override
  String toString() {
    return 'PageViewState(selectedList: $selectedList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageViewStateImpl &&
            (identical(other.selectedList, selectedList) ||
                other.selectedList == selectedList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, selectedList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageViewStateImplCopyWith<_$PageViewStateImpl> get copyWith =>
      __$$PageViewStateImplCopyWithImpl<_$PageViewStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageViewStateImplToJson(
      this,
    );
  }
}

abstract class _PageViewState implements PageViewState {
  const factory _PageViewState({final int selectedList}) = _$PageViewStateImpl;

  factory _PageViewState.fromJson(Map<String, dynamic> json) =
      _$PageViewStateImpl.fromJson;

  @override
  int get selectedList;
  @override
  @JsonKey(ignore: true)
  _$$PageViewStateImplCopyWith<_$PageViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
