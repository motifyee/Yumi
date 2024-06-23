// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderStateImpl _$$OrderStateImplFromJson(Map<String, dynamic> json) =>
    _$OrderStateImpl(
      pagination: Pagination<Order>.fromJson(
          json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderStateImplToJson(_$OrderStateImpl instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
    };
