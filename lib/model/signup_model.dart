class SignUpModel {
  String code;
  String fullName;
  String userName;
  String mobile;
  String signupType;
  String countryID;
  String email;
  String password;

  SignUpModel(
      {required this.code,
      required this.fullName,
      required this.userName,
      required this.mobile,
      required this.signupType,
      required this.countryID,
      required this.email,
      required this.password});

  Map<String, String> toJson() {
    return {
      'code': code,
      'fullName': fullName,
      'userName': userName,
      'mobile': mobile,
      'signupType': signupType,
      'countryID': countryID,
      'email': email,
      'password': password,
    };
  }
}
