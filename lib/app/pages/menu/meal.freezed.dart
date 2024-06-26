// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Meal _$MealFromJson(Map<String, dynamic> json) {
  return _Meal.fromJson(json);
}

/// @nodoc
mixin _$Meal {
  int? get id => throw _privateConstructorUsedError;
  int? get productVariantID => throw _privateConstructorUsedError;
  String? get chefId => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  double? get price1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'calories_Value')
  double? get caloriesValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'portion_Persons')
  double? get portionPersons => throw _privateConstructorUsedError;
  @JsonKey(name: 'preparation_time')
  double? get preparationTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_Order')
  bool? get isOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_Pre_Order')
  bool? get isPreOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'pickup_Only')
  bool? get isPickUpOnly => throw _privateConstructorUsedError;
  @JsonKey(name: 'categoriesIds')
  List<int>? get categoryIds => throw _privateConstructorUsedError;
  List<Ingredient>? get ingredients => throw _privateConstructorUsedError;
  bool? get isFavoritProduct => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MealCopyWith<Meal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealCopyWith<$Res> {
  factory $MealCopyWith(Meal value, $Res Function(Meal) then) =
      _$MealCopyWithImpl<$Res, Meal>;
  @useResult
  $Res call(
      {int? id,
      int? productVariantID,
      String? chefId,
      String? code,
      String? name,
      String? photo,
      double? price1,
      @JsonKey(name: 'calories_Value') double? caloriesValue,
      @JsonKey(name: 'portion_Persons') double? portionPersons,
      @JsonKey(name: 'preparation_time') double? preparationTime,
      @JsonKey(name: 'is_Order') bool? isOrder,
      @JsonKey(name: 'is_Pre_Order') bool? isPreOrder,
      @JsonKey(name: 'pickup_Only') bool? isPickUpOnly,
      @JsonKey(name: 'categoriesIds') List<int>? categoryIds,
      List<Ingredient>? ingredients,
      bool? isFavoritProduct});
}

/// @nodoc
class _$MealCopyWithImpl<$Res, $Val extends Meal>
    implements $MealCopyWith<$Res> {
  _$MealCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productVariantID = freezed,
    Object? chefId = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? photo = freezed,
    Object? price1 = freezed,
    Object? caloriesValue = freezed,
    Object? portionPersons = freezed,
    Object? preparationTime = freezed,
    Object? isOrder = freezed,
    Object? isPreOrder = freezed,
    Object? isPickUpOnly = freezed,
    Object? categoryIds = freezed,
    Object? ingredients = freezed,
    Object? isFavoritProduct = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productVariantID: freezed == productVariantID
          ? _value.productVariantID
          : productVariantID // ignore: cast_nullable_to_non_nullable
              as int?,
      chefId: freezed == chefId
          ? _value.chefId
          : chefId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      price1: freezed == price1
          ? _value.price1
          : price1 // ignore: cast_nullable_to_non_nullable
              as double?,
      caloriesValue: freezed == caloriesValue
          ? _value.caloriesValue
          : caloriesValue // ignore: cast_nullable_to_non_nullable
              as double?,
      portionPersons: freezed == portionPersons
          ? _value.portionPersons
          : portionPersons // ignore: cast_nullable_to_non_nullable
              as double?,
      preparationTime: freezed == preparationTime
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as double?,
      isOrder: freezed == isOrder
          ? _value.isOrder
          : isOrder // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPreOrder: freezed == isPreOrder
          ? _value.isPreOrder
          : isPreOrder // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPickUpOnly: freezed == isPickUpOnly
          ? _value.isPickUpOnly
          : isPickUpOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      categoryIds: freezed == categoryIds
          ? _value.categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      ingredients: freezed == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>?,
      isFavoritProduct: freezed == isFavoritProduct
          ? _value.isFavoritProduct
          : isFavoritProduct // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealImplCopyWith<$Res> implements $MealCopyWith<$Res> {
  factory _$$MealImplCopyWith(
          _$MealImpl value, $Res Function(_$MealImpl) then) =
      __$$MealImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? productVariantID,
      String? chefId,
      String? code,
      String? name,
      String? photo,
      double? price1,
      @JsonKey(name: 'calories_Value') double? caloriesValue,
      @JsonKey(name: 'portion_Persons') double? portionPersons,
      @JsonKey(name: 'preparation_time') double? preparationTime,
      @JsonKey(name: 'is_Order') bool? isOrder,
      @JsonKey(name: 'is_Pre_Order') bool? isPreOrder,
      @JsonKey(name: 'pickup_Only') bool? isPickUpOnly,
      @JsonKey(name: 'categoriesIds') List<int>? categoryIds,
      List<Ingredient>? ingredients,
      bool? isFavoritProduct});
}

