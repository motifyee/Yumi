# FormState

- MOD[001]

  ```dart
    <!-- @purpose : access the form fields -->
    <!-- @type : Set<FormFieldState<dynamic>> -->
    <!-- @line 210 -->
    <!-- @location: packages/flutter/lib/src/widgets/form.dart -->
    Set<FormFieldState<dynamic>> get fields => {..._fields};

    <!-- @usage -->
    _formKey.currentState.fields.forEach((field) {
      print(field.value);
    });
  ```
