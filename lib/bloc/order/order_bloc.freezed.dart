// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            List<OrderModel> orders, PaginationHelper<dynamic> paginationHelper)
        update,
    required TResult Function(String apiKey) getRequest,
    required TResult Function(OrderModel order, String apiKey, String getApiKey,
            bool isFakeBody, dynamic Function()? navFun)
        putAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(List<OrderModel> orders,
            PaginationHelper<dynamic> paginationHelper)?
        update,
    TResult? Function(String apiKey)? getRequest,
    TResult? Function(OrderModel order, String apiKey, String getApiKey,
            bool isFakeBody, dynamic Function()? navFun)?
        putAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(List<OrderModel> orders,
            PaginationHelper<dynamic> paginationHelper)?
        update,
    TResult Function(String apiKey)? getRequest,
    TResult Function(OrderModel order, String apiKey, String getApiKey,
            bool isFakeBody, dynamic Function()? navFun)?
        putAction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_resetEvent value) reset,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_getRequestEvent value) getRequest,
    required TResult Function(_putActionEvent value) putAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_resetEvent value)? reset,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_getRequestEvent value)? getRequest,
    TResult? Function(_putActionEvent value)? putAction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_resetEvent value)? reset,
    TResult Function(_updateEvent value)? update,
    TResult Function(_getRequestEvent value)? getRequest,
    TResult Function(_putActionEvent value)? putAction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEventCopyWith<$Res> {
  factory $OrderEventCopyWith(
          OrderEvent value, $Res Function(OrderEvent) then) =
      _$OrderEventCopyWithImpl<$Res, OrderEvent>;
}

/// @nodoc
class _$OrderEventCopyWithImpl<$Res, $Val extends OrderEvent>
    implements $OrderEventCopyWith<$Res> {
  _$OrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$resetEventImplCopyWith<$Res> {
  factory _$$resetEventImplCopyWith(
          _$resetEventImpl value, $Res Function(_$resetEventImpl) then) =
      __$$resetEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$resetEventImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$resetEventImpl>
    implements _$$resetEventImplCopyWith<$Res> {
  __$$resetEventImplCopyWithImpl(
      _$resetEventImpl _value, $Res Function(_$resetEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$resetEventImpl implements _resetEvent {
  const _$resetEventImpl();

  @override
  String toString() {
    return 'OrderEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$resetEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            List<OrderModel> orders, PaginationHelper<dynamic> paginationHelper)
        update,
    required TResult Function(String apiKey) getRequest,
    required TResult Function(OrderModel order, String apiKey, String getApiKey,
            bool isFakeBody, dynamic Function()? navFun)
        putAction,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(List<OrderModel> orders,
            PaginationHelper<dynamic> paginationHelper)?
        update,
    TResult? Function(String apiKey)? getRequest,
    TResult? Function(OrderModel order, String apiKey, String getApiKey,
            bool isFakeBody, dynamic Function()? navFun)?
        putAction,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(List<OrderModel> orders,
            PaginationHelper<dynamic> paginationHelper)?
        update,
    TResult Function(String apiKey)? getRequest,
    TResult Function(OrderModel order, String apiKey, String getApiKey,
            bool isFakeBody, dynamic Function()? navFun)?
        putAction,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_resetEvent value) reset,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_getRequestEvent value) getRequest,
    required TResult Function(_putActionEvent value) putAction,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_resetEvent value)? reset,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_getRequestEvent value)? getRequest,
    TResult? Function(_putActionEvent value)? putAction,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_resetEvent value)? reset,
    TResult Function(_updateEvent value)? update,
    TResult Function(_getRequestEvent value)? getRequest,
    TResult Function(_putActionEvent value)? putAction,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _resetEvent implements OrderEvent {
  const factory _resetEvent() = _$resetEventImpl;
}

/// @nodoc
abstract class _$$updateEventImplCopyWith<$Res> {
  factory _$$updateEventImplCopyWith(
          _$updateEventImpl value, $Res Function(_$updateEventImpl) then) =
      __$$updateEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<OrderModel> orders, PaginationHelper<dynamic> paginationHelper});

  $PaginationHelperCopyWith<dynamic, $Res> get paginationHelper;
}

