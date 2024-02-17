import 'package:yumi/generated/l10n.dart';

String? confirmPasswordValidator({String? value, String? comparedValue}) {
  if (value == null || value.isEmpty) return S.current.required;
  if (value.isNotEmpty && value != comparedValue) {
    return S.current.passwordDoesNotMatch;
  }
  return null;
}
