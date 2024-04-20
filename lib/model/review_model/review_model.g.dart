// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      id: json['id'] as String? ?? '',
      buddiesUserId: json['buddies_User_ID'] as String? ?? '',
      code: json['code'] as String? ?? '',
      reviewComment: json['review_Comment'] as String? ?? '',
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      customerName: json['customerName'] as String? ?? '',
      chef: json['chef'] == null
          ? null
          : ChefModel.fromJson(json['chef'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buddies_User_ID': instance.buddiesUserId,
      'code': instance.code,
      'review_Comment': instance.reviewComment,
      'rate': instance.rate,
    };
