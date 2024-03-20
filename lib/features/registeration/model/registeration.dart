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

  factory RegisterationForm.fromJson(Map<String, dynamic> json) =>
      _$RegisterationFormFromJson(json);
}
