// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      code: json['code'] as String? ?? '',
      branchId: json['branchId'] as String? ?? '',
      guid: json['guid'] as String? ?? '',
      id: json['id'] as int? ?? 0,
      fullName: json['fullName'] as String? ?? '',
      userName: json['userName'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      profileImage: json['image_profile'] as String?,
      mobile: json['mobile'] as String? ?? '',
      email: json['email'] as String? ?? '',
      address: json['address'] as String? ?? '',
      about: json['about'] as String? ?? '',
      pickup: json['pickup'] as bool? ?? false,
      pickupOnly: json['pickupOnly'] as bool? ?? false,
      signupType: json['signupType'] as int? ?? 0,
      registerDate: json['registerDate'] as String? ?? '',
      status: json['status'] as bool? ?? false,
      country: json['country'] == null
          ? const Country()
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      updatedBy: json['updatedBy'] as String? ?? '',
      eventPhoto0: json['image_profile_1'] as String?,
      eventPhoto1: json['image_profile_2'] as String?,
      eventPhoto2: json['image_profile_3'] as String?,
      eventPhoto3: json['image_profile_4'] as String?,
      eventPhoto4: json['image_profile_5'] as String?,
      accountApproved: json['account_approved'] as bool? ?? false,
      isHygiene: json['is_hygiene'] as bool? ?? false,
      hygienePhoto: json['image_hygiene'] as String?,
      riskPhoto: json['image_risk'] as String?,
      registerationPhoto: json['image_authority_reg'] as String?,
      passportPhoto: json['image_passport'] as String?,
      nidPhoto: json['image_id'] as String?,
      contractPhoto: json['image_contract'] as String?,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'countryId': instance._countryId,
      'code': instance.code,
      'branchId': instance.branchId,
      'guid': instance.guid,
      'id': instance.id,
      'fullName': instance.fullName,
      'userName': instance.userName,
      'bio': instance.bio,
      'image_profile': instance.profileImage,
      'mobile': instance.mobile,
      'email': instance.email,
      'address': instance.address,
      'about': instance.about,
      'pickup': instance.pickup,
      'pickupOnly': instance.pickupOnly,
      'signupType': instance.signupType,
      'registerDate': instance.registerDate,
      'status': instance.status,
      'updatedBy': instance.updatedBy,
      'image_profile_1': instance.eventPhoto0,
      'image_profile_2': instance.eventPhoto1,
      'image_profile_3': instance.eventPhoto2,
      'image_profile_4': instance.eventPhoto3,
      'image_profile_5': instance.eventPhoto4,
      'account_approved': instance.accountApproved,
      'is_hygiene': instance.isHygiene,
      'image_hygiene': instance.hygienePhoto,
      'image_risk': instance.riskPhoto,
      'image_authority_reg': instance.registerationPhoto,
      'image_passport': instance.passportPhoto,
      'image_id': instance.nidPhoto,
      'image_contract': instance.contractPhoto,
    };