/// @nodoc
class __$$updateEventImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$updateEventImpl>
    implements _$$updateEventImplCopyWith<$Res> {
  __$$updateEventImplCopyWithImpl(
      _$updateEventImpl _value, $Res Function(_$updateEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
    Object? paginationHelper = null,
  }) {
    return _then(_$updateEventImpl(
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      paginationHelper: null == paginationHelper
          ? _value.paginationHelper
          : paginationHelper // ignore: cast_nullable_to_non_nullable
              as PaginationHelper<dynamic>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationHelperCopyWith<dynamic, $Res> get paginationHelper {
    return $PaginationHelperCopyWith<dynamic, $Res>(_value.paginationHelper,
        (value) {
      return _then(_value.copyWith(paginationHelper: value));
    });
  }
}

/// @nodoc

class _$updateEventImpl implements _updateEvent {
  const _$updateEventImpl(
      {required final List<OrderModel> orders, required this.paginationHelper})
      : _orders = orders;

  final List<OrderModel> _orders;
  @override
  List<OrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  final PaginationHelper<dynamic> paginationHelper;

  @override
  String toString() {
    return 'OrderEvent.update(orders: $orders, paginationHelper: $paginationHelper)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$updateEventImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.paginationHelper, paginationHelper) ||
                other.paginationHelper == paginationHelper));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_orders), paginationHelper);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$updateEventImplCopyWith<_$updateEventImpl> get copyWith =>
      __$$updateEventImplCopyWithImpl<_$updateEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            List<OrderModel> orders, PaginationHelper<dynamic> paginationHelper)
        update,
    required TResult Function(String apiKey) getRequest,
    required TResult Function(OrderModel order, String apiKey, String getApiKey,
            bool isFakeBody, dynamic Function()? navFun)
        putAction,
  }) {
    return update(orders, paginationHelper);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(List<OrderModel> orders,
            PaginationHelper<dynamic> paginationHelper)?
        update,
    TResult? Function(String apiKey)? getRequest,
    TResult? Function(OrderModel order, String apiKey, String getApiKey,
            bool isFakeBody, dynamic Function()? navFun)?
        putAction,
  }) {
    return update?.call(orders, paginationHelper);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(List<OrderModel> orders,
            PaginationHelper<dynamic> paginationHelper)?
        update,
    TResult Function(String apiKey)? getRequest,
    TResult Function(OrderModel order, String apiKey, String getApiKey,
            bool isFakeBody, dynamic Function()? navFun)?
        putAction,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(orders, paginationHelper);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_resetEvent value) reset,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_getRequestEvent value) getRequest,
    required TResult Function(_putActionEvent value) putAction,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_resetEvent value)? reset,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_getRequestEvent value)? getRequest,
    TResult? Function(_putActionEvent value)? putAction,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_resetEvent value)? reset,
    TResult Function(_updateEvent value)? update,
    TResult Function(_getRequestEvent value)? getRequest,
    TResult Function(_putActionEvent value)? putAction,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _updateEvent implements OrderEvent {
  const factory _updateEvent(
          {required final List<OrderModel> orders,
          required final PaginationHelper<dynamic> paginationHelper}) =
      _$updateEventImpl;

  List<OrderModel> get orders;
  PaginationHelper<dynamic> get paginationHelper;
  @JsonKey(ignore: true)
  _$$updateEventImplCopyWith<_$updateEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$getRequestEventImplCopyWith<$Res> {
  factory _$$getRequestEventImplCopyWith(_$getRequestEventImpl value,
          $Res Function(_$getRequestEventImpl) then) =
      __$$getRequestEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String apiKey});
}

/// @nodoc
class __$$getRequestEventImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$getRequestEventImpl>
    implements _$$getRequestEventImplCopyWith<$Res> {
  __$$getRequestEventImplCopyWithImpl(
      _$getRequestEventImpl _value, $Res Function(_$getRequestEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiKey = null,
  }) {
    return _then(_$getRequestEventImpl(
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$getRequestEventImpl implements _getRequestEvent {
  const _$getRequestEventImpl({required this.apiKey});

  @override
  final String apiKey;

  @override
  String toString() {
    return 'OrderEvent.getRequest(apiKey: $apiKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$getRequestEventImpl &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$getRequestEventImplCopyWith<_$getRequestEventImpl> get copyWith =>
      __$$getRequestEventImplCopyWithImpl<_$getRequestEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            List<OrderModel> orders, PaginationHelper<dynamic> paginationHelper)
        update,
    required TResult Function(String apiKey) getRequest,
    required TResult Function(OrderModel order, String apiKey, String getApiKey,
            bool isFakeBody, dynamic Function()? navFun)
        putAction,
  }) {
    return getRequest(apiKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(List<OrderModel> orders,
            PaginationHelper<dynamic> paginationHelper)?
        update,
    TResult? Function(String apiKey)? getRequest,
    TResult? Function(OrderModel order, String apiKey, String getApiKey,
            bool isFakeBody, dynamic Function()? navFun)?
        putAction,
  }) {
    return getRequest?.call(apiKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(List<OrderModel> orders,
            PaginationHelper<dynamic> paginationHelper)?
        update,
    TResult Function(String apiKey)? getRequest,
    TResult Function(OrderModel order, String apiKey, String getApiKey,
            bool isFakeBody, dynamic Function()? navFun)?
        putAction,
    required TResult orElse(),
  }) {
    if (getRequest != null) {
      return getRequest(apiKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_resetEvent value) reset,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_getRequestEvent value) getRequest,
    required TResult Function(_putActionEvent value) putAction,
  }) {
    return getRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_resetEvent value)? reset,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_getRequestEvent value)? getRequest,
    TResult? Function(_putActionEvent value)? putAction,
  }) {
    return getRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_resetEvent value)? reset,
    TResult Function(_updateEvent value)? update,
    TResult Function(_getRequestEvent value)? getRequest,
    TResult Function(_putActionEvent value)? putAction,
    required TResult orElse(),
  }) {
    if (getRequest != null) {
      return getRequest(this);
    }
    return orElse();
  }
}

