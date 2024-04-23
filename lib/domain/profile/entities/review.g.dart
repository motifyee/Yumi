// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      id: json['id'] as String? ?? '',
      code: json['code'] as String? ?? '',
      customerId: json['buddies_User_ID'] as String? ?? '',
      customerName: json['customerName'] as String? ?? '',
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
      comment: json['review_Comment'] as String? ?? '',
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'buddies_User_ID': instance.customerId,
      'customerName': instance.customerName,
      'rate': instance.rate,
      'review_Comment': instance.comment,
    };
