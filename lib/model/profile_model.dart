class ProfileModel {
  final String guid;
  final int id;
  final String fullName;
  final String userName;
  final String bio;
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

  ProfileModel({
    this.guid = '',
    this.id = 0,
    this.fullName = '',
    this.userName = '',
    this.bio = '',
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
  });

  ProfileModel copyWith({
    String? guid,
    int? id,
    String? fullName,
    String? userName,
    String? bio,
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
  }) {
    return ProfileModel(
      guid: guid ?? this.guid,
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      userName: userName ?? this.userName,
      bio: bio ?? this.bio,
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
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'guid': guid,
      'id': id,
      'fullName': fullName,
      'userName': userName,
      'bio': bio,
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
    };
  }

  ProfileModel fromJson({required dynamic value}) {
    return ProfileModel(
      guid: value['guid'] ?? '',
      id: value['id'] ?? 0,
      fullName: value['fullName'] ?? '',
      userName: value['userName'] ?? '',
      bio: value['bio'] ?? '',
      mobile: value['mobile'] ?? '',
      email: value['email'] ?? '',
      address: value['address'] ?? '',
      about: value['about'] ?? '',
      pickup: value['pickup'] ?? false,
      pickupOnly: value['pickupOnly'] ?? false,
      signupType: value['signupType'] ?? 0,
      registerDate: value['registerDate'] ?? '',
      status: value['status'] ?? true,
      country: Country(
          id: value['country']['id'] ?? 0,
          name: value['country']['name'] ?? ''),
      updatedBy: value['updatedBy'] ?? '',
    );
  }
}

class Country {
  final int id;
  final String name;

  const Country({this.id = 0, this.name = ''});
}
