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
      email: json['email'] as String?,
      signupType: (json['signupType'] as num?)?.toInt(),
      createdBy: json['createdBy'] as String?,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChefImplToJson(_$ChefImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('mobile', instance.mobile);
  writeNotNull('code', instance.code);
  writeNotNull('image_Profile', instance.imageProfile);
  writeNotNull('image_Profile_1', instance.imageProfile1);
  writeNotNull('image_Profile_2', instance.imageProfile2);
  writeNotNull('image_Profile_3', instance.imageProfile3);
  writeNotNull('image_Profile_4', instance.imageProfile4);
  writeNotNull('image_Profile_5', instance.imageProfile5);
  writeNotNull('account_Approved', instance.accountApproved);
  writeNotNull('pickup_Allowed', instance.pickupAllowed);
  writeNotNull('pickup_Only', instance.pickupOnly);
  writeNotNull('is_Hygiene', instance.isHygiene);
  writeNotNull('image_Hygiene_Cert', instance.imageHygieneCert);
  writeNotNull('image_Authority_Reg', instance.imageAuthorityReg);
  writeNotNull('image_Risk_Assessment', instance.imageRiskAssessment);
  writeNotNull('image_Contract', instance.imageContract);
  writeNotNull('image_ID', instance.imageID);
  writeNotNull('image_Passport', instance.imagePassport);
  writeNotNull('email', instance.email);
  writeNotNull('signupType', instance.signupType);
  writeNotNull('createdBy', instance.createdBy);
  val['isFavorite'] = instance.isFavorite;
  return val;
}
