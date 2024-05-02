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
      imageProfile: json['imageProfile'] as String?,
      imageProfile1: json['imageProfile1'] as String?,
      imageProfile2: json['imageProfile2'] as String?,
      imageProfile3: json['imageProfile3'] as String?,
      imageProfile4: json['imageProfile4'] as String?,
      imageProfile5: json['imageProfile5'] as String?,
      accountApproved: json['accountApproved'] as bool?,
      pickupAllowed: json['pickupAllowed'] as bool?,
      pickupOnly: json['pickupOnly'] as bool?,
      isHygiene: json['isHygiene'] as bool?,
      imageHygieneCert: json['imageHygieneCert'] as String?,
      imageAuthorityReg: json['imageAuthorityReg'] as String?,
      imageRiskAssessment: json['imageRiskAssessment'] as String?,
      imageContract: json['imageContract'] as String?,
      imageID: json['imageID'] as String?,
      imagePassport: json['imagePassport'] as String?,
      email: json['email'] as String?,
      signupType: json['signupType'] as int?,
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
  writeNotNull('imageProfile', instance.imageProfile);
  writeNotNull('imageProfile1', instance.imageProfile1);
  writeNotNull('imageProfile2', instance.imageProfile2);
  writeNotNull('imageProfile3', instance.imageProfile3);
  writeNotNull('imageProfile4', instance.imageProfile4);
  writeNotNull('imageProfile5', instance.imageProfile5);
  writeNotNull('accountApproved', instance.accountApproved);
  writeNotNull('pickupAllowed', instance.pickupAllowed);
  writeNotNull('pickupOnly', instance.pickupOnly);
  writeNotNull('isHygiene', instance.isHygiene);
  writeNotNull('imageHygieneCert', instance.imageHygieneCert);
  writeNotNull('imageAuthorityReg', instance.imageAuthorityReg);
  writeNotNull('imageRiskAssessment', instance.imageRiskAssessment);
  writeNotNull('imageContract', instance.imageContract);
  writeNotNull('imageID', instance.imageID);
  writeNotNull('imagePassport', instance.imagePassport);
  writeNotNull('email', instance.email);
  writeNotNull('signupType', instance.signupType);
  writeNotNull('createdBy', instance.createdBy);
  val['isFavorite'] = instance.isFavorite;
  return val;
}
