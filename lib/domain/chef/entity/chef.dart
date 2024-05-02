import 'package:freezed_annotation/freezed_annotation.dart';

part 'chef.freezed.dart';
part 'chef.g.dart';

@freezed
class Chef with _$Chef {
  @JsonSerializable(includeIfNull: false)
  const factory Chef({
    String? id,
    String? firstName,
    String? lastName,
    String? mobile,
    String? code,
    String? imageProfile,
    String? imageProfile1,
    String? imageProfile2,
    String? imageProfile3,
    String? imageProfile4,
    String? imageProfile5,
    bool? accountApproved,
    bool? pickupAllowed,
    bool? pickupOnly,
    bool? isHygiene,
    String? imageHygieneCert,
    String? imageAuthorityReg,
    String? imageRiskAssessment,
    String? imageContract,
    String? imageID,
    String? imagePassport,
    String? email,
    int? signupType,
    String? createdBy,
    @Default(false) bool isFavorite,
  }) = _Chef;

  factory Chef.fromJson(Map<String, dynamic> json) => _$ChefFromJson(json);
}
