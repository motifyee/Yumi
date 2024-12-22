import 'package:yumi/generated/l10n.dart';

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) return S.current.required;
  if (!passwordStructure(value)) return S.current.passwordMustBe;
  return null;
}

bool passwordStructure(String? value) {
  const String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  final RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value ?? '');
}
