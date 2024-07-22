// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Review _$ReviewFromJson(Map<String, dynamic> json) {
  return _Review.fromJson(json);
}

/// @nodoc
mixin _$Review {
  String get id => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError; //
  @JsonKey(name: 'buddies_User_ID')
  String get buddiesUserId => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'review_Comment')
  String get comment => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  Chef? get chef => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewCopyWith<Review> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewCopyWith<$Res> {
  factory $ReviewCopyWith(Review value, $Res Function(Review) then) =
      _$ReviewCopyWithImpl<$Res, Review>;
  @useResult
  $Res call(
      {String id,
      String code,
      @JsonKey(name: 'buddies_User_ID') String buddiesUserId,
      String customerName,
      double rate,
      @JsonKey(name: 'review_Comment') String comment,
      @JsonKey(includeToJson: false) Chef? chef});

  $ChefCopyWith<$Res>? get chef;
}

/// @nodoc
class _$ReviewCopyWithImpl<$Res, $Val extends Review>
    implements $ReviewCopyWith<$Res> {
  _$ReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? buddiesUserId = null,
    Object? customerName = null,
    Object? rate = null,
    Object? comment = null,
    Object? chef = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      buddiesUserId: null == buddiesUserId
          ? _value.buddiesUserId
          : buddiesUserId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      chef: freezed == chef
          ? _value.chef
          : chef // ignore: cast_nullable_to_non_nullable
              as Chef?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChefCopyWith<$Res>? get chef {
    if (_value.chef == null) {
      return null;
    }

    return $ChefCopyWith<$Res>(_value.chef!, (value) {
      return _then(_value.copyWith(chef: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewImplCopyWith<$Res> implements $ReviewCopyWith<$Res> {
  factory _$$ReviewImplCopyWith(
          _$ReviewImpl value, $Res Function(_$ReviewImpl) then) =
      __$$ReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String code,
      @JsonKey(name: 'buddies_User_ID') String buddiesUserId,
      String customerName,
      double rate,
      @JsonKey(name: 'review_Comment') String comment,
      @JsonKey(includeToJson: false) Chef? chef});

  @override
  $ChefCopyWith<$Res>? get chef;
}

/// @nodoc
class __$$ReviewImplCopyWithImpl<$Res>
    extends _$ReviewCopyWithImpl<$Res, _$ReviewImpl>
    implements _$$ReviewImplCopyWith<$Res> {
  __$$ReviewImplCopyWithImpl(
      _$ReviewImpl _value, $Res Function(_$ReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? buddiesUserId = null,
    Object? customerName = null,
    Object? rate = null,
    Object? comment = null,
    Object? chef = freezed,
  }) {
    return _then(_$ReviewImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      buddiesUserId: null == buddiesUserId
          ? _value.buddiesUserId
          : buddiesUserId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      chef: freezed == chef
          ? _value.chef
          : chef // ignore: cast_nullable_to_non_nullable
              as Chef?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewImpl extends _Review {
  const _$ReviewImpl(
      {this.id = '',
      this.code = '',
      @JsonKey(name: 'buddies_User_ID') this.buddiesUserId = '',
      this.customerName = '',
      this.rate = 0,
      @JsonKey(name: 'review_Comment') this.comment = '',
      @JsonKey(includeToJson: false) this.chef})
      : super._();

  factory _$ReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String code;
//
  @override
  @JsonKey(name: 'buddies_User_ID')
  final String buddiesUserId;
  @override
  @JsonKey()
  final String customerName;
  @override
  @JsonKey()
  final double rate;
  @override
  @JsonKey(name: 'review_Comment')
  final String comment;
  @override
  @JsonKey(includeToJson: false)
  final Chef? chef;

  @override
  String toString() {
    return 'Review(id: $id, code: $code, buddiesUserId: $buddiesUserId, customerName: $customerName, rate: $rate, comment: $comment, chef: $chef)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.buddiesUserId, buddiesUserId) ||
                other.buddiesUserId == buddiesUserId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.chef, chef) || other.chef == chef));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, code, buddiesUserId, customerName, rate, comment, chef);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      __$$ReviewImplCopyWithImpl<_$ReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewImplToJson(
      this,
    );
  }
}

abstract class _Review extends Review {
  const factory _Review(
      {final String id,
      final String code,
      @JsonKey(name: 'buddies_User_ID') final String buddiesUserId,
      final String customerName,
      final double rate,
      @JsonKey(name: 'review_Comment') final String comment,
      @JsonKey(includeToJson: false) final Chef? chef}) = _$ReviewImpl;
  const _Review._() : super._();

  factory _Review.fromJson(Map<String, dynamic> json) = _$ReviewImpl.fromJson;

  @override
  String get id;
  @override
  String get code;
  @override //
  @JsonKey(name: 'buddies_User_ID')
  String get buddiesUserId;
  @override
  String get customerName;
  @override
  double get rate;
  @override
  @JsonKey(name: 'review_Comment')
  String get comment;
  @override
  @JsonKey(includeToJson: false)
  Chef? get chef;
  @override
  @JsonKey(ignore: true)
  _$$ReviewImplCopyWith<_$ReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
