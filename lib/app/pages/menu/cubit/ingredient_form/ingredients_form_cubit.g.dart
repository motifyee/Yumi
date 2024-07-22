// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients_form_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientsStateImpl _$$IngredientsStateImplFromJson(
        Map<String, dynamic> json) =>
    _$IngredientsStateImpl(
      ingredientsModelList: (json['ingredientsModelList'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$IngredientsStateImplToJson(
        _$IngredientsStateImpl instance) =>
    <String, dynamic>{
      'ingredientsModelList': instance.ingredientsModelList,
    };
