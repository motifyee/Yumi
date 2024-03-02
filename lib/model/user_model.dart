class UserModel {
  String chefId;
  String message;
  String userName;
  String email;
  String accessToken;
  String code;
  String expiresIn;
  String bio;

  UserModel({
    this.chefId = '',
    this.message = '',
    this.userName = '',
    this.email = '',
    this.accessToken = '',
    this.code = '',
    this.expiresIn = '',
    this.bio = '',
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
      'bio': bio,
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
      bio: value['bio'] ?? '',
    );
  }

  UserModel copyWith({
    String? chefId,
    String? message,
    String? userName,
    String? email,
    String? accessToken,
    String? code,
    String? expiresIn,
    String? bio,
  }) {
    return UserModel(
      chefId: chefId ?? this.chefId,
      message: message ?? this.message,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      accessToken: accessToken ?? this.accessToken,
      code: code ?? this.code,
      expiresIn: expiresIn ?? this.expiresIn,
      bio: bio ?? this.bio,
    );
  }
}
