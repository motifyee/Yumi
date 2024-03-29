// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Address> address) updateAddressListEvent,
    required TResult Function(BuildContext context) getAddressListEvent,
    required TResult Function() resetAddressListEvent,
    required TResult Function(BuildContext context, Address address)
        deleteAddressEvent,
    required TResult Function(BuildContext context, Address address)
        editAddressEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Address> address)? updateAddressListEvent,
    TResult? Function(BuildContext context)? getAddressListEvent,
    TResult? Function()? resetAddressListEvent,
    TResult? Function(BuildContext context, Address address)?
        deleteAddressEvent,
    TResult? Function(BuildContext context, Address address)? editAddressEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Address> address)? updateAddressListEvent,
    TResult Function(BuildContext context)? getAddressListEvent,
    TResult Function()? resetAddressListEvent,
    TResult Function(BuildContext context, Address address)? deleteAddressEvent,
    TResult Function(BuildContext context, Address address)? editAddressEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_updateAddressListEvent value)
        updateAddressListEvent,
    required TResult Function(_getAddressListEvent value) getAddressListEvent,
    required TResult Function(_resetAddressListEvent value)
        resetAddressListEvent,
    required TResult Function(_deleteAddressEvent value) deleteAddressEvent,
    required TResult Function(_editAddressEvent value) editAddressEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_updateAddressListEvent value)? updateAddressListEvent,
    TResult? Function(_getAddressListEvent value)? getAddressListEvent,
    TResult? Function(_resetAddressListEvent value)? resetAddressListEvent,
    TResult? Function(_deleteAddressEvent value)? deleteAddressEvent,
    TResult? Function(_editAddressEvent value)? editAddressEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_updateAddressListEvent value)? updateAddressListEvent,
    TResult Function(_getAddressListEvent value)? getAddressListEvent,
    TResult Function(_resetAddressListEvent value)? resetAddressListEvent,
    TResult Function(_deleteAddressEvent value)? deleteAddressEvent,
    TResult Function(_editAddressEvent value)? editAddressEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressEventCopyWith<$Res> {
  factory $AddressEventCopyWith(
          AddressEvent value, $Res Function(AddressEvent) then) =
      _$AddressEventCopyWithImpl<$Res, AddressEvent>;
}

/// @nodoc
class _$AddressEventCopyWithImpl<$Res, $Val extends AddressEvent>
    implements $AddressEventCopyWith<$Res> {
  _$AddressEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$updateAddressListEventImplCopyWith<$Res> {
  factory _$$updateAddressListEventImplCopyWith(
          _$updateAddressListEventImpl value,
          $Res Function(_$updateAddressListEventImpl) then) =
      __$$updateAddressListEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Address> address});
}

/// @nodoc
class __$$updateAddressListEventImplCopyWithImpl<$Res>
    extends _$AddressEventCopyWithImpl<$Res, _$updateAddressListEventImpl>
    implements _$$updateAddressListEventImplCopyWith<$Res> {
  __$$updateAddressListEventImplCopyWithImpl(
      _$updateAddressListEventImpl _value,
      $Res Function(_$updateAddressListEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
  }) {
    return _then(_$updateAddressListEventImpl(
      address: null == address
          ? _value._address
          : address // ignore: cast_nullable_to_non_nullable
              as List<Address>,
    ));
  }
}

/// @nodoc

class _$updateAddressListEventImpl implements _updateAddressListEvent {
  const _$updateAddressListEventImpl({required final List<Address> address})
      : _address = address;

  final List<Address> _address;
  @override
  List<Address> get address {
    if (_address is EqualUnmodifiableListView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_address);
  }

