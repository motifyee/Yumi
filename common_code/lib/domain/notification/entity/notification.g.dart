// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationSImpl _$$NotificationSImplFromJson(Map<String, dynamic> json) =>
    _$NotificationSImpl(
      id: json['id'] as String,
      notificationType: const NotificationTypeConverter()
          .fromJson(json['notificationType'] as String),
      yumiStatus: _$JsonConverterFromJson<String, YumiStatus>(
              json['yumiStatus'],
              const NotificationStatusConverter().fromJson) ??
          YumiStatus.GeneralNotification,
      createDate: const DateTimeToIso8601StringConverter()
          .fromJson(json['createDate'] as String),
      description: json['description'] as String,
      typeID: (json['type_ID'] as num?)?.toInt(),
      driverID: json['driver_ID'] as String?,
      chefID: json['chef_ID'] as String?,
      clientID: json['client_ID'] as String?,
      employeeID: (json['employee_ID'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NotificationSImplToJson(_$NotificationSImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notificationType':
          const NotificationTypeConverter().toJson(instance.notificationType),
      'yumiStatus': _$JsonConverterToJson<String, YumiStatus>(
          instance.yumiStatus, const NotificationStatusConverter().toJson),
      'createDate':
          const DateTimeToIso8601StringConverter().toJson(instance.createDate),
      'description': instance.description,
      'type_ID': instance.typeID,
      'driver_ID': instance.driverID,
      'chef_ID': instance.chefID,
      'client_ID': instance.clientID,
      'employee_ID': instance.employeeID,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
