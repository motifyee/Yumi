// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAccount":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "createAccount": MessageLookupByLibrary.simpleMessage("Create Account"),
        "createNewAccount":
            MessageLookupByLibrary.simpleMessage("Create New Account"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "forgetPassword":
            MessageLookupByLibrary.simpleMessage("Forget password"),
        "invalidEmail": MessageLookupByLibrary.simpleMessage("Invalid email"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "lowerCase": MessageLookupByLibrary.simpleMessage("1 lower case"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "numNumber": MessageLookupByLibrary.simpleMessage("1 number"),
        "orSignUpWith": MessageLookupByLibrary.simpleMessage("or sign up with"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordDoesNotMatch":
            MessageLookupByLibrary.simpleMessage("Password does not match!"),
        "passwordMustBe": MessageLookupByLibrary.simpleMessage(
            "Password must be 8 characters contains:\n 1 upper case,\n 1 lower case,\n 1 number,\n 1 special character ( ! @ # \$ & * ~ )."),
        "required": MessageLookupByLibrary.simpleMessage("Required"),
        "signToContinue":
            MessageLookupByLibrary.simpleMessage("Sign to continue"),
        "specialCharacter": MessageLookupByLibrary.simpleMessage(
            "1 special character ( ! @ # \$ & * ~ )"),
        "upperCase": MessageLookupByLibrary.simpleMessage("1 upper case"),
        "welcomeBack": MessageLookupByLibrary.simpleMessage("Welcome Back")
      };
}