  @override
  String toString() {
    return 'AddressEvent.updateAddressListEvent(address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$updateAddressListEventImpl &&
            const DeepCollectionEquality().equals(other._address, _address));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_address));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$updateAddressListEventImplCopyWith<_$updateAddressListEventImpl>
      get copyWith => __$$updateAddressListEventImplCopyWithImpl<
          _$updateAddressListEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Address> address) updateAddressListEvent,
    required TResult Function(BuildContext context) getAddressListEvent,
    required TResult Function() resetAddressListEvent,
    required TResult Function(BuildContext context, Address address)
        deleteAddressEvent,
    required TResult Function(BuildContext context, Address address)
        editAddressEvent,
  }) {
    return updateAddressListEvent(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Address> address)? updateAddressListEvent,
    TResult? Function(BuildContext context)? getAddressListEvent,
    TResult? Function()? resetAddressListEvent,
    TResult? Function(BuildContext context, Address address)?
        deleteAddressEvent,
    TResult? Function(BuildContext context, Address address)? editAddressEvent,
  }) {
    return updateAddressListEvent?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Address> address)? updateAddressListEvent,
    TResult Function(BuildContext context)? getAddressListEvent,
    TResult Function()? resetAddressListEvent,
    TResult Function(BuildContext context, Address address)? deleteAddressEvent,
    TResult Function(BuildContext context, Address address)? editAddressEvent,
    required TResult orElse(),
  }) {
    if (updateAddressListEvent != null) {
      return updateAddressListEvent(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_updateAddressListEvent value)
        updateAddressListEvent,
    required TResult Function(_getAddressListEvent value) getAddressListEvent,
    required TResult Function(_resetAddressListEvent value)
        resetAddressListEvent,
    required TResult Function(_deleteAddressEvent value) deleteAddressEvent,
    required TResult Function(_editAddressEvent value) editAddressEvent,
  }) {
    return updateAddressListEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_updateAddressListEvent value)? updateAddressListEvent,
    TResult? Function(_getAddressListEvent value)? getAddressListEvent,
    TResult? Function(_resetAddressListEvent value)? resetAddressListEvent,
    TResult? Function(_deleteAddressEvent value)? deleteAddressEvent,
    TResult? Function(_editAddressEvent value)? editAddressEvent,
  }) {
    return updateAddressListEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_updateAddressListEvent value)? updateAddressListEvent,
    TResult Function(_getAddressListEvent value)? getAddressListEvent,
    TResult Function(_resetAddressListEvent value)? resetAddressListEvent,
    TResult Function(_deleteAddressEvent value)? deleteAddressEvent,
    TResult Function(_editAddressEvent value)? editAddressEvent,
    required TResult orElse(),
  }) {
    if (updateAddressListEvent != null) {
      return updateAddressListEvent(this);
    }
    return orElse();
  }
}

abstract class _updateAddressListEvent implements AddressEvent {
  const factory _updateAddressListEvent(
      {required final List<Address> address}) = _$updateAddressListEventImpl;

  List<Address> get address;
  @JsonKey(ignore: true)
  _$$updateAddressListEventImplCopyWith<_$updateAddressListEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$getAddressListEventImplCopyWith<$Res> {
  factory _$$getAddressListEventImplCopyWith(_$getAddressListEventImpl value,
          $Res Function(_$getAddressListEventImpl) then) =
      __$$getAddressListEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class __$$getAddressListEventImplCopyWithImpl<$Res>
    extends _$AddressEventCopyWithImpl<$Res, _$getAddressListEventImpl>
    implements _$$getAddressListEventImplCopyWith<$Res> {
  __$$getAddressListEventImplCopyWithImpl(_$getAddressListEventImpl _value,
      $Res Function(_$getAddressListEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
  }) {
    return _then(_$getAddressListEventImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$getAddressListEventImpl implements _getAddressListEvent {
  const _$getAddressListEventImpl({required this.context});

  @override
  final BuildContext context;

  @override
  String toString() {
    return 'AddressEvent.getAddressListEvent(context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$getAddressListEventImpl &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$getAddressListEventImplCopyWith<_$getAddressListEventImpl> get copyWith =>
      __$$getAddressListEventImplCopyWithImpl<_$getAddressListEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Address> address) updateAddressListEvent,
    required TResult Function(BuildContext context) getAddressListEvent,
    required TResult Function() resetAddressListEvent,
    required TResult Function(BuildContext context, Address address)
        deleteAddressEvent,
    required TResult Function(BuildContext context, Address address)
        editAddressEvent,
  }) {
    return getAddressListEvent(context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Address> address)? updateAddressListEvent,
    TResult? Function(BuildContext context)? getAddressListEvent,
    TResult? Function()? resetAddressListEvent,
    TResult? Function(BuildContext context, Address address)?
        deleteAddressEvent,
    TResult? Function(BuildContext context, Address address)? editAddressEvent,
  }) {
    return getAddressListEvent?.call(context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Address> address)? updateAddressListEvent,
    TResult Function(BuildContext context)? getAddressListEvent,
    TResult Function()? resetAddressListEvent,
    TResult Function(BuildContext context, Address address)? deleteAddressEvent,
    TResult Function(BuildContext context, Address address)? editAddressEvent,
    required TResult orElse(),
  }) {
    if (getAddressListEvent != null) {
      return getAddressListEvent(context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_updateAddressListEvent value)
        updateAddressListEvent,
    required TResult Function(_getAddressListEvent value) getAddressListEvent,
    required TResult Function(_resetAddressListEvent value)
        resetAddressListEvent,
    required TResult Function(_deleteAddressEvent value) deleteAddressEvent,
    required TResult Function(_editAddressEvent value) editAddressEvent,
  }) {
    return getAddressListEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_updateAddressListEvent value)? updateAddressListEvent,
    TResult? Function(_getAddressListEvent value)? getAddressListEvent,
    TResult? Function(_resetAddressListEvent value)? resetAddressListEvent,
    TResult? Function(_deleteAddressEvent value)? deleteAddressEvent,
    TResult? Function(_editAddressEvent value)? editAddressEvent,
  }) {
    return getAddressListEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_updateAddressListEvent value)? updateAddressListEvent,
    TResult Function(_getAddressListEvent value)? getAddressListEvent,
    TResult Function(_resetAddressListEvent value)? resetAddressListEvent,
    TResult Function(_deleteAddressEvent value)? deleteAddressEvent,
    TResult Function(_editAddressEvent value)? editAddressEvent,
    required TResult orElse(),
  }) {
    if (getAddressListEvent != null) {
      return getAddressListEvent(this);
    }
    return orElse();
  }
}

