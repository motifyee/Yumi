import 'package:yumi/generated/l10n.dart';

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) return S.current.required;
  if (!emailStructure(value)) return S.current.invalidEmail;
  return null;
}

bool emailStructure(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value ?? '');
}
