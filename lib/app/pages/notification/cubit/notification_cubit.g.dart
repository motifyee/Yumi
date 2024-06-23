// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationStateImpl _$$NotificationStateImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationStateImpl(
      pagination: Pager<NotificationS>.fromJson(
          json['pagination'] as Map<String, dynamic>),
      isNewNotification: json['isNewNotification'] as bool,
    );

Map<String, dynamic> _$$NotificationStateImplToJson(
        _$NotificationStateImpl instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'isNewNotification': instance.isNewNotification,
    };
