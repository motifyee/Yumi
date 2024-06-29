import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/domain/user/entity/user.dart';

part 'signup_data.freezed.dart';
part 'signup_data.g.dart';

@freezed
class SignupData with _$SignupData {
  const factory SignupData({
    String? code,
    String? fullName,
    String? userName,
    String? mobile,
    String? signupType,
    String? countryID,
    String? email,
    String? password,
    String? branchId,
  }) = _Registeration;

  const SignupData._();

  Map<String, dynamic> toUserMap(String chefId, String token) => {
        'chefId': chefId,
        'userName': userName,
        'email': email,
        'access_Token': token,
        'code': code,
        'password': password,
      };

  User toUser(String chefId, String token) =>
      User.fromJson(toUserMap(chefId, token));

  factory SignupData.fromJson(Map<String, dynamic> json) =>
      _$SignupDataFromJson(json);
}
