// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: json['id'] as String,
      notificationType: const NotificationTypeConverter()
          .fromJson(json['notificationType'] as String),
      date: const DateTimeToIso8601StringConverter()
          .fromJson(json['date'] as String),
      description: json['description'] as String,
      typeID: json['type_ID'] as int,
      driverID: json['driver_ID'] as String?,
      chefID: json['chef_ID'] as String?,
      clientID: json['client_ID'] as String?,
      employeeID: json['employee_ID'] as int?,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notificationType':
          const NotificationTypeConverter().toJson(instance.notificationType),
      'date': const DateTimeToIso8601StringConverter().toJson(instance.date),
      'description': instance.description,
      'type_ID': instance.typeID,
      'driver_ID': instance.driverID,
      'chef_ID': instance.chefID,
      'client_ID': instance.clientID,
      'employee_ID': instance.employeeID,
    };
