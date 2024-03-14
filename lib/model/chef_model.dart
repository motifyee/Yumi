class ChefModel {
  String? guid;
  int? id;
  String? fullName;
  String? userName;
  String? email;
  int? signupType;
  String? mobile;
  String? registerDate;
  bool? status;
  String? bio;
  String? about;
  String? address;
  String? imageProfile;
  String? imageProfile1;
  String? imageProfile2;
  String? imageProfile3;
  String? imageProfile4;
  String? imageProfile5;
  bool? accountApproved;
  bool? pickupAllowed;
  bool? pickupOnly;
  Country? country;

  ChefModel(
      {this.guid,
      this.id,
      this.fullName,
      this.userName,
      this.email,
      this.signupType,
      this.mobile,
      this.registerDate,
      this.status,
      this.bio,
      this.about,
      this.address,
      this.imageProfile,
      this.imageProfile1,
      this.imageProfile2,
      this.imageProfile3,
      this.imageProfile4,
      this.imageProfile5,
      this.accountApproved,
      this.pickupAllowed,
      this.pickupOnly,
      this.country});

  ChefModel.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    id = json['id'];
    fullName = json['fullName'];
    userName = json['userName'];
    email = json['email'];
    signupType = json['signupType'];
    mobile = json['mobile'];
    registerDate = json['registerDate'];
    status = json['status'];
    bio = json['bio'];
    about = json['about'];
    address = json['address'];
    imageProfile = json['image_Profile'];
    imageProfile1 = json['image_Profile_1'];
    imageProfile2 = json['image_Profile_2'];
    imageProfile3 = json['image_Profile_3'];
    imageProfile4 = json['image_Profile_4'];
    imageProfile5 = json['image_Profile_5'];
    accountApproved = json['account_Approved'];
    pickupAllowed = json['pickup_Allowed'];
    pickupOnly = json['pickup_Only'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['signupType'] = this.signupType;
    data['mobile'] = this.mobile;
    data['registerDate'] = this.registerDate;
    data['status'] = this.status;
    data['bio'] = this.bio;
    data['about'] = this.about;
    data['address'] = this.address;
    data['image_Profile'] = this.imageProfile;
    data['image_Profile_1'] = this.imageProfile1;
    data['image_Profile_2'] = this.imageProfile2;
    data['image_Profile_3'] = this.imageProfile3;
    data['image_Profile_4'] = this.imageProfile4;
    data['image_Profile_5'] = this.imageProfile5;
    data['account_Approved'] = this.accountApproved;
    data['pickup_Allowed'] = this.pickupAllowed;
    data['pickup_Only'] = this.pickupOnly;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}

class Country {
  int? id;
  String? name;

  Country({this.id, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
