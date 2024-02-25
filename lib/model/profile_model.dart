class ProfileModel {
  final String guid;
  final int id;
  final String firstName;
  final String lastName;
  final String mobile;
  final int signupType;
  final String registerDate;
  final bool status;
  final Country country;

  ProfileModel({
    this.guid = '',
    this.id = 0,
    this.firstName = '',
    this.lastName = '',
    this.mobile = '',
    this.signupType = 0,
    this.registerDate = '',
    this.status = true,
    this.country = const Country(),
  });

  Map<String, dynamic> toJson() {
    return {
      'guid': guid,
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'mobile': mobile,
      'signupType': signupType,
      'registerDate': registerDate,
      'status': status,
      'country': country,
    };
  }

  ProfileModel fromJson({required dynamic value}) {
    return ProfileModel(
      guid: value['guid'] ?? '',
      id: value['id'] ?? 0,
      firstName: value['firstName'] ?? '',
      lastName: value['lastName'] ?? '',
      mobile: value['mobile'] ?? '',
      signupType: value['signupType'] ?? 0,
      registerDate: value['registerDate'] ?? '',
      status: value['status'] ?? true,
      country: Country(
          id: value['country']['id'] ?? 0,
          name: value['country']['name'] ?? ''),
    );
  }
}

class Country {
  final int id;
  final String name;

  const Country({this.id = 0, this.name = ''});
}
