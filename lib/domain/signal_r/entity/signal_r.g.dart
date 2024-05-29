// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signal_r.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignalRMImpl _$$SignalRMImplFromJson(Map<String, dynamic> json) =>
    _$SignalRMImpl(
      type: $enumDecode(_$SignalsEnumMap, json['type']),
      message: json['message'],
    );

Map<String, dynamic> _$$SignalRMImplToJson(_$SignalRMImpl instance) =>
    <String, dynamic>{
      'type': _$SignalsEnumMap[instance.type]!,
      'message': instance.message,
    };

const _$SignalsEnumMap = {
  Signals.sendmessage: 'sendmessage',
  Signals.receivemessage: 'receivemessage',
  Signals.updatechefstatus: 'updatechefstatus',
  Signals.updatedriverstatus: 'updatedriverstatus',
  Signals.cusotmertransaction: 'cusotmertransaction',
  Signals.neworderreceived: 'neworderreceived',
  Signals.chefaccept: 'chefaccept',
  Signals.driveraccept: 'driveraccept',
  Signals.chefstart: 'chefstart',
  Signals.cheffinished: 'cheffinished',
  Signals.driverreceived: 'driverreceived',
  Signals.clientreceived: 'clientreceived',
  Signals.clientcancel: 'clientcancel',
  Signals.clientwait: 'clientwait',
  Signals.notification: 'notification',
  Signals.start: 'start',
  Signals.stop: 'stop',
};
