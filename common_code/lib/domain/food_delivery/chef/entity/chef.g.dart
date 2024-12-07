// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chef.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChefImpl _$$ChefImplFromJson(Map<String, dynamic> json) => _$ChefImpl(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      mobile: json['mobile'] as String?,
      code: json['code'] as String?,
      imageProfile: json['image_Profile'] as String?,
      imageProfile1: json['image_Profile_1'] as String?,
      imageProfile2: json['image_Profile_2'] as String?,
      imageProfile3: json['image_Profile_3'] as String?,
      imageProfile4: json['image_Profile_4'] as String?,
      imageProfile5: json['image_Profile_5'] as String?,
      accountApproved: json['account_Approved'] as bool?,
      pickupAllowed: json['pickup_Allowed'] as bool?,
      pickupOnly: json['pickup_Only'] as bool?,
      isHygiene: json['is_Hygiene'] as bool?,
      imageHygieneCert: json['image_Hygiene_Cert'] as String?,
      imageAuthorityReg: json['image_Authority_Reg'] as String?,
      imageRiskAssessment: json['image_Risk_Assessment'] as String?,
      imageContract: json['image_Contract'] as String?,
      imageID: json['image_ID'] as String?,
      imagePassport: json['image_Passport'] as String?,
      status: (json['status'] as num?)?.toInt(),
      email: json['email'] as String?,
      signupType: (json['signupType'] as num?)?.toInt(),
      createdBy: json['createdBy'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChefImplToJson(_$ChefImpl instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      if (instance.firstName case final value?) 'firstName': value,
      if (instance.lastName case final value?) 'lastName': value,
      if (instance.mobile case final value?) 'mobile': value,
      if (instance.code case final value?) 'code': value,
      if (instance.imageProfile case final value?) 'image_Profile': value,
      if (instance.imageProfile1 case final value?) 'image_Profile_1': value,
      if (instance.imageProfile2 case final value?) 'image_Profile_2': value,
      if (instance.imageProfile3 case final value?) 'image_Profile_3': value,
      if (instance.imageProfile4 case final value?) 'image_Profile_4': value,
      if (instance.imageProfile5 case final value?) 'image_Profile_5': value,
      if (instance.accountApproved case final value?) 'account_Approved': value,
      if (instance.pickupAllowed case final value?) 'pickup_Allowed': value,
      if (instance.pickupOnly case final value?) 'pickup_Only': value,
      if (instance.isHygiene case final value?) 'is_Hygiene': value,
      if (instance.imageHygieneCert case final value?)
        'image_Hygiene_Cert': value,
      if (instance.imageAuthorityReg case final value?)
        'image_Authority_Reg': value,
      if (instance.imageRiskAssessment case final value?)
        'image_Risk_Assessment': value,
      if (instance.imageContract case final value?) 'image_Contract': value,
      if (instance.imageID case final value?) 'image_ID': value,
      if (instance.imagePassport case final value?) 'image_Passport': value,
      if (instance.status case final value?) 'status': value,
      if (instance.email case final value?) 'email': value,
      if (instance.signupType case final value?) 'signupType': value,
      if (instance.createdBy case final value?) 'createdBy': value,
      if (instance.rate case final value?) 'rate': value,
      'isFavorite': instance.isFavorite,
    };
