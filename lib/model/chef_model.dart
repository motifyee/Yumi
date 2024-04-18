class ChefModel {
  String? id;
  String? firstName;
  String? lastName;
  String? mobile;
  String? code;
  String? imageProfile;
  String? imageProfile1;
  String? imageProfile2;
  String? imageProfile3;
  String? imageProfile4;
  String? imageProfile5;
  bool? accountApproved;
  bool? pickupAllowed;
  bool? pickupOnly;
  bool? isHygiene;
  String? imageHygieneCert;
  String? imageAuthorityReg;
  String? imageRiskAssessment;
  String? imageContract;
  String? imageID;
  String? imagePassport;
  String? email;
  int? signupType;
  String? createdBy;
  late bool isFavorite;

  ChefModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.mobile,
      this.code,
      this.imageProfile,
      this.imageProfile1,
      this.imageProfile2,
      this.imageProfile3,
      this.imageProfile4,
      this.imageProfile5,
      this.accountApproved,
      this.pickupAllowed,
      this.pickupOnly,
      this.isHygiene,
      this.imageHygieneCert,
      this.imageAuthorityReg,
      this.imageRiskAssessment,
      this.imageContract,
      this.imageID,
      this.imagePassport,
      this.email,
      this.signupType,
      this.createdBy,
      this.isFavorite = false});

  ChefModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    mobile = json['mobile'];
    code = json['code'];
    imageProfile = json['image_Profile'];
    imageProfile1 = json['image_Profile_1'];
    imageProfile2 = json['image_Profile_2'];
    imageProfile3 = json['image_Profile_3'];
    imageProfile4 = json['image_Profile_4'];
    imageProfile5 = json['image_Profile_5'];
    accountApproved = json['account_Approved'];
    pickupAllowed = json['pickup_Allowed'];
    pickupOnly = json['pickup_Only'];
    isHygiene = json['is_Hygiene'];
    imageHygieneCert = json['image_Hygiene_Cert'];
    imageAuthorityReg = json['image_Authority_Reg'];
    imageRiskAssessment = json['image_Risk_Assessment'];
    imageContract = json['image_Contract'];
    imageID = json['image_ID'];
    imagePassport = json['image_Passport'];
    email = json['email'];
    signupType = json['signupType'];
    createdBy = json['createdBy'];
    isFavorite = json['isFavorite'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['mobile'] = this.mobile;
    data['code'] = this.code;
    data['image_Profile'] = this.imageProfile;
    data['image_Profile_1'] = this.imageProfile1;
    data['image_Profile_2'] = this.imageProfile2;
    data['image_Profile_3'] = this.imageProfile3;
    data['image_Profile_4'] = this.imageProfile4;
    data['image_Profile_5'] = this.imageProfile5;
    data['account_Approved'] = this.accountApproved;
    data['pickup_Allowed'] = this.pickupAllowed;
    data['pickup_Only'] = this.pickupOnly;
    data['is_Hygiene'] = this.isHygiene;
    data['image_Hygiene_Cert'] = this.imageHygieneCert;
    data['image_Authority_Reg'] = this.imageAuthorityReg;
    data['image_Risk_Assessment'] = this.imageRiskAssessment;
    data['image_Contract'] = this.imageContract;
    data['image_ID'] = this.imageID;
    data['image_Passport'] = this.imagePassport;
    data['email'] = this.email;
    data['signupType'] = this.signupType;
    data['createdBy'] = this.createdBy;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}