abstract class _getAddressListEvent implements AddressEvent {
  const factory _getAddressListEvent({required final BuildContext context}) =
      _$getAddressListEventImpl;

  BuildContext get context;
  @JsonKey(ignore: true)
  _$$getAddressListEventImplCopyWith<_$getAddressListEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$resetAddressListEventImplCopyWith<$Res> {
  factory _$$resetAddressListEventImplCopyWith(
          _$resetAddressListEventImpl value,
          $Res Function(_$resetAddressListEventImpl) then) =
      __$$resetAddressListEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$resetAddressListEventImplCopyWithImpl<$Res>
    extends _$AddressEventCopyWithImpl<$Res, _$resetAddressListEventImpl>
    implements _$$resetAddressListEventImplCopyWith<$Res> {
  __$$resetAddressListEventImplCopyWithImpl(_$resetAddressListEventImpl _value,
      $Res Function(_$resetAddressListEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$resetAddressListEventImpl implements _resetAddressListEvent {
  const _$resetAddressListEventImpl();

  @override
  String toString() {
    return 'AddressEvent.resetAddressListEvent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$resetAddressListEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Address> address) updateAddressListEvent,
    required TResult Function(BuildContext context) getAddressListEvent,
    required TResult Function() resetAddressListEvent,
    required TResult Function(BuildContext context, Address address)
        deleteAddressEvent,
    required TResult Function(BuildContext context, Address address)
        editAddressEvent,
  }) {
    return resetAddressListEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Address> address)? updateAddressListEvent,
    TResult? Function(BuildContext context)? getAddressListEvent,
    TResult? Function()? resetAddressListEvent,
    TResult? Function(BuildContext context, Address address)?
        deleteAddressEvent,
    TResult? Function(BuildContext context, Address address)? editAddressEvent,
  }) {
    return resetAddressListEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Address> address)? updateAddressListEvent,
    TResult Function(BuildContext context)? getAddressListEvent,
    TResult Function()? resetAddressListEvent,
    TResult Function(BuildContext context, Address address)? deleteAddressEvent,
    TResult Function(BuildContext context, Address address)? editAddressEvent,
    required TResult orElse(),
  }) {
    if (resetAddressListEvent != null) {
      return resetAddressListEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_updateAddressListEvent value)
        updateAddressListEvent,
    required TResult Function(_getAddressListEvent value) getAddressListEvent,
    required TResult Function(_resetAddressListEvent value)
        resetAddressListEvent,
    required TResult Function(_deleteAddressEvent value) deleteAddressEvent,
    required TResult Function(_editAddressEvent value) editAddressEvent,
  }) {
    return resetAddressListEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_updateAddressListEvent value)? updateAddressListEvent,
    TResult? Function(_getAddressListEvent value)? getAddressListEvent,
    TResult? Function(_resetAddressListEvent value)? resetAddressListEvent,
    TResult? Function(_deleteAddressEvent value)? deleteAddressEvent,
    TResult? Function(_editAddressEvent value)? editAddressEvent,
  }) {
    return resetAddressListEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_updateAddressListEvent value)? updateAddressListEvent,
    TResult Function(_getAddressListEvent value)? getAddressListEvent,
    TResult Function(_resetAddressListEvent value)? resetAddressListEvent,
    TResult Function(_deleteAddressEvent value)? deleteAddressEvent,
    TResult Function(_editAddressEvent value)? editAddressEvent,
    required TResult orElse(),
  }) {
    if (resetAddressListEvent != null) {
      return resetAddressListEvent(this);
    }
    return orElse();
  }
}

