class UserModel {
  String chefId;
  String message;
  String userName;
  String email;
  String accessToken;
  String code;
  String expiresIn;

  UserModel({
    this.chefId = '',
    this.message = '',
    this.userName = '',
    this.email = '',
    this.accessToken = '',
    this.code = '',
    this.expiresIn = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'chefId': chefId,
      'message': message,
      'userName': userName,
      'email': email,
      'accessToken': accessToken,
      'code': code,
      'expiresIn': expiresIn,
    };
  }

  static UserModel fromJson(dynamic value) {
    return UserModel(
      chefId: value['chefId'] ?? '',
      message: value['message'] ?? '',
      userName: value['userName'] ?? '',
      email: value['email'] ?? '',
      accessToken: value['access_Token'] ?? '',
      code: value['code'] ?? '',
      expiresIn: value['expires_In'] ?? '',
    );
  }
}
