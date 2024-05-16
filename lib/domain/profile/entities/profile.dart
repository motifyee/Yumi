// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/global.dart';
import 'package:yumi/model/country_model.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

// TODO abstract to a base_profile and 3 profile types
@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    @JsonKey(includeToJson: false, includeFromJson: false)
    @Default(EntityStatus(status: Status.idle))
    EntityStatus entityStatus,

    //
    @Default('') String code,
    @Default('') String branchId,
    @Default('') String guid,
    @Default(0) int id,
    @Default('') String fullName,
    @Default('') String userName,
    @Default('') String bio,
    @JsonKey(name: 'image_Profile') String? profileImage,

    //
    @Default('') String mobile,
    @Default('') String email,
    @Default('') String address,
    @Default('') String about,
    @Default(0.0) double rate,
    @Default(false) @JsonKey(name: 'pickup_Allowed') bool pickup,
    @Default(false) @JsonKey(name: 'pickup_Only') bool pickupOnly,

    //
    @Default(0) int signupType,
    @Default('') String registerDate,
    @JsonKey(name: 'status') @Default(false) bool userStatus,
    @Default(Country()) @JsonKey(includeToJson: false) Country country,
    @Default('') String updatedBy,

    // Event Photos
    @JsonKey(name: 'image_Profile_1') String? eventPhoto0,
    @JsonKey(name: 'image_Profile_2') String? eventPhoto1,
    @JsonKey(name: 'image_Profile_3') String? eventPhoto2,
    @JsonKey(name: 'image_Profile_4') String? eventPhoto3,
    @JsonKey(name: 'image_Profile_5') String? eventPhoto4,

    //
    @Default(false) @JsonKey(name: 'account_Approved') bool accountApproved,
    @Default(false) @JsonKey(name: 'is_Hygiene') bool isHygiene,

    // Documents
    // chef
    @JsonKey(name: 'image_Hygiene_Cert') String? hygienePhoto,
    @JsonKey(name: 'image_Risk_Assessment') String? riskPhoto,
    @JsonKey(name: 'image_Authority_Reg') String? registerationPhoto,
    //driver
    @JsonKey(name: 'image_Driver_License') String? driverLicensePhoto,
    @JsonKey(name: 'image_Driver_License_Code') String? driverLicenseCodePhoto,
    @JsonKey(name: 'image_Food_Delivery_Insurance')
    String? foodDeliveryInsurancePhoto,
    @JsonKey(name: 'image_Evidence_Of_Residence')
    String? evidenceOfResidencePhoto,
    //common
    @JsonKey(name: 'image_Passport') String? passportPhoto,
    @JsonKey(name: 'image_ID') String? nidPhoto,

    //
    @JsonKey(name: 'image_Contract') String? contractPhoto,
  }) = _Profile;

  const Profile._();

  @JsonKey(name: 'countryId', includeFromJson: false, includeToJson: true)
  int get _countryId => country.id ?? 0;

  List<String> get eventPhotos => [
        eventPhoto0,
        eventPhoto1,
        eventPhoto2,
        eventPhoto3,
        eventPhoto4,
      ]
          .where((e) => e != null && e.isNotEmpty)
          .map((e) => e as String)
          .toList();

  get eventPhotosCount => eventPhotos.length;

  String? get idPhoto => nidPhoto ?? passportPhoto;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  bool get profileSheetDone {
    if (bio.isEmpty) return false;
    if (profileImage == null) return false;
    if (G.isChefApp && (eventPhotosCount == 0)) return false;

    return true;
  }

  bool get documentaionDone {
    if (idPhoto == null) return false;

    if (G.isDriverApp) {
      if (driverLicensePhoto == null) return false;
      if (driverLicenseCodePhoto == null) return false;
      if (foodDeliveryInsurancePhoto == null) return false;
      // if (evidenceOfResidencePhoto == null) return false;

      return true;
    }

    if (G.isChefApp) {
      if (hygienePhoto == null) return false;
      if (riskPhoto == null) return false;
      if (registerationPhoto == null) return false;

      return true;
    }

    return true;
  }
}