abstract class _resetAddressListEvent implements AddressEvent {
  const factory _resetAddressListEvent() = _$resetAddressListEventImpl;
}

/// @nodoc
abstract class _$$deleteAddressEventImplCopyWith<$Res> {
  factory _$$deleteAddressEventImplCopyWith(_$deleteAddressEventImpl value,
          $Res Function(_$deleteAddressEventImpl) then) =
      __$$deleteAddressEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, Address address});

  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class __$$deleteAddressEventImplCopyWithImpl<$Res>
    extends _$AddressEventCopyWithImpl<$Res, _$deleteAddressEventImpl>
    implements _$$deleteAddressEventImplCopyWith<$Res> {
  __$$deleteAddressEventImplCopyWithImpl(_$deleteAddressEventImpl _value,
      $Res Function(_$deleteAddressEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? address = null,
  }) {
    return _then(_$deleteAddressEventImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value));
    });
  }
}

/// @nodoc

class _$deleteAddressEventImpl implements _deleteAddressEvent {
  const _$deleteAddressEventImpl(
      {required this.context, required this.address});

  @override
  final BuildContext context;
  @override
  final Address address;

  @override
  String toString() {
    return 'AddressEvent.deleteAddressEvent(context: $context, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$deleteAddressEventImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$deleteAddressEventImplCopyWith<_$deleteAddressEventImpl> get copyWith =>
      __$$deleteAddressEventImplCopyWithImpl<_$deleteAddressEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Address> address) updateAddressListEvent,
    required TResult Function(BuildContext context) getAddressListEvent,
    required TResult Function() resetAddressListEvent,
    required TResult Function(BuildContext context, Address address)
        deleteAddressEvent,
    required TResult Function(BuildContext context, Address address)
        editAddressEvent,
  }) {
    return deleteAddressEvent(context, address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Address> address)? updateAddressListEvent,
    TResult? Function(BuildContext context)? getAddressListEvent,
    TResult? Function()? resetAddressListEvent,
    TResult? Function(BuildContext context, Address address)?
        deleteAddressEvent,
    TResult? Function(BuildContext context, Address address)? editAddressEvent,
  }) {
    return deleteAddressEvent?.call(context, address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Address> address)? updateAddressListEvent,
    TResult Function(BuildContext context)? getAddressListEvent,
    TResult Function()? resetAddressListEvent,
    TResult Function(BuildContext context, Address address)? deleteAddressEvent,
    TResult Function(BuildContext context, Address address)? editAddressEvent,
    required TResult orElse(),
  }) {
    if (deleteAddressEvent != null) {
      return deleteAddressEvent(context, address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_updateAddressListEvent value)
        updateAddressListEvent,
    required TResult Function(_getAddressListEvent value) getAddressListEvent,
    required TResult Function(_resetAddressListEvent value)
        resetAddressListEvent,
    required TResult Function(_deleteAddressEvent value) deleteAddressEvent,
    required TResult Function(_editAddressEvent value) editAddressEvent,
  }) {
    return deleteAddressEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_updateAddressListEvent value)? updateAddressListEvent,
    TResult? Function(_getAddressListEvent value)? getAddressListEvent,
    TResult? Function(_resetAddressListEvent value)? resetAddressListEvent,
    TResult? Function(_deleteAddressEvent value)? deleteAddressEvent,
    TResult? Function(_editAddressEvent value)? editAddressEvent,
  }) {
    return deleteAddressEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_updateAddressListEvent value)? updateAddressListEvent,
    TResult Function(_getAddressListEvent value)? getAddressListEvent,
    TResult Function(_resetAddressListEvent value)? resetAddressListEvent,
    TResult Function(_deleteAddressEvent value)? deleteAddressEvent,
    TResult Function(_editAddressEvent value)? editAddressEvent,
    required TResult orElse(),
  }) {
    if (deleteAddressEvent != null) {
      return deleteAddressEvent(this);
    }
    return orElse();
  }
}

