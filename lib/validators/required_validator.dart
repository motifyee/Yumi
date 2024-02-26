import 'package:yumi/generated/l10n.dart';

String? requiredValidator(String? value) {
  if (value == null || value.toString().isEmpty) return S.current.required;
  return null;
}

String? requiredObjectValidator(dynamic value) {
  if (value == null) return S.current.required;
  return null;
}
