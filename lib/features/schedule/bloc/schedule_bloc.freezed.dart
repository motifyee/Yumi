// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScheduleState {
  Schedule get schedule => throw _privateConstructorUsedError;
  BlocStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleStateCopyWith<ScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleStateCopyWith<$Res> {
  factory $ScheduleStateCopyWith(
          ScheduleState value, $Res Function(ScheduleState) then) =
      _$ScheduleStateCopyWithImpl<$Res, ScheduleState>;
  @useResult
  $Res call({Schedule schedule, BlocStatus status});

  $ScheduleCopyWith<$Res> get schedule;
}

/// @nodoc
class _$ScheduleStateCopyWithImpl<$Res, $Val extends ScheduleState>
    implements $ScheduleStateCopyWith<$Res> {
  _$ScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedule = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<$Res> get schedule {
    return $ScheduleCopyWith<$Res>(_value.schedule, (value) {
      return _then(_value.copyWith(schedule: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ScheduleStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Schedule schedule, BlocStatus status});

  @override
  $ScheduleCopyWith<$Res> get schedule;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ScheduleStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedule = null,
    Object? status = null,
  }) {
    return _then(_$InitialImpl(
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BlocStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements Initial {
  const _$InitialImpl(
      {this.schedule = const Schedule(), this.status = BlocStatus.init});

  @override
  @JsonKey()
  final Schedule schedule;
  @override
  @JsonKey()
  final BlocStatus status;

  @override
  String toString() {
    return 'ScheduleState(schedule: $schedule, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schedule, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class Initial implements ScheduleState {
  const factory Initial({final Schedule schedule, final BlocStatus status}) =
      _$InitialImpl;

  @override
  Schedule get schedule;
  @override
  BlocStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScheduleEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(ScheduleDay scheduleDay) setDay,
    required TResult Function() saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(ScheduleDay scheduleDay)? setDay,
    TResult? Function()? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(ScheduleDay scheduleDay)? setDay,
    TResult Function()? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init value) init,
    required TResult Function(_loading value) loading,
    required TResult Function(_loaded value) loaded,
    required TResult Function(_setDay value) setDay,
    required TResult Function(_saved value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_init value)? init,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loaded value)? loaded,
    TResult? Function(_setDay value)? setDay,
    TResult? Function(_saved value)? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_init value)? init,
    TResult Function(_loading value)? loading,
    TResult Function(_loaded value)? loaded,
    TResult Function(_setDay value)? setDay,
    TResult Function(_saved value)? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleEventCopyWith<$Res> {
  factory $ScheduleEventCopyWith(
          ScheduleEvent value, $Res Function(ScheduleEvent) then) =
      _$ScheduleEventCopyWithImpl<$Res, ScheduleEvent>;
}

/// @nodoc
class _$ScheduleEventCopyWithImpl<$Res, $Val extends ScheduleEvent>
    implements $ScheduleEventCopyWith<$Res> {
  _$ScheduleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$initImplCopyWith<$Res> {
  factory _$$initImplCopyWith(
          _$initImpl value, $Res Function(_$initImpl) then) =
      __$$initImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$initImplCopyWithImpl<$Res>
    extends _$ScheduleEventCopyWithImpl<$Res, _$initImpl>
    implements _$$initImplCopyWith<$Res> {
  __$$initImplCopyWithImpl(_$initImpl _value, $Res Function(_$initImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$initImpl implements _init {
  const _$initImpl();

  @override
  String toString() {
    return 'ScheduleEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$initImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(ScheduleDay scheduleDay) setDay,
    required TResult Function() saved,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(ScheduleDay scheduleDay)? setDay,
    TResult? Function()? saved,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(ScheduleDay scheduleDay)? setDay,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init value) init,
    required TResult Function(_loading value) loading,
    required TResult Function(_loaded value) loaded,
    required TResult Function(_setDay value) setDay,
    required TResult Function(_saved value) saved,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_init value)? init,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loaded value)? loaded,
    TResult? Function(_setDay value)? setDay,
    TResult? Function(_saved value)? saved,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_init value)? init,
    TResult Function(_loading value)? loading,
    TResult Function(_loaded value)? loaded,
    TResult Function(_setDay value)? setDay,
    TResult Function(_saved value)? saved,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _init implements ScheduleEvent {
  const factory _init() = _$initImpl;
}

/// @nodoc
abstract class _$$loadingImplCopyWith<$Res> {
  factory _$$loadingImplCopyWith(
          _$loadingImpl value, $Res Function(_$loadingImpl) then) =
      __$$loadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$loadingImplCopyWithImpl<$Res>
    extends _$ScheduleEventCopyWithImpl<$Res, _$loadingImpl>
    implements _$$loadingImplCopyWith<$Res> {
  __$$loadingImplCopyWithImpl(
      _$loadingImpl _value, $Res Function(_$loadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$loadingImpl implements _loading {
  const _$loadingImpl();

  @override
  String toString() {
    return 'ScheduleEvent.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$loadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(ScheduleDay scheduleDay) setDay,
    required TResult Function() saved,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(ScheduleDay scheduleDay)? setDay,
    TResult? Function()? saved,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(ScheduleDay scheduleDay)? setDay,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init value) init,
    required TResult Function(_loading value) loading,
    required TResult Function(_loaded value) loaded,
    required TResult Function(_setDay value) setDay,
    required TResult Function(_saved value) saved,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_init value)? init,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loaded value)? loaded,
    TResult? Function(_setDay value)? setDay,
    TResult? Function(_saved value)? saved,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_init value)? init,
    TResult Function(_loading value)? loading,
    TResult Function(_loaded value)? loaded,
    TResult Function(_setDay value)? setDay,
    TResult Function(_saved value)? saved,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _loading implements ScheduleEvent {
  const factory _loading() = _$loadingImpl;
}

/// @nodoc
abstract class _$$loadedImplCopyWith<$Res> {
  factory _$$loadedImplCopyWith(
          _$loadedImpl value, $Res Function(_$loadedImpl) then) =
      __$$loadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$loadedImplCopyWithImpl<$Res>
    extends _$ScheduleEventCopyWithImpl<$Res, _$loadedImpl>
    implements _$$loadedImplCopyWith<$Res> {
  __$$loadedImplCopyWithImpl(
      _$loadedImpl _value, $Res Function(_$loadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$loadedImpl implements _loaded {
  const _$loadedImpl();

  @override
  String toString() {
    return 'ScheduleEvent.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$loadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(ScheduleDay scheduleDay) setDay,
    required TResult Function() saved,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(ScheduleDay scheduleDay)? setDay,
    TResult? Function()? saved,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(ScheduleDay scheduleDay)? setDay,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init value) init,
    required TResult Function(_loading value) loading,
    required TResult Function(_loaded value) loaded,
    required TResult Function(_setDay value) setDay,
    required TResult Function(_saved value) saved,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_init value)? init,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loaded value)? loaded,
    TResult? Function(_setDay value)? setDay,
    TResult? Function(_saved value)? saved,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_init value)? init,
    TResult Function(_loading value)? loading,
    TResult Function(_loaded value)? loaded,
    TResult Function(_setDay value)? setDay,
    TResult Function(_saved value)? saved,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _loaded implements ScheduleEvent {
  const factory _loaded() = _$loadedImpl;
}

/// @nodoc
abstract class _$$setDayImplCopyWith<$Res> {
  factory _$$setDayImplCopyWith(
          _$setDayImpl value, $Res Function(_$setDayImpl) then) =
      __$$setDayImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ScheduleDay scheduleDay});

  $ScheduleDayCopyWith<$Res> get scheduleDay;
}

/// @nodoc
class __$$setDayImplCopyWithImpl<$Res>
    extends _$ScheduleEventCopyWithImpl<$Res, _$setDayImpl>
    implements _$$setDayImplCopyWith<$Res> {
  __$$setDayImplCopyWithImpl(
      _$setDayImpl _value, $Res Function(_$setDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleDay = null,
  }) {
    return _then(_$setDayImpl(
      null == scheduleDay
          ? _value.scheduleDay
          : scheduleDay // ignore: cast_nullable_to_non_nullable
              as ScheduleDay,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ScheduleDayCopyWith<$Res> get scheduleDay {
    return $ScheduleDayCopyWith<$Res>(_value.scheduleDay, (value) {
      return _then(_value.copyWith(scheduleDay: value));
    });
  }
}

/// @nodoc

class _$setDayImpl implements _setDay {
  const _$setDayImpl(this.scheduleDay);

  @override
  final ScheduleDay scheduleDay;

  @override
  String toString() {
    return 'ScheduleEvent.setDay(scheduleDay: $scheduleDay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$setDayImpl &&
            (identical(other.scheduleDay, scheduleDay) ||
                other.scheduleDay == scheduleDay));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scheduleDay);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$setDayImplCopyWith<_$setDayImpl> get copyWith =>
      __$$setDayImplCopyWithImpl<_$setDayImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(ScheduleDay scheduleDay) setDay,
    required TResult Function() saved,
  }) {
    return setDay(scheduleDay);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(ScheduleDay scheduleDay)? setDay,
    TResult? Function()? saved,
  }) {
    return setDay?.call(scheduleDay);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(ScheduleDay scheduleDay)? setDay,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (setDay != null) {
      return setDay(scheduleDay);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init value) init,
    required TResult Function(_loading value) loading,
    required TResult Function(_loaded value) loaded,
    required TResult Function(_setDay value) setDay,
    required TResult Function(_saved value) saved,
  }) {
    return setDay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_init value)? init,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loaded value)? loaded,
    TResult? Function(_setDay value)? setDay,
    TResult? Function(_saved value)? saved,
  }) {
    return setDay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_init value)? init,
    TResult Function(_loading value)? loading,
    TResult Function(_loaded value)? loaded,
    TResult Function(_setDay value)? setDay,
    TResult Function(_saved value)? saved,
    required TResult orElse(),
  }) {
    if (setDay != null) {
      return setDay(this);
    }
    return orElse();
  }
}

abstract class _setDay implements ScheduleEvent {
  const factory _setDay(final ScheduleDay scheduleDay) = _$setDayImpl;

  ScheduleDay get scheduleDay;
  @JsonKey(ignore: true)
  _$$setDayImplCopyWith<_$setDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$savedImplCopyWith<$Res> {
  factory _$$savedImplCopyWith(
          _$savedImpl value, $Res Function(_$savedImpl) then) =
      __$$savedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$savedImplCopyWithImpl<$Res>
    extends _$ScheduleEventCopyWithImpl<$Res, _$savedImpl>
    implements _$$savedImplCopyWith<$Res> {
  __$$savedImplCopyWithImpl(
      _$savedImpl _value, $Res Function(_$savedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$savedImpl implements _saved {
  const _$savedImpl();

  @override
  String toString() {
    return 'ScheduleEvent.saved()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$savedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function(ScheduleDay scheduleDay) setDay,
    required TResult Function() saved,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function(ScheduleDay scheduleDay)? setDay,
    TResult? Function()? saved,
  }) {
    return saved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function(ScheduleDay scheduleDay)? setDay,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_init value) init,
    required TResult Function(_loading value) loading,
    required TResult Function(_loaded value) loaded,
    required TResult Function(_setDay value) setDay,
    required TResult Function(_saved value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_init value)? init,
    TResult? Function(_loading value)? loading,
    TResult? Function(_loaded value)? loaded,
    TResult? Function(_setDay value)? setDay,
    TResult? Function(_saved value)? saved,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_init value)? init,
    TResult Function(_loading value)? loading,
    TResult Function(_loaded value)? loaded,
    TResult Function(_setDay value)? setDay,
    TResult Function(_saved value)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _saved implements ScheduleEvent {
  const factory _saved() = _$savedImpl;
}