abstract class _deleteAddressEvent implements AddressEvent {
  const factory _deleteAddressEvent(
      {required final BuildContext context,
      required final Address address}) = _$deleteAddressEventImpl;

  BuildContext get context;
  Address get address;
  @JsonKey(ignore: true)
  _$$deleteAddressEventImplCopyWith<_$deleteAddressEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$editAddressEventImplCopyWith<$Res> {
  factory _$$editAddressEventImplCopyWith(_$editAddressEventImpl value,
          $Res Function(_$editAddressEventImpl) then) =
      __$$editAddressEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({BuildContext context, Address address});

  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class __$$editAddressEventImplCopyWithImpl<$Res>
    extends _$AddressEventCopyWithImpl<$Res, _$editAddressEventImpl>
    implements _$$editAddressEventImplCopyWith<$Res> {
  __$$editAddressEventImplCopyWithImpl(_$editAddressEventImpl _value,
      $Res Function(_$editAddressEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = null,
    Object? address = null,
  }) {
    return _then(_$editAddressEventImpl(
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value));
    });
  }
}

/// @nodoc

class _$editAddressEventImpl implements _editAddressEvent {
  const _$editAddressEventImpl({required this.context, required this.address});

  @override
  final BuildContext context;
  @override
  final Address address;

  @override
  String toString() {
    return 'AddressEvent.editAddressEvent(context: $context, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$editAddressEventImpl &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$editAddressEventImplCopyWith<_$editAddressEventImpl> get copyWith =>
      __$$editAddressEventImplCopyWithImpl<_$editAddressEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Address> address) updateAddressListEvent,
    required TResult Function(BuildContext context) getAddressListEvent,
    required TResult Function() resetAddressListEvent,
    required TResult Function(BuildContext context, Address address)
        deleteAddressEvent,
    required TResult Function(BuildContext context, Address address)
        editAddressEvent,
  }) {
    return editAddressEvent(context, address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Address> address)? updateAddressListEvent,
    TResult? Function(BuildContext context)? getAddressListEvent,
    TResult? Function()? resetAddressListEvent,
    TResult? Function(BuildContext context, Address address)?
        deleteAddressEvent,
    TResult? Function(BuildContext context, Address address)? editAddressEvent,
  }) {
    return editAddressEvent?.call(context, address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Address> address)? updateAddressListEvent,
    TResult Function(BuildContext context)? getAddressListEvent,
    TResult Function()? resetAddressListEvent,
    TResult Function(BuildContext context, Address address)? deleteAddressEvent,
    TResult Function(BuildContext context, Address address)? editAddressEvent,
    required TResult orElse(),
  }) {
    if (editAddressEvent != null) {
      return editAddressEvent(context, address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_updateAddressListEvent value)
        updateAddressListEvent,
    required TResult Function(_getAddressListEvent value) getAddressListEvent,
    required TResult Function(_resetAddressListEvent value)
        resetAddressListEvent,
    required TResult Function(_deleteAddressEvent value) deleteAddressEvent,
    required TResult Function(_editAddressEvent value) editAddressEvent,
  }) {
    return editAddressEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_updateAddressListEvent value)? updateAddressListEvent,
    TResult? Function(_getAddressListEvent value)? getAddressListEvent,
    TResult? Function(_resetAddressListEvent value)? resetAddressListEvent,
    TResult? Function(_deleteAddressEvent value)? deleteAddressEvent,
    TResult? Function(_editAddressEvent value)? editAddressEvent,
  }) {
    return editAddressEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_updateAddressListEvent value)? updateAddressListEvent,
    TResult Function(_getAddressListEvent value)? getAddressListEvent,
    TResult Function(_resetAddressListEvent value)? resetAddressListEvent,
    TResult Function(_deleteAddressEvent value)? deleteAddressEvent,
    TResult Function(_editAddressEvent value)? editAddressEvent,
    required TResult orElse(),
  }) {
    if (editAddressEvent != null) {
      return editAddressEvent(this);
    }
    return orElse();
  }
}

