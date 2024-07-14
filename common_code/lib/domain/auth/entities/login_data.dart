import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_data.freezed.dart';
part 'login_data.g.dart';

@freezed
abstract class LoginData with _$LoginData {
  const factory LoginData({
    @Default('') String email,
    @Default('') String password,
  }) = _LoginModel;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}
