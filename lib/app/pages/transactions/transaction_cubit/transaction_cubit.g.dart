// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionStateImpl _$$TransactionStateImplFromJson(
  Map<String, dynamic> json,
) =>
    _$TransactionStateImpl(
      pagination: PaginatedData<Transaction>.fromJson(
        json['pagination'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$TransactionStateImplToJson(
  _$TransactionStateImpl instance,
) =>
    <String, dynamic>{
      'pagination': instance.pagination,
    };