abstract class _editAddressEvent implements AddressEvent {
  const factory _editAddressEvent(
      {required final BuildContext context,
      required final Address address}) = _$editAddressEventImpl;

  BuildContext get context;
  Address get address;
  @JsonKey(ignore: true)
  _$$editAddressEventImplCopyWith<_$editAddressEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddressState {
  List<Address> get addressList => throw _privateConstructorUsedError;
  PaginationHelper get paginationHelper => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressStateCopyWith<AddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressStateCopyWith<$Res> {
  factory $AddressStateCopyWith(
          AddressState value, $Res Function(AddressState) then) =
      _$AddressStateCopyWithImpl<$Res, AddressState>;
  @useResult
  $Res call({List<Address> addressList, PaginationHelper paginationHelper});
}

/// @nodoc
class _$AddressStateCopyWithImpl<$Res, $Val extends AddressState>
    implements $AddressStateCopyWith<$Res> {
  _$AddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressList = null,
    Object? paginationHelper = null,
  }) {
    return _then(_value.copyWith(
      addressList: null == addressList
          ? _value.addressList
          : addressList // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      paginationHelper: null == paginationHelper
          ? _value.paginationHelper
          : paginationHelper // ignore: cast_nullable_to_non_nullable
              as PaginationHelper,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressStateImplCopyWith<$Res>
    implements $AddressStateCopyWith<$Res> {
  factory _$$AddressStateImplCopyWith(
          _$AddressStateImpl value, $Res Function(_$AddressStateImpl) then) =
      __$$AddressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Address> addressList, PaginationHelper paginationHelper});
}

/// @nodoc
class __$$AddressStateImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$AddressStateImpl>
    implements _$$AddressStateImplCopyWith<$Res> {
  __$$AddressStateImplCopyWithImpl(
      _$AddressStateImpl _value, $Res Function(_$AddressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressList = null,
    Object? paginationHelper = null,
  }) {
    return _then(_$AddressStateImpl(
      addressList: null == addressList
          ? _value._addressList
          : addressList // ignore: cast_nullable_to_non_nullable
              as List<Address>,
      paginationHelper: null == paginationHelper
          ? _value.paginationHelper
          : paginationHelper // ignore: cast_nullable_to_non_nullable
              as PaginationHelper,
    ));
  }
}

/// @nodoc

class _$AddressStateImpl implements _AddressState {
  _$AddressStateImpl(
      {required final List<Address> addressList,
      required this.paginationHelper})
      : _addressList = addressList;

  final List<Address> _addressList;
  @override
  List<Address> get addressList {
    if (_addressList is EqualUnmodifiableListView) return _addressList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addressList);
  }

  @override
  final PaginationHelper paginationHelper;

  @override
  String toString() {
    return 'AddressState(addressList: $addressList, paginationHelper: $paginationHelper)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressStateImpl &&
            const DeepCollectionEquality()
                .equals(other._addressList, _addressList) &&
            (identical(other.paginationHelper, paginationHelper) ||
                other.paginationHelper == paginationHelper));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_addressList), paginationHelper);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressStateImplCopyWith<_$AddressStateImpl> get copyWith =>
      __$$AddressStateImplCopyWithImpl<_$AddressStateImpl>(this, _$identity);
}

abstract class _AddressState implements AddressState {
  factory _AddressState(
      {required final List<Address> addressList,
      required final PaginationHelper paginationHelper}) = _$AddressStateImpl;

  @override
  List<Address> get addressList;
  @override
  PaginationHelper get paginationHelper;
  @override
  @JsonKey(ignore: true)
  _$$AddressStateImplCopyWith<_$AddressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
