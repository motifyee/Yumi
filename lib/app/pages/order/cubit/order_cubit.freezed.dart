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
  Pagination<Order> get ordersPage => throw _privateConstructorUsedError;

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
  $Res call({Pagination<Order> ordersPage});

  $PaginationCopyWith<Order, $Res> get ordersPage;
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
    Object? ordersPage = null,
  }) {
    return _then(_value.copyWith(
      ordersPage: null == ordersPage
          ? _value.ordersPage
          : ordersPage // ignore: cast_nullable_to_non_nullable
              as Pagination<Order>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<Order, $Res> get ordersPage {
    return $PaginationCopyWith<Order, $Res>(_value.ordersPage, (value) {
      return _then(_value.copyWith(ordersPage: value) as $Val);
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
  $Res call({Pagination<Order> ordersPage});

  @override
  $PaginationCopyWith<Order, $Res> get ordersPage;
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
    Object? ordersPage = null,
  }) {
    return _then(_$OrderStateImpl(
      ordersPage: null == ordersPage
          ? _value.ordersPage
          : ordersPage // ignore: cast_nullable_to_non_nullable
              as Pagination<Order>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderStateImpl implements _OrderState {
  _$OrderStateImpl({this.ordersPage = const Pagination()});

  factory _$OrderStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderStateImplFromJson(json);

  @override
  @JsonKey()
  final Pagination<Order> ordersPage;

  @override
  String toString() {
    return 'OrderState(ordersPage: $ordersPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateImpl &&
            (identical(other.ordersPage, ordersPage) ||
                other.ordersPage == ordersPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ordersPage);

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
  factory _OrderState({final Pagination<Order> ordersPage}) = _$OrderStateImpl;

  factory _OrderState.fromJson(Map<String, dynamic> json) =
      _$OrderStateImpl.fromJson;

  @override
  Pagination<Order> get ordersPage;
  @override
  @JsonKey(ignore: true)
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
