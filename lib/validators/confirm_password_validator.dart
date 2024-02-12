import 'package:yumi/generated/l10n.dart';

String? Function(String?) confirmPasswordValidator(
    {String? value, String? comparedValue}) {
  return (String? value) {
    if (value == null || value.isEmpty) return S.current.required;
    if (value.isNotEmpty && value != comparedValue) {
      return S.current.passwordDoesNotMatch;
    }
    return null;
  };
}
