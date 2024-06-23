import 'package:freezed_annotation/freezed_annotation.dart';

part 'chef.freezed.dart';
part 'chef.g.dart';

enum ChefWorkStatus {
  offline,
  open,
  busy,
}

@freezed
class Chef with _$Chef {
  @JsonSerializable(includeIfNull: false)
  const factory Chef({
    String? id,
    String? firstName,
    String? lastName,
    String? mobile,
    String? code,
    @JsonKey(name: 'image_Profile') String? imageProfile,
    @JsonKey(name: 'image_Profile_1') String? imageProfile1,
    @JsonKey(name: 'image_Profile_2') String? imageProfile2,
    @JsonKey(name: 'image_Profile_3') String? imageProfile3,
    @JsonKey(name: 'image_Profile_4') String? imageProfile4,
    @JsonKey(name: 'image_Profile_5') String? imageProfile5,
    @JsonKey(name: 'account_Approved') bool? accountApproved,
    @JsonKey(name: 'pickup_Allowed') bool? pickupAllowed,
    @JsonKey(name: 'pickup_Only') bool? pickupOnly,
    @JsonKey(name: 'is_Hygiene') bool? isHygiene,
    @JsonKey(name: 'image_Hygiene_Cert') String? imageHygieneCert,
    @JsonKey(name: 'image_Authority_Reg') String? imageAuthorityReg,
    @JsonKey(name: 'image_Risk_Assessment') String? imageRiskAssessment,
    @JsonKey(name: 'image_Contract') String? imageContract,
    @JsonKey(name: 'image_ID') String? imageID,
    @JsonKey(name: 'image_Passport') String? imagePassport,
    int? status,
    String? email,
    int? signupType,
    String? createdBy,
    double? rate,
    @Default(false) bool isFavorite,
  }) = _Chef;

  factory Chef.fromJson(Map<String, dynamic> json) => _$ChefFromJson(json);
}
