class Profile {
  final String code;
  final String branchId;

  final String guid;
  final int id;
  final String fullName;
  final String userName;
  final String bio;
  final String? profileImage;
  //
  final String mobile;
  final String email;
  final String address;
  final String about;
  final bool pickup;
  final bool pickupOnly;
  //
  final int signupType;
  final String registerDate;
  final bool status;
  final Country country;
  final String updatedBy;

  // Event Photos
  final String? eventPhoto0;
  final String? eventPhoto1;
  final String? eventPhoto2;
  final String? eventPhoto3;
  final String? eventPhoto4;
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

//
  final bool accountApproved;
  final bool isHygiene;

  // Documents
  final String? hygienePhoto;
  final String? riskPhoto;
  final String? registerationPhoto;
  final String? passportPhoto;
  final String? nidPhoto;
  final String? contractPhoto;

  String? get idPhoto => nidPhoto ?? passportPhoto;
  //
  const Profile({
    this.code = '',
    this.branchId = '',
    this.guid = '',
    this.id = 0,
    this.fullName = '',
    this.userName = '',
    this.bio = '',
    this.profileImage,
    this.mobile = '',
    this.email = '',
    this.address = '',
    this.about = '',
    this.pickup = false,
    this.pickupOnly = false,
    this.signupType = 0,
    this.registerDate = '',
    this.status = true,
    this.country = const Country(),
    this.updatedBy = '366',
    // event photos
    this.eventPhoto0,
    this.eventPhoto1,
    this.eventPhoto2,
    this.eventPhoto3,
    this.eventPhoto4,
    //
    this.accountApproved = false,
    this.isHygiene = false,
    // documents
    this.hygienePhoto,
    this.riskPhoto,
    this.registerationPhoto,
    this.passportPhoto,
    this.nidPhoto,
    this.contractPhoto,
  });

  Profile copyWith({
    String? code,
    String? branchId,
    String? guid,
    int? id,
    String? fullName,
    String? userName,
    String? bio,
    String? profileImage,
    String? mobile,
    String? email,
    String? address,
    String? about,
    bool? pickup,
    bool? pickupOnly,
    int? signupType,
    String? registerDate,
    bool? status,
    Country? country,
    String? updatedBy,
    // event photos
    String? eventPhoto0,
    String? eventPhoto1,
    String? eventPhoto2,
    String? eventPhoto3,
    String? eventPhoto4,
    //
    bool? accountApproved,
    bool? isHygiene,
    // documents
    String? hygienePhoto,
    String? riskPhoto,
    String? regiserationPhoto,
    String? passportPhoto,
    String? nidPhoto,
    String? contractPhoto,
  }) {
    return Profile(
      code: code ?? this.code,
      branchId: branchId ?? this.branchId,
      guid: guid ?? this.guid,
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      userName: userName ?? this.userName,
      bio: bio ?? this.bio,
      profileImage: profileImage ?? this.profileImage,
      mobile: mobile ?? this.mobile,
      email: email ?? this.email,
      address: address ?? this.address,
      about: about ?? this.about,
      pickup: pickup ?? this.pickup,
      pickupOnly: pickupOnly ?? this.pickupOnly,
      signupType: signupType ?? this.signupType,
      registerDate: registerDate ?? this.registerDate,
      status: status ?? this.status,
      country: country ?? this.country,
      updatedBy: updatedBy ?? this.updatedBy,
      // event photos
      eventPhoto0: eventPhoto0 ?? this.eventPhoto0,
      eventPhoto1: eventPhoto1 ?? this.eventPhoto1,
      eventPhoto2: eventPhoto2 ?? this.eventPhoto2,
      eventPhoto3: eventPhoto3 ?? this.eventPhoto3,
      eventPhoto4: eventPhoto4 ?? this.eventPhoto4,
      //
      accountApproved: accountApproved ?? this.accountApproved,
      isHygiene: isHygiene ?? this.isHygiene,
      // documents
      hygienePhoto: hygienePhoto ?? this.hygienePhoto,
      riskPhoto: riskPhoto ?? this.riskPhoto,
      registerationPhoto: regiserationPhoto ?? registerationPhoto,
      passportPhoto: passportPhoto ?? this.passportPhoto,
      nidPhoto: nidPhoto ?? this.nidPhoto,
      contractPhoto: contractPhoto ?? this.contractPhoto,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'branchId': branchId,
      'guid': guid,
      'id': id,
      'fullName': fullName,
      'userName': userName,
      'bio': bio,
      'image_profile': profileImage,
      'mobile': mobile,
      'email': email,
      'address': address,
      'about': about,
      'pickup': pickup,
      'pickupOnly': pickupOnly,
      'signupType': signupType,
      'registerDate': registerDate,
      'status': status,
      'countryId': country.id,
      'updatedBy': updatedBy,
      //event photos
      'image_profile_1': eventPhoto0,
      'image_profile_2': eventPhoto1,
      'image_profile_3': eventPhoto2,
      'image_profile_4': eventPhoto3,
      'image_profile_5': eventPhoto4,
      //
      'account_approved': accountApproved,
      'is_hygiene': isHygiene,
      //documents
      'image_hygiene': hygienePhoto,
      'image_risk_assessment': riskPhoto,
      'image_authority_reg': registerationPhoto,
      'image_passport': passportPhoto,
      'image_id': nidPhoto,
      'image_contract': contractPhoto,
    };
  }

  factory Profile.fromJson({required dynamic value}) {
    return Profile(
      code: value['code'] ?? '',
      branchId: value['branchId'] ?? '',
      guid: value['guid'] ?? '',
      id: value['id'] ?? 0,
      fullName: value['fullName'] ?? '',
      userName: value['userName'] ?? '',
      bio: value['bio'] ?? '',
      profileImage: value['image_Profile'],
      mobile: value['mobile'] ?? '',
      email: value['email'] ?? '',
      address: value['address'] ?? '',
      about: value['about'] ?? '',
      pickup: value['pickup_Allowed'] ?? false,
      pickupOnly: value['pickup_Only'] ?? false,
      signupType: value['signupType'] ?? 0,
      registerDate: value['registerDate'] ?? '',
      status: value['status'] ?? true,
      country: Country(
          id: value['country']['id'] ?? 0,
          name: value['country']['name'] ?? ''),
      updatedBy: value['updatedBy'] ?? '',

      //event photos
      eventPhoto0: value['image_profile_1'],
      eventPhoto1: value['image_profile_2'],
      eventPhoto2: value['image_profile_3'],
      eventPhoto3: value['image_profile_4'],
      eventPhoto4: value['image_profile_5'],
      //
      accountApproved: value['account_approved'] ?? false,
      isHygiene: value['is_hygiene'] ?? false,
      //documents
      hygienePhoto: value['image_hygiene'],
      riskPhoto: value['image_risk_assessment'],
      registerationPhoto: value['image_authority_reg'],
      passportPhoto: value['image_passport'],
      nidPhoto: value['image_id'],
      contractPhoto: value['image_contract'],
    );
  }
}

class Country {
  final int id;
  final String name;

  const Country({this.id = 0, this.name = ''});
}