/// @nodoc
class __$$MealImplCopyWithImpl<$Res>
    extends _$MealCopyWithImpl<$Res, _$MealImpl>
    implements _$$MealImplCopyWith<$Res> {
  __$$MealImplCopyWithImpl(_$MealImpl _value, $Res Function(_$MealImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productVariantID = freezed,
    Object? chefId = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? photo = freezed,
    Object? price1 = freezed,
    Object? caloriesValue = freezed,
    Object? portionPersons = freezed,
    Object? preparationTime = freezed,
    Object? isOrder = freezed,
    Object? isPreOrder = freezed,
    Object? isPickUpOnly = freezed,
    Object? categoryIds = freezed,
    Object? ingredients = freezed,
    Object? isFavoritProduct = freezed,
  }) {
    return _then(_$MealImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productVariantID: freezed == productVariantID
          ? _value.productVariantID
          : productVariantID // ignore: cast_nullable_to_non_nullable
              as int?,
      chefId: freezed == chefId
          ? _value.chefId
          : chefId // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      price1: freezed == price1
          ? _value.price1
          : price1 // ignore: cast_nullable_to_non_nullable
              as double?,
      caloriesValue: freezed == caloriesValue
          ? _value.caloriesValue
          : caloriesValue // ignore: cast_nullable_to_non_nullable
              as double?,
      portionPersons: freezed == portionPersons
          ? _value.portionPersons
          : portionPersons // ignore: cast_nullable_to_non_nullable
              as double?,
      preparationTime: freezed == preparationTime
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as double?,
      isOrder: freezed == isOrder
          ? _value.isOrder
          : isOrder // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPreOrder: freezed == isPreOrder
          ? _value.isPreOrder
          : isPreOrder // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPickUpOnly: freezed == isPickUpOnly
          ? _value.isPickUpOnly
          : isPickUpOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
      categoryIds: freezed == categoryIds
          ? _value._categoryIds
          : categoryIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      ingredients: freezed == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>?,
      isFavoritProduct: freezed == isFavoritProduct
          ? _value.isFavoritProduct
          : isFavoritProduct // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealImpl implements _Meal {
  const _$MealImpl(
      {this.id,
      this.productVariantID,
      this.chefId,
      this.code,
      this.name,
      this.photo,
      this.price1,
      @JsonKey(name: 'calories_Value') this.caloriesValue,
      @JsonKey(name: 'portion_Persons') this.portionPersons,
      @JsonKey(name: 'preparation_time') this.preparationTime,
      @JsonKey(name: 'is_Order') this.isOrder,
      @JsonKey(name: 'is_Pre_Order') this.isPreOrder,
      @JsonKey(name: 'pickup_Only') this.isPickUpOnly,
      @JsonKey(name: 'categoriesIds') final List<int>? categoryIds,
      final List<Ingredient>? ingredients,
      this.isFavoritProduct})
      : _categoryIds = categoryIds,
        _ingredients = ingredients;

  factory _$MealImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealImplFromJson(json);

  @override
  final int? id;
  @override
  final int? productVariantID;
  @override
  final String? chefId;
  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? photo;
  @override
  final double? price1;
  @override
  @JsonKey(name: 'calories_Value')
  final double? caloriesValue;
  @override
  @JsonKey(name: 'portion_Persons')
  final double? portionPersons;
  @override
  @JsonKey(name: 'preparation_time')
  final double? preparationTime;
  @override
  @JsonKey(name: 'is_Order')
  final bool? isOrder;
  @override
  @JsonKey(name: 'is_Pre_Order')
  final bool? isPreOrder;
  @override
  @JsonKey(name: 'pickup_Only')
  final bool? isPickUpOnly;
  final List<int>? _categoryIds;
  @override
  @JsonKey(name: 'categoriesIds')
  List<int>? get categoryIds {
    final value = _categoryIds;
    if (value == null) return null;
    if (_categoryIds is EqualUnmodifiableListView) return _categoryIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Ingredient>? _ingredients;
  @override
  List<Ingredient>? get ingredients {
    final value = _ingredients;
    if (value == null) return null;
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isFavoritProduct;

  @override
  String toString() {
    return 'Meal(id: $id, productVariantID: $productVariantID, chefId: $chefId, code: $code, name: $name, photo: $photo, price1: $price1, caloriesValue: $caloriesValue, portionPersons: $portionPersons, preparationTime: $preparationTime, isOrder: $isOrder, isPreOrder: $isPreOrder, isPickUpOnly: $isPickUpOnly, categoryIds: $categoryIds, ingredients: $ingredients, isFavoritProduct: $isFavoritProduct)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.productVariantID, productVariantID) ||
                other.productVariantID == productVariantID) &&
            (identical(other.chefId, chefId) || other.chefId == chefId) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.price1, price1) || other.price1 == price1) &&
            (identical(other.caloriesValue, caloriesValue) ||
                other.caloriesValue == caloriesValue) &&
            (identical(other.portionPersons, portionPersons) ||
                other.portionPersons == portionPersons) &&
            (identical(other.preparationTime, preparationTime) ||
                other.preparationTime == preparationTime) &&
            (identical(other.isOrder, isOrder) || other.isOrder == isOrder) &&
            (identical(other.isPreOrder, isPreOrder) ||
                other.isPreOrder == isPreOrder) &&
            (identical(other.isPickUpOnly, isPickUpOnly) ||
                other.isPickUpOnly == isPickUpOnly) &&
            const DeepCollectionEquality()
                .equals(other._categoryIds, _categoryIds) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.isFavoritProduct, isFavoritProduct) ||
                other.isFavoritProduct == isFavoritProduct));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      productVariantID,
      chefId,
      code,
      name,
      photo,
      price1,
      caloriesValue,
      portionPersons,
      preparationTime,
      isOrder,
      isPreOrder,
      isPickUpOnly,
      const DeepCollectionEquality().hash(_categoryIds),
      const DeepCollectionEquality().hash(_ingredients),
      isFavoritProduct);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MealImplCopyWith<_$MealImpl> get copyWith =>
      __$$MealImplCopyWithImpl<_$MealImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealImplToJson(
      this,
    );
  }
}

