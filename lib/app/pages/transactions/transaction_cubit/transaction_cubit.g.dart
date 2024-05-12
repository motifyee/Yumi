// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionStateImpl _$$TransactionStateImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionStateImpl(
      transaction: (json['transaction'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      loading: json['loading'] as bool?,
    );

Map<String, dynamic> _$$TransactionStateImplToJson(
        _$TransactionStateImpl instance) =>
    <String, dynamic>{
      'transaction': instance.transaction,
      'loading': instance.loading,
    };
