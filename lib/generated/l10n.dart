// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `YUMI`
  String get yumi {
    return Intl.message(
      'YUMI',
      name: 'yumi',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Sign to continue`
  String get signToContinue {
    return Intl.message(
      'Sign to continue',
      name: 'signToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get forgetPassword {
    return Intl.message(
      'Forget password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `or sign up with`
  String get orSignUpWith {
    return Intl.message(
      'or sign up with',
      name: 'orSignUpWith',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalidEmail {
    return Intl.message(
      'Invalid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password must be 8 characters contains:\n 1 upper case,\n 1 lower case,\n 1 number,\n 1 special character ( ! @ # $ & * ~ ).`
  String get passwordMustBe {
    return Intl.message(
      'Password must be 8 characters contains:\n 1 upper case,\n 1 lower case,\n 1 number,\n 1 special character ( ! @ # \$ & * ~ ).',
      name: 'passwordMustBe',
      desc: '',
      args: [],
    );
  }

  /// `1 upper case`
  String get upperCase {
    return Intl.message(
      '1 upper case',
      name: 'upperCase',
      desc: '',
      args: [],
    );
  }

  /// `1 lower case`
  String get lowerCase {
    return Intl.message(
      '1 lower case',
      name: 'lowerCase',
      desc: '',
      args: [],
    );
  }

  /// `1 number`
  String get numNumber {
    return Intl.message(
      '1 number',
      name: 'numNumber',
      desc: '',
      args: [],
    );
  }

  /// `1 special character ( ! @ # $ & * ~ )`
  String get specialCharacter {
    return Intl.message(
      '1 special character ( ! @ # \$ & * ~ )',
      name: 'specialCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get createNewAccount {
    return Intl.message(
      'Create New Account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Password does not match!`
  String get passwordDoesNotMatch {
    return Intl.message(
      'Password does not match!',
      name: 'passwordDoesNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Opened`
  String get opened {
    return Intl.message(
      'Opened',
      name: 'opened',
      desc: '',
      args: [],
    );
  }

  /// `Closed`
  String get closed {
    return Intl.message(
      'Closed',
      name: 'closed',
      desc: '',
      args: [],
    );
  }

  /// `Busy`
  String get busy {
    return Intl.message(
      'Busy',
      name: 'busy',
      desc: '',
      args: [],
    );
  }

  /// `Order received`
  String get orderReceived {
    return Intl.message(
      'Order received',
      name: 'orderReceived',
      desc: '',
      args: [],
    );
  }

  /// `Preparing`
  String get preparing {
    return Intl.message(
      'Preparing',
      name: 'preparing',
      desc: '',
      args: [],
    );
  }

  /// `Ready`
  String get ready {
    return Intl.message(
      'Ready',
      name: 'ready',
      desc: '',
      args: [],
    );
  }

  /// `Order Id`
  String get orderId {
    return Intl.message(
      'Order Id',
      name: 'orderId',
      desc: '',
      args: [],
    );
  }

  /// `Click the icon to view customer notes`
  String get clickTheIconToViewCustomerNotes {
    return Intl.message(
      'Click the icon to view customer notes',
      name: 'clickTheIconToViewCustomerNotes',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Fee`
  String get deliveryFee {
    return Intl.message(
      'Delivery Fee',
      name: 'deliveryFee',
      desc: '',
      args: [],
    );
  }

  /// `The total price includes tax`
  String get theTotalPriceIncludesTax {
    return Intl.message(
      'The total price includes tax',
      name: 'theTotalPriceIncludesTax',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get view {
    return Intl.message(
      'View',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get hi {
    return Intl.message(
      'Hi',
      name: 'hi',
      desc: '',
      args: [],
    );
  }

  /// `This section your saved address`
  String get thisSectionYourSavedAddress {
    return Intl.message(
      'This section your saved address',
      name: 'thisSectionYourSavedAddress',
      desc: '',
      args: [],
    );
  }

  /// `This button means that the chef is currently closed`
  String get thisButtonMeansThatTheChefIsCurrentlyClosed {
    return Intl.message(
      'This button means that the chef is currently closed',
      name: 'thisButtonMeansThatTheChefIsCurrentlyClosed',
      desc: '',
      args: [],
    );
  }

  /// `This button means that the chef is currently available`
  String get thisButtonMeansThatTheChefIsCurrentlyAvailable {
    return Intl.message(
      'This button means that the chef is currently available',
      name: 'thisButtonMeansThatTheChefIsCurrentlyAvailable',
      desc: '',
      args: [],
    );
  }

  /// `This button means that the chef is currently not available`
  String get thisButtonMeansThatTheChefIsCurrentlyNotAvailable {
    return Intl.message(
      'This button means that the chef is currently not available',
      name: 'thisButtonMeansThatTheChefIsCurrentlyNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