abstract class _getRequestEvent implements OrderEvent {
  const factory _getRequestEvent({required final String apiKey}) =
      _$getRequestEventImpl;

  String get apiKey;
  @JsonKey(ignore: true)
  _$$getRequestEventImplCopyWith<_$getRequestEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$putActionEventImplCopyWith<$Res> {
  factory _$$putActionEventImplCopyWith(_$putActionEventImpl value,
          $Res Function(_$putActionEventImpl) then) =
      __$$putActionEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {OrderModel order,
      String apiKey,
      String getApiKey,
      bool isFakeBody,
      dynamic Function()? navFun});

  $OrderModelCopyWith<$Res> get order;
}

/// @nodoc
class __$$putActionEventImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$putActionEventImpl>
    implements _$$putActionEventImplCopyWith<$Res> {
  __$$putActionEventImplCopyWithImpl(
      _$putActionEventImpl _value, $Res Function(_$putActionEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = null,
    Object? apiKey = null,
    Object? getApiKey = null,
    Object? isFakeBody = null,
    Object? navFun = freezed,
  }) {
    return _then(_$putActionEventImpl(
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel,
      apiKey: null == apiKey
          ? _value.apiKey
          : apiKey // ignore: cast_nullable_to_non_nullable
              as String,
      getApiKey: null == getApiKey
          ? _value.getApiKey
          : getApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      isFakeBody: null == isFakeBody
          ? _value.isFakeBody
          : isFakeBody // ignore: cast_nullable_to_non_nullable
              as bool,
      navFun: freezed == navFun
          ? _value.navFun
          : navFun // ignore: cast_nullable_to_non_nullable
              as dynamic Function()?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<$Res> get order {
    return $OrderModelCopyWith<$Res>(_value.order, (value) {
      return _then(_value.copyWith(order: value));
    });
  }
}

/// @nodoc

class _$putActionEventImpl implements _putActionEvent {
  const _$putActionEventImpl(
      {required this.order,
      required this.apiKey,
      required this.getApiKey,
      this.isFakeBody = true,
      this.navFun});

  @override
  final OrderModel order;
  @override
  final String apiKey;
  @override
  final String getApiKey;
  @override
  @JsonKey()
  final bool isFakeBody;
  @override
  final dynamic Function()? navFun;

  @override
  String toString() {
    return 'OrderEvent.putAction(order: $order, apiKey: $apiKey, getApiKey: $getApiKey, isFakeBody: $isFakeBody, navFun: $navFun)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$putActionEventImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.apiKey, apiKey) || other.apiKey == apiKey) &&
            (identical(other.getApiKey, getApiKey) ||
                other.getApiKey == getApiKey) &&
            (identical(other.isFakeBody, isFakeBody) ||
                other.isFakeBody == isFakeBody) &&
            (identical(other.navFun, navFun) || other.navFun == navFun));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, order, apiKey, getApiKey, isFakeBody, navFun);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$putActionEventImplCopyWith<_$putActionEventImpl> get copyWith =>
      __$$putActionEventImplCopyWithImpl<_$putActionEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            List<OrderModel> orders, PaginationHelper<dynamic> paginationHelper)
        update,
    required TResult Function(String apiKey) getRequest,
    required TResult Function(OrderModel order, String apiKey, String getApiKey,
            bool isFakeBody, dynamic Function()? navFun)
        putAction,
  }) {
    return putAction(order, apiKey, getApiKey, isFakeBody, navFun);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(List<OrderModel> orders,
            PaginationHelper<dynamic> paginationHelper)?
        update,
    TResult? Function(String apiKey)? getRequest,
    TResult? Function(OrderModel order, String apiKey, String getApiKey,
            bool isFakeBody, dynamic Function()? navFun)?
        putAction,
  }) {
    return putAction?.call(order, apiKey, getApiKey, isFakeBody, navFun);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(List<OrderModel> orders,
            PaginationHelper<dynamic> paginationHelper)?
        update,
    TResult Function(String apiKey)? getRequest,
    TResult Function(OrderModel order, String apiKey, String getApiKey,
            bool isFakeBody, dynamic Function()? navFun)?
        putAction,
    required TResult orElse(),
  }) {
    if (putAction != null) {
      return putAction(order, apiKey, getApiKey, isFakeBody, navFun);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_resetEvent value) reset,
    required TResult Function(_updateEvent value) update,
    required TResult Function(_getRequestEvent value) getRequest,
    required TResult Function(_putActionEvent value) putAction,
  }) {
    return putAction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_resetEvent value)? reset,
    TResult? Function(_updateEvent value)? update,
    TResult? Function(_getRequestEvent value)? getRequest,
    TResult? Function(_putActionEvent value)? putAction,
  }) {
    return putAction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_resetEvent value)? reset,
    TResult Function(_updateEvent value)? update,
    TResult Function(_getRequestEvent value)? getRequest,
    TResult Function(_putActionEvent value)? putAction,
    required TResult orElse(),
  }) {
    if (putAction != null) {
      return putAction(this);
    }
    return orElse();
  }
}

