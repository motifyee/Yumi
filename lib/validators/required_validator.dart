import 'package:yumi/generated/l10n.dart';

String? requiredValidator(String? value) {
  if (value == null || value.isEmpty) return S.current.required;
  return null;
}
