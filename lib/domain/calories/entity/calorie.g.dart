// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calorie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalorieImpl _$$CalorieImplFromJson(Map<String, dynamic> json) =>
    _$CalorieImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      caloriesValue: (json['calories_Value'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$CalorieImplToJson(_$CalorieImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'calories_Value': instance.caloriesValue,
    };
