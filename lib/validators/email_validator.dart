import 'package:yumi/generated/l10n.dart';
import 'package:yumi/util/util.dart';

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) return S.current.required;
  if (!emailStructure(value)) return S.current.invalidEmail;
  return null;
}

String? emailOrMobileValidator(String? value) {
  if (value == null || value.isEmpty) return S.current.required;

  if (!isNumeric(value)) {
    if (!emailStructure(value)) return S.current.invalidEmail;

    return null;
  }

  if (value.trim().startsWith('+44')) {
    if (value.length != 13) return "Invalid Mobile Number";
  } else if (value.trim().startsWith('44')) {
    if (value.length != 12) return "Invalid Mobile Number";
  } else if (value.trim().length != 10) {
    return "Invalid Mobile Number";
  }

  return null;
}

bool emailStructure(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value ?? '');
}
