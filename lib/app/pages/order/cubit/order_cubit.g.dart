// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderStateImpl _$$OrderStateImplFromJson(Map<String, dynamic> json) =>
    _$OrderStateImpl(
      ordersPage: json['ordersPage'] == null
          ? const PaginatedData()
          : PaginatedData<Order>.fromJson(
              json['ordersPage'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$OrderStateImplToJson(_$OrderStateImpl instance) =>
    <String, dynamic>{
      'ordersPage': instance.ordersPage,
    };
