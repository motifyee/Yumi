import 'package:common_code/common_code.dart';
import 'package:yumi/core/util/constants.dart';
import 'package:yumi/generated/l10n.dart';

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) return S.current.required;
  if (!emailStructure(value)) return S.current.invalidEmail;
  return null;
}

String? mobileValidator(String? mobile) {
  if (mobile == null || mobile.isEmpty) return S.current.required;
  if (!isNumeric(mobile)) return S.current.invalidMobileNumber;

  if (mobile.trim().startsWith('00$kUKCountryCode')) {
    if (mobile.length != 14) return S.current.invalidMobileNumber;
  } else if (mobile.trim().startsWith('+$kUKCountryCode')) {
    if (mobile.length != 13) return S.current.invalidMobileNumber;
  } else if (mobile.trim().startsWith(kUKCountryCode)) {
    if (mobile.length != 12) return S.current.invalidMobileNumber;
  } else if (mobile.trim().length != 10) {
    return S.current.invalidMobileNumber;
  }

  return null;
}

String? emailOrMobileValidator(String? value) {
  if (value == null || value.isEmpty) return S.current.required;

  if (!isNumeric(value)) {
    if (!emailStructure(value)) return S.current.invalidEmail;

    return null;
  }

  return mobileValidator(value);
}

bool emailStructure(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value ?? '');
}
