// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationSImpl _$$NotificationSImplFromJson(Map<String, dynamic> json) =>
    _$NotificationSImpl(
      id: json['id'] as String,
      notificationType:
          $enumDecode(_$NotificationTypeEnumEnumMap, json['notificationType']),
      yumiStatus: $enumDecodeNullable(_$YumiStatusEnumMap, json['yumiStatus']),
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
          _$NotificationTypeEnumEnumMap[instance.notificationType]!,
      'yumiStatus': _$YumiStatusEnumMap[instance.yumiStatus],
      'createDate':
          const DateTimeToIso8601StringConverter().toJson(instance.createDate),
      'description': instance.description,
      'type_ID': instance.typeID,
      'driver_ID': instance.driverID,
      'chef_ID': instance.chefID,
      'client_ID': instance.clientID,
      'employee_ID': instance.employeeID,
    };

const _$NotificationTypeEnumEnumMap = {
  NotificationTypeEnum.GeneralNotification: 'GeneralNotification',
  NotificationTypeEnum.DeliveryOrder: 'DeliveryOrder',
  NotificationTypeEnum.DeliveryPreOrder: 'DeliveryPreOrder',
  NotificationTypeEnum.PickupPreOrder: 'PickupPreOrder',
  NotificationTypeEnum.PickupOrder: 'PickupOrder',
  NotificationTypeEnum.FinishOrder: 'FinishOrder',
  NotificationTypeEnum.AccountApproved: 'AccountApproved',
  NotificationTypeEnum.AccountContractApproved: 'AccountContractApproved',
};

const _$YumiStatusEnumMap = {
  YumiStatus.GeneralNotification: 'GeneralNotification',
  YumiStatus.NewOrderReceived: 'NewOrderReceived',
  YumiStatus.DriverAccept: 'DriverAccept',
  YumiStatus.ChefAccept: 'ChefAccept',
  YumiStatus.ChefStart: 'ChefStart',
  YumiStatus.ChefFinished: 'ChefFinished',
  YumiStatus.DriverReceived: 'DriverReceived',
  YumiStatus.ClientReceivedOrder: 'ClientReceivedOrder',
  YumiStatus.SystemCancelChefDelayed: 'SystemCancelChefDelayed',
  YumiStatus.SystemCancelDriverDelayed: 'SystemCancelDriverDelayed',
  YumiStatus.DriverDelayedCustomerWaitDriverOrCancel:
      'DriverDelayedCustomerWaitDriverOrCancel',
  YumiStatus.DriverPenalty: 'DriverPenalty',
  YumiStatus.ChefPenalty: 'ChefPenalty',
  YumiStatus.DriverBonus: 'DriverBonus',
  YumiStatus.CustomerBonus: 'CustomerBonus',
  YumiStatus.CustomerRefund: 'CustomerRefund',
  YumiStatus.ChefReceivedMoney: 'ChefReceivedMoney',
  YumiStatus.AccountApproved: 'AccountApproved',
  YumiStatus.ContractApproved: 'ContractApproved',
  YumiStatus.CustomerCancelChefDelayed: 'CustomerCancelChefDelayed',
  YumiStatus.CustomerCancelDriverDelayed: 'CustomerCancelDriverDelayed',
  YumiStatus.CustomerWaitChefDelayed: 'CustomerWaitChefDelayed',
  YumiStatus.CustomerWaitDriverDelayed: 'CustomerWaitDriverDelayed',
  YumiStatus.DriverReceivedMoney: 'DriverReceivedMoney',
  YumiStatus.SystemCancelNoDriverAccept: 'SystemCancelNoDriverAccept',
};
