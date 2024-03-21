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
      profileImage: json['image_Profile'] as String?,
      mobile: json['mobile'] as String? ?? '',
      email: json['email'] as String? ?? '',
      address: json['address'] as String? ?? '',
      about: json['about'] as String? ?? '',
      pickup: json['pickup_Allowed'] as bool? ?? false,
      pickupOnly: json['pickup_Only'] as bool? ?? false,
      signupType: json['signupType'] as int? ?? 0,
      registerDate: json['registerDate'] as String? ?? '',
      status: json['status'] as bool? ?? false,
      country: json['country'] == null
          ? const Country()
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      updatedBy: json['updatedBy'] as String? ?? '',
      eventPhoto0: json['image_Profile_1'] as String?,
      eventPhoto1: json['image_Profile_2'] as String?,
      eventPhoto2: json['image_Profile_3'] as String?,
      eventPhoto3: json['image_Profile_4'] as String?,
      eventPhoto4: json['image_Profile_5'] as String?,
      accountApproved: json['account_Approved'] as bool? ?? false,
      isHygiene: json['is_Hygiene'] as bool? ?? false,
      hygienePhoto: json['image_Hygiene'] as String?,
      riskPhoto: json['image_Risk'] as String?,
      registerationPhoto: json['image_Authority_Reg'] as String?,
      passportPhoto: json['image_Passport'] as String?,
      nidPhoto: json['image_Id'] as String?,
      contractPhoto: json['image_Contract'] as String?,
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
      'image_Profile': instance.profileImage,
      'mobile': instance.mobile,
      'email': instance.email,
      'address': instance.address,
      'about': instance.about,
      'pickup_Allowed': instance.pickup,
      'pickup_Only': instance.pickupOnly,
      'signupType': instance.signupType,
      'registerDate': instance.registerDate,
      'status': instance.status,
      'updatedBy': instance.updatedBy,
      'image_Profile_1': instance.eventPhoto0,
      'image_Profile_2': instance.eventPhoto1,
      'image_Profile_3': instance.eventPhoto2,
      'image_Profile_4': instance.eventPhoto3,
      'image_Profile_5': instance.eventPhoto4,
      'account_Approved': instance.accountApproved,
      'is_Hygiene': instance.isHygiene,
      'image_Hygiene': instance.hygienePhoto,
      'image_Risk': instance.riskPhoto,
      'image_Authority_Reg': instance.registerationPhoto,
      'image_Passport': instance.passportPhoto,
      'image_Id': instance.nidPhoto,
      'image_Contract': instance.contractPhoto,
    };
