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

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `My schedule`
  String get mySchedule {
    return Intl.message(
      'My schedule',
      name: 'mySchedule',
      desc: '',
      args: [],
    );
  }

  /// `Menus`
  String get menus {
    return Intl.message(
      'Menus',
      name: 'menus',
      desc: '',
      args: [],
    );
  }

  /// `Calories reference`
  String get caloriesReference {
    return Intl.message(
      'Calories reference',
      name: 'caloriesReference',
      desc: '',
      args: [],
    );
  }

  /// `Documentation`
  String get documentation {
    return Intl.message(
      'Documentation',
      name: 'documentation',
      desc: '',
      args: [],
    );
  }

  /// `Performance analysis`
  String get performanceAnalysis {
    return Intl.message(
      'Performance analysis',
      name: 'performanceAnalysis',
      desc: '',
      args: [],
    );
  }

  /// `Financial view`
  String get financialView {
    return Intl.message(
      'Financial view',
      name: 'financialView',
      desc: '',
      args: [],
    );
  }

  /// `Get help`
  String get getHelp {
    return Intl.message(
      'Get help',
      name: 'getHelp',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get transactions {
    return Intl.message(
      'Transactions',
      name: 'transactions',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message(
      'Log Out',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Menu (orders)`
  String get menuOrders {
    return Intl.message(
      'Menu (orders)',
      name: 'menuOrders',
      desc: '',
      args: [],
    );
  }

  /// `Menu (pre-orders)`
  String get menuPreOrders {
    return Intl.message(
      'Menu (pre-orders)',
      name: 'menuPreOrders',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Pre Orders`
  String get preOrder {
    return Intl.message(
      'Pre Orders',
      name: 'preOrder',
      desc: '',
      args: [],
    );
  }

  /// `Hygiene`
  String get hygiene {
    return Intl.message(
      'Hygiene',
      name: 'hygiene',
      desc: '',
      args: [],
    );
  }

  /// `Bio`
  String get bio {
    return Intl.message(
      'Bio',
      name: 'bio',
      desc: '',
      args: [],
    );
  }

  /// `Events Photo`
  String get eventsPhoto {
    return Intl.message(
      'Events Photo',
      name: 'eventsPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Write a Bio`
  String get writeABio {
    return Intl.message(
      'Write a Bio',
      name: 'writeABio',
      desc: '',
      args: [],
    );
  }

  /// `Upload`
  String get upload {
    return Intl.message(
      'Upload',
      name: 'upload',
      desc: '',
      args: [],
    );
  }

  /// `My reviews`
  String get myReviews {
    return Intl.message(
      'My reviews',
      name: 'myReviews',
      desc: '',
      args: [],
    );
  }

  /// `Profile Setting`
  String get profileSetting {
    return Intl.message(
      'Profile Setting',
      name: 'profileSetting',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message(
      'Full name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get userName {
    return Intl.message(
      'User name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Pickup`
  String get pickup {
    return Intl.message(
      'Pickup',
      name: 'pickup',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Bank Account`
  String get bankAccount {
    return Intl.message(
      'Bank Account',
      name: 'bankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Holder name`
  String get holderName {
    return Intl.message(
      'Holder name',
      name: 'holderName',
      desc: '',
      args: [],
    );
  }

  /// `Name on card`
  String get nameOnCard {
    return Intl.message(
      'Name on card',
      name: 'nameOnCard',
      desc: '',
      args: [],
    );
  }

  /// `Sort code`
  String get sortCode {
    return Intl.message(
      'Sort code',
      name: 'sortCode',
      desc: '',
      args: [],
    );
  }

  /// `Account Number`
  String get accountNumber {
    return Intl.message(
      'Account Number',
      name: 'accountNumber',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message(
      'Empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Meal name`
  String get mealName {
    return Intl.message(
      'Meal name',
      name: 'mealName',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients`
  String get ingredients {
    return Intl.message(
      'Ingredients',
      name: 'ingredients',
      desc: '',
      args: [],
    );
  }

  /// `Calories`
  String get calories {
    return Intl.message(
      'Calories',
      name: 'calories',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Preparation time`
  String get preparationTime {
    return Intl.message(
      'Preparation time',
      name: 'preparationTime',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `(Min)`
  String get min {
    return Intl.message(
      '(Min)',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `($)`
  String get currency {
    return Intl.message(
      '(\$)',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Portion`
  String get portion {
    return Intl.message(
      'Portion',
      name: 'portion',
      desc: '',
      args: [],
    );
  }

  /// `(For how many person)`
  String get forHowManyPerson {
    return Intl.message(
      '(For how many person)',
      name: 'forHowManyPerson',
      desc: '',
      args: [],
    );
  }

  /// `Maximum 25 minutes`
  String get maximum25Minutes {
    return Intl.message(
      'Maximum 25 minutes',
      name: 'maximum25Minutes',
      desc: '',
      args: [],
    );
  }

  /// `Connection Error!`
  String get connectionError {
    return Intl.message(
      'Connection Error!',
      name: 'connectionError',
      desc: '',
      args: [],
    );
  }

  /// `gm`
  String get measurement {
    return Intl.message(
      'gm',
      name: 'measurement',
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