abstract class _putActionEvent implements OrderEvent {
  const factory _putActionEvent(
      {required final OrderModel order,
      required final String apiKey,
      required final String getApiKey,
      final bool isFakeBody,
      final dynamic Function()? navFun}) = _$putActionEventImpl;

  OrderModel get order;
  String get apiKey;
  String get getApiKey;
  bool get isFakeBody;
  dynamic Function()? get navFun;
  @JsonKey(ignore: true)
  _$$putActionEventImplCopyWith<_$putActionEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderState {
  List<OrderModel> get orders => throw _privateConstructorUsedError;
  PaginationHelper<dynamic> get paginationHelper =>
      throw _privateConstructorUsedError;

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
  $Res call(
      {List<OrderModel> orders, PaginationHelper<dynamic> paginationHelper});

  $PaginationHelperCopyWith<dynamic, $Res> get paginationHelper;
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
    Object? orders = null,
    Object? paginationHelper = null,
  }) {
    return _then(_value.copyWith(
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      paginationHelper: null == paginationHelper
          ? _value.paginationHelper
          : paginationHelper // ignore: cast_nullable_to_non_nullable
              as PaginationHelper<dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationHelperCopyWith<dynamic, $Res> get paginationHelper {
    return $PaginationHelperCopyWith<dynamic, $Res>(_value.paginationHelper,
        (value) {
      return _then(_value.copyWith(paginationHelper: value) as $Val);
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
  $Res call(
      {List<OrderModel> orders, PaginationHelper<dynamic> paginationHelper});

  @override
  $PaginationHelperCopyWith<dynamic, $Res> get paginationHelper;
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
    Object? orders = null,
    Object? paginationHelper = null,
  }) {
    return _then(_$OrderStateImpl(
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderModel>,
      paginationHelper: null == paginationHelper
          ? _value.paginationHelper
          : paginationHelper // ignore: cast_nullable_to_non_nullable
              as PaginationHelper<dynamic>,
    ));
  }
}

/// @nodoc

class _$OrderStateImpl implements _OrderState {
  const _$OrderStateImpl(
      {required final List<OrderModel> orders, required this.paginationHelper})
      : _orders = orders;

  final List<OrderModel> _orders;
  @override
  List<OrderModel> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  final PaginationHelper<dynamic> paginationHelper;

  @override
  String toString() {
    return 'OrderState(orders: $orders, paginationHelper: $paginationHelper)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderStateImpl &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            (identical(other.paginationHelper, paginationHelper) ||
                other.paginationHelper == paginationHelper));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_orders), paginationHelper);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      __$$OrderStateImplCopyWithImpl<_$OrderStateImpl>(this, _$identity);
}

abstract class _OrderState implements OrderState {
  const factory _OrderState(
          {required final List<OrderModel> orders,
          required final PaginationHelper<dynamic> paginationHelper}) =
      _$OrderStateImpl;

  @override
  List<OrderModel> get orders;
  @override
  PaginationHelper<dynamic> get paginationHelper;
  @override
  @JsonKey(ignore: true)
  _$$OrderStateImplCopyWith<_$OrderStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
