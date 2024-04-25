// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CaloriesImpl _$$CaloriesImplFromJson(Map<String, dynamic> json) =>
    _$CaloriesImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      caloriesValue: (json['calories_Value'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$CaloriesImplToJson(_$CaloriesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'calories_Value': instance.caloriesValue,
    };
