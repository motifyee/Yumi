import 'package:freezed_annotation/freezed_annotation.dart';

part 'registeration.freezed.dart';
part 'registeration.g.dart';

@freezed
class RegisterationForm with _$RegisterationForm {
  const factory RegisterationForm({
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

  const RegisterationForm._();

  Map<String, dynamic> toUserMap(String chefId, String token) => {
        'chefId': chefId,
        'userName': userName,
        'email': email,
        'access_Token': token,
        'code': code,
        // 'password': password,
      };

  factory RegisterationForm.fromJson(Map<String, dynamic> json) =>
      _$RegisterationFormFromJson(json);
}
