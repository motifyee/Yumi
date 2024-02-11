import 'package:yumi/generated/l10n.dart';

String? requiredValidator(String? value) {
  if (value?.isEmpty ?? true) return S.current.required;
  return null;
}
