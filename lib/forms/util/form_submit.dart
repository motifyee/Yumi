import 'package:flutter/widgets.dart';

onFormFieldsSaved<T>(
  GlobalKey<FormState> formKey, {
  Function(int idx, T obj, Set<FormFieldState<dynamic>>? fields)? onFieldsSaved,
  Function(T obj, Set<FormFieldState<dynamic>>? fields)? onAllFieldsSaved,
  bool enabledOnly = true,
  int fallbackCount = 0,
}) {
  Set<FormFieldState<dynamic>>? fields;

  int saveCount = 0;
  int controlsCount = 0;
  bool onSaveCalled = false;
  setControlsCount() {
    // !MOD: depends on a framework MOD[001]
    fields = formKey.currentState?.fields;
    controlsCount = (enabledOnly
            ? fields?.where((e) => e.widget.enabled).length
            : fields?.length) ??
        fallbackCount;

    onSaveCalled = true;
  }

  bool onAllSavedCalled = false;
  return (T obj) {
    if (!onSaveCalled) setControlsCount();

    saveCount++;

    if (onFieldsSaved != null) onFieldsSaved(saveCount, obj, fields);

    if (saveCount >= controlsCount && onAllFieldsSaved != null) {
      if (onAllSavedCalled) throw Exception('onAllFieldsSaved called twice');
      onAllSavedCalled = true;

      onAllFieldsSaved(obj, fields);
    }
  };
}
