// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IngredientsImpl _$$IngredientsImplFromJson(Map<String, dynamic> json) =>
    _$IngredientsImpl(
      id: json['id'] as String?,
      code: json['code'] as String?,
      name: json['name'] as String?,
      portionGrams: (json['portion_Grams'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$IngredientsImplToJson(_$IngredientsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'portion_Grams': instance.portionGrams,
    };
