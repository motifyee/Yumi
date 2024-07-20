// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      id: json['id'] as String? ?? '',
      code: json['code'] as String? ?? '',
      buddiesUserId: json['buddies_User_ID'] as String? ?? '',
      customerName: json['customerName'] as String? ?? '',
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      reviewComment: json['review_Comment'] as String? ?? '',
      chef: json['chef'] == null
          ? null
          : Chef.fromJson(json['chef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'buddies_User_ID': instance.buddiesUserId,
      'rate': instance.rate,
      'review_Comment': instance.reviewComment,
    };
