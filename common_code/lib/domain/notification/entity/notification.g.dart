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
      'createDate':
          const DateTimeToIso8601StringConverter().toJson(instance.createDate),
      'description': instance.description,
      'type_ID': instance.typeID,
      'driver_ID': instance.driverID,
      'chef_ID': instance.chefID,
      'client_ID': instance.clientID,
      'employee_ID': instance.employeeID,
    };
