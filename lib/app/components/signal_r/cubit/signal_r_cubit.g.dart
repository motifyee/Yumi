// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signal_r_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignalRStateImpl _$$SignalRStateImplFromJson(Map<String, dynamic> json) =>
    _$SignalRStateImpl(
      signals: (json['signals'] as List<dynamic>)
          .map((e) => SignalRM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SignalRStateImplToJson(_$SignalRStateImpl instance) =>
    <String, dynamic>{
      'signals': instance.signals,
    };
