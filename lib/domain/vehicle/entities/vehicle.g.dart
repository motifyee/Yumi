// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleImpl _$$VehicleImplFromJson(Map<String, dynamic> json) =>
    _$VehicleImpl(
      code: json['code'] as String?,
      typeCode: (json['vehicle_Type'] as num).toInt(),
      otherType: json['other_Type'] as String?,
    );

Map<String, dynamic> _$$VehicleImplToJson(_$VehicleImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'vehicle_Type': instance.typeCode,
      'other_Type': instance.otherType,
    };
