// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) {
  return _ReviewModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'buddies_User_ID')
  String get buddiesUserId => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'review_Comment')
  String get reviewComment => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  Chef? get chef => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) then) =
      _$ReviewModelCopyWithImpl<$Res, ReviewModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'buddies_User_ID') String buddiesUserId,
      String code,
      @JsonKey(name: 'review_Comment') String reviewComment,
      double rate,
      @JsonKey(includeToJson: false) String customerName,
      @JsonKey(includeToJson: false) Chef? chef});

  $ChefCopyWith<$Res>? get chef;
}

/// @nodoc
class _$ReviewModelCopyWithImpl<$Res, $Val extends ReviewModel>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? buddiesUserId = null,
    Object? code = null,
    Object? reviewComment = null,
    Object? rate = null,
    Object? customerName = null,
    Object? chef = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      buddiesUserId: null == buddiesUserId
          ? _value.buddiesUserId
          : buddiesUserId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      reviewComment: null == reviewComment
          ? _value.reviewComment
          : reviewComment // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ReviewModelImplCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$$ReviewModelImplCopyWith(
          _$ReviewModelImpl value, $Res Function(_$ReviewModelImpl) then) =
      __$$ReviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'buddies_User_ID') String buddiesUserId,
      String code,
      @JsonKey(name: 'review_Comment') String reviewComment,
      double rate,
      @JsonKey(includeToJson: false) String customerName,
      @JsonKey(includeToJson: false) Chef? chef});

  @override
  $ChefCopyWith<$Res>? get chef;
}

/// @nodoc
class __$$ReviewModelImplCopyWithImpl<$Res>
    extends _$ReviewModelCopyWithImpl<$Res, _$ReviewModelImpl>
    implements _$$ReviewModelImplCopyWith<$Res> {
  __$$ReviewModelImplCopyWithImpl(
      _$ReviewModelImpl _value, $Res Function(_$ReviewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? buddiesUserId = null,
    Object? code = null,
    Object? reviewComment = null,
    Object? rate = null,
    Object? customerName = null,
    Object? chef = freezed,
  }) {
    return _then(_$ReviewModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      buddiesUserId: null == buddiesUserId
          ? _value.buddiesUserId
          : buddiesUserId // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      reviewComment: null == reviewComment
          ? _value.reviewComment
          : reviewComment // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
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
class _$ReviewModelImpl implements _ReviewModel {
  const _$ReviewModelImpl(
      {this.id = '',
      @JsonKey(name: 'buddies_User_ID') this.buddiesUserId = '',
      this.code = '',
      @JsonKey(name: 'review_Comment') this.reviewComment = '',
      this.rate = 0.0,
      @JsonKey(includeToJson: false) this.customerName = '',
      @JsonKey(includeToJson: false) this.chef});

  factory _$ReviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey(name: 'buddies_User_ID')
  final String buddiesUserId;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey(name: 'review_Comment')
  final String reviewComment;
  @override
  @JsonKey()
  final double rate;
  @override
  @JsonKey(includeToJson: false)
  final String customerName;
  @override
  @JsonKey(includeToJson: false)
  final Chef? chef;

  @override
  String toString() {
    return 'ReviewModel(id: $id, buddiesUserId: $buddiesUserId, code: $code, reviewComment: $reviewComment, rate: $rate, customerName: $customerName, chef: $chef)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.buddiesUserId, buddiesUserId) ||
                other.buddiesUserId == buddiesUserId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.reviewComment, reviewComment) ||
                other.reviewComment == reviewComment) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.chef, chef) || other.chef == chef));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, buddiesUserId, code,
      reviewComment, rate, customerName, chef);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      __$$ReviewModelImplCopyWithImpl<_$ReviewModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewModelImplToJson(
      this,
    );
  }
}

abstract class _ReviewModel implements ReviewModel {
  const factory _ReviewModel(
      {final String id,
      @JsonKey(name: 'buddies_User_ID') final String buddiesUserId,
      final String code,
      @JsonKey(name: 'review_Comment') final String reviewComment,
      final double rate,
      @JsonKey(includeToJson: false) final String customerName,
      @JsonKey(includeToJson: false) final Chef? chef}) = _$ReviewModelImpl;

  factory _ReviewModel.fromJson(Map<String, dynamic> json) =
      _$ReviewModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'buddies_User_ID')
  String get buddiesUserId;
  @override
  String get code;
  @override
  @JsonKey(name: 'review_Comment')
  String get reviewComment;
  @override
  double get rate;
  @override
  @JsonKey(includeToJson: false)
  String get customerName;
  @override
  @JsonKey(includeToJson: false)
  Chef? get chef;
  @override
  @JsonKey(ignore: true)
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
