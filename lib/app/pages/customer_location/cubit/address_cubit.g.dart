// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressStateImpl _$$AddressStateImplFromJson(Map<String, dynamic> json) =>
    _$AddressStateImpl(
      pagination: PaginatedData<Address>.fromJson(
          json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddressStateImplToJson(_$AddressStateImpl instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
    };
