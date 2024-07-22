// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewImpl _$$ReviewImplFromJson(Map<String, dynamic> json) => _$ReviewImpl(
      id: json['id'] as String? ?? '',
      code: json['code'] as String? ?? '',
      buddiesUserId: json['buddies_User_ID'] as String? ?? '',
      customerName: json['customerName'] as String? ?? '',
      rate: (json['rate'] as num?)?.toDouble() ?? 0,
      comment: json['review_Comment'] as String? ?? '',
      chef: json['chef'] == null
          ? null
          : Chef.fromJson(json['chef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReviewImplToJson(_$ReviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'buddies_User_ID': instance.buddiesUserId,
      'customerName': instance.customerName,
      'rate': instance.rate,
      'review_Comment': instance.comment,
    };
