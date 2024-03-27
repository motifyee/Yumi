// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/model/country_model.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class Profile with _$Profile {
  const factory Profile({
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
    @Default(false) @JsonKey(name: 'pickup_Allowed') bool pickup,
    @Default(false) @JsonKey(name: 'pickup_Only') bool pickupOnly,

    //
    @Default(0) int signupType,
    @Default('') String registerDate,
    @Default(false) bool status,
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
    @JsonKey(name: 'image_Hygiene') String? hygienePhoto,
    @JsonKey(name: 'image_Risk') String? riskPhoto,
    @JsonKey(name: 'image_Authority_Reg') String? registerationPhoto,
    @JsonKey(name: 'image_Passport') String? passportPhoto,
    @JsonKey(name: 'image_Id') String? nidPhoto,
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
    if (eventPhotosCount < 5) return false;

    return true;
  }
}