abstract class _Meal implements Meal {
  const factory _Meal(
      {final int? id,
      final int? productVariantID,
      final String? chefId,
      final String? code,
      final String? name,
      final String? photo,
      final double? price1,
      @JsonKey(name: 'calories_Value') final double? caloriesValue,
      @JsonKey(name: 'portion_Persons') final double? portionPersons,
      @JsonKey(name: 'preparation_time') final double? preparationTime,
      @JsonKey(name: 'is_Order') final bool? isOrder,
      @JsonKey(name: 'is_Pre_Order') final bool? isPreOrder,
      @JsonKey(name: 'pickup_Only') final bool? isPickUpOnly,
      @JsonKey(name: 'categoriesIds') final List<int>? categoryIds,
      final List<Ingredient>? ingredients,
      final bool? isFavoritProduct}) = _$MealImpl;

  factory _Meal.fromJson(Map<String, dynamic> json) = _$MealImpl.fromJson;

  @override
  int? get id;
  @override
  int? get productVariantID;
  @override
  String? get chefId;
  @override
  String? get code;
  @override
  String? get name;
  @override
  String? get photo;
  @override
  double? get price1;
  @override
  @JsonKey(name: 'calories_Value')
  double? get caloriesValue;
  @override
  @JsonKey(name: 'portion_Persons')
  double? get portionPersons;
  @override
  @JsonKey(name: 'preparation_time')
  double? get preparationTime;
  @override
  @JsonKey(name: 'is_Order')
  bool? get isOrder;
  @override
  @JsonKey(name: 'is_Pre_Order')
  bool? get isPreOrder;
  @override
  @JsonKey(name: 'pickup_Only')
  bool? get isPickUpOnly;
  @override
  @JsonKey(name: 'categoriesIds')
  List<int>? get categoryIds;
  @override
  List<Ingredient>? get ingredients;
  @override
  bool? get isFavoritProduct;
  @override
  @JsonKey(ignore: true)
  _$$MealImplCopyWith<_$MealImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
