// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealImpl _$$MealImplFromJson(Map<String, dynamic> json) => _$MealImpl(
      id: (json['id'] as num?)?.toInt(),
      productVariantID: (json['productVariantID'] as num?)?.toInt(),
      chefId: json['chefId'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      price1: json['price1'] as String?,
      caloriesValue: json['calories_Value'] as String?,
      preparationTime: json['preparation_time'] as String?,
      isOrder: json['is_Order'] as bool?,
      isPreOrder: json['is_Pre_Order'] as bool?,
      isPickUpOnly: json['pickup_Only'] as bool?,
      portionPersons: json['portion_Persons'] as String?,
      categoriesIds: (json['categoriesIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredients.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavoriteProduct: json['isFavoritProduct'] as bool? ?? false,
    );

Map<String, dynamic> _$$MealImplToJson(_$MealImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productVariantID': instance.productVariantID,
      'chefId': instance.chefId,
      'code': instance.code,
      'name': instance.name,
      'photo': instance.photo,
      'price1': instance.price1,
      'calories_Value': instance.caloriesValue,
      'preparation_time': instance.preparationTime,
      'is_Order': instance.isOrder,
      'is_Pre_Order': instance.isPreOrder,
      'pickup_Only': instance.isPickUpOnly,
      'portion_Persons': instance.portionPersons,
      'categoriesIds': instance.categoriesIds,
      'ingredients': instance.ingredients,
      'isFavoritProduct': instance.isFavoriteProduct,
    };
