// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderState _$OrderStateFromJson(Map<String, dynamic> json) {
  return _OrderState.fromJson(json);
}

/// @nodoc
mixin _$OrderState {
  Pager<Order> get pager => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderStateCopyWith<OrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
  @useResult
  $Res call({Pager<Order> pager});

  $PagerCopyWith<Order, $Res> get pager;
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pager = null,
  }) {
    return _then(_value.copyWith(
      pager: null == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Pager<Order>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PagerCopyWith<Order, $Res> get pager {
    return $PagerCopyWith<Order, $Res>(_value.pager, (value) {
      return _then(_value.copyWith(pager: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderStateImplCopyWith<$Res>
    implements $OrderStateCopyWith<$Res> {
  factory _$$OrderStateImplCopyWith(
          _$OrderStateImpl value, $Res Function(_$OrderStateImpl) then) =
      __$$OrderStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Pager<Order> pager});

  @override
  $PagerCopyWith<Order, $Res> get pager;
}

/// @nodoc
class __$$OrderStateImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$OrderStateImpl>
    implements _$$OrderStateImplCopyWith<$Res> {
  __$$OrderStateImplCopyWithImpl(
      _$OrderStateImpl _value, $Res Function(_$OrderStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pager = null,
  }) {
    return _then(_$OrderStateImpl(
      pager: null == pager
          ? _value.pager
          : pager // ignore: cast_nullable_to_non_nullable
              as Pager<Order>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderStateImpl implements _OrderState {
  const _$OrderStateImpl({required this.pager});

  factory _$OrderStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderStateImplFromJson(json);

  @override
  final Pager<Order> pager;

  @override
  String toString() {
    return 'OrderState(pager: $pager)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateImpl &&
            (identical(other.pager, pager) || other.pager == pager));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pager);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      __$$OrderStateImplCopyWithImpl<_$OrderStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderStateImplToJson(
      this,
    );
  }
}

abstract class _OrderState implements OrderState {
  const factory _OrderState({required final Pager<Order> pager}) =
      _$OrderStateImpl;

  factory _OrderState.fromJson(Map<String, dynamic> json) =
      _$OrderStateImpl.fromJson;

  @override
  Pager<Order> get pager;
  @override
  @JsonKey(ignore: true)
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
