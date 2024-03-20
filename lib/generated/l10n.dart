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

  /// `Min`
  String get min {
    return Intl.message(
      'Min',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `$`
  String get currency {
    return Intl.message(
      '\$',
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

  /// `For how many person`
  String get forHowManyPerson {
    return Intl.message(
      'For how many person',
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

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Delete meal`
  String get deleteMeal {
    return Intl.message(
      'Delete meal',
      name: 'deleteMeal',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to delete a meal?`
  String get areYouSureToDeleteAMeal {
    return Intl.message(
      'Are you sure to delete a meal?',
      name: 'areYouSureToDeleteAMeal',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Orders History`
  String get ordersHistory {
    return Intl.message(
      'Orders History',
      name: 'ordersHistory',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get firstName {
    return Intl.message(
      'First name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get lastName {
    return Intl.message(
      'Last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Featured Chefs`
  String get featuredChefs {
    return Intl.message(
      'Featured Chefs',
      name: 'featuredChefs',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `Invalid input`
  String get invalidInput {
    return Intl.message(
      'Invalid input',
      name: 'invalidInput',
      desc: '',
      args: [],
    );
  }

  /// `Add bank account`
  String get addBankAccount {
    return Intl.message(
      'Add bank account',
      name: 'addBankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Bank name`
  String get bankName {
    return Intl.message(
      'Bank name',
      name: 'bankName',
      desc: '',
      args: [],
    );
  }

  /// `Account name`
  String get accountName {
    return Intl.message(
      'Account name',
      name: 'accountName',
      desc: '',
      args: [],
    );
  }

  /// `Bank currency`
  String get bankCurrency {
    return Intl.message(
      'Bank currency',
      name: 'bankCurrency',
      desc: '',
      args: [],
    );
  }

  /// `IBan`
  String get iban {
    return Intl.message(
      'IBan',
      name: 'iban',
      desc: '',
      args: [],
    );
  }

  /// `Swift code`
  String get swiftCode {
    return Intl.message(
      'Swift code',
      name: 'swiftCode',
      desc: '',
      args: [],
    );
  }

  /// `Branch address`
  String get branchAddress {
    return Intl.message(
      'Branch address',
      name: 'branchAddress',
      desc: '',
      args: [],
    );
  }

  /// `Open`
  String get open {
    return Intl.message(
      'Open',
      name: 'open',
      desc: '',
      args: [],
    );
  }

  /// `Order Again`
  String get orderAgain {
    return Intl.message(
      'Order Again',
      name: 'orderAgain',
      desc: '',
      args: [],
    );
  }

  /// `Chef events`
  String get chefEvents {
    return Intl.message(
      'Chef events',
      name: 'chefEvents',
      desc: '',
      args: [],
    );
  }

  /// `Cuisine`
  String get cuisine {
    return Intl.message(
      'Cuisine',
      name: 'cuisine',
      desc: '',
      args: [],
    );
  }

  /// `Add Pre-order`
  String get addPreOrder {
    return Intl.message(
      'Add Pre-order',
      name: 'addPreOrder',
      desc: '',
      args: [],
    );
  }

  /// `Happy Customer`
  String get happyCustomer {
    return Intl.message(
      'Happy Customer',
      name: 'happyCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Create your review now`
  String get createYourReviewNow {
    return Intl.message(
      'Create your review now',
      name: 'createYourReviewNow',
      desc: '',
      args: [],
    );
  }

  /// `Please specify the day & time of delivery`
  String get pleaseSpecifyTheDayTimeOfDelivery {
    return Intl.message(
      'Please specify the day & time of delivery',
      name: 'pleaseSpecifyTheDayTimeOfDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message(
      'Day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Delivery day`
  String get deliveryDay {
    return Intl.message(
      'Delivery day',
      name: 'deliveryDay',
      desc: '',
      args: [],
    );
  }

  /// `Delivery time`
  String get deliveryTime {
    return Intl.message(
      'Delivery time',
      name: 'deliveryTime',
      desc: '',
      args: [],
    );
  }

  /// `PM`
  String get pm {
    return Intl.message(
      'PM',
      name: 'pm',
      desc: '',
      args: [],
    );
  }

  /// `AM`
  String get am {
    return Intl.message(
      'AM',
      name: 'am',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue0 {
    return Intl.message(
      'Continue',
      name: 'continue0',
      desc: '',
      args: [],
    );
  }

  /// `What you wish to eat today?`
  String get whatYouWishToEatToday {
    return Intl.message(
      'What you wish to eat today?',
      name: 'whatYouWishToEatToday',
      desc: '',
      args: [],
    );
  }

  /// `Search for food`
  String get searchForFood {
    return Intl.message(
      'Search for food',
      name: 'searchForFood',
      desc: '',
      args: [],
    );
  }

  /// `Dish Name`
  String get dishName {
    return Intl.message(
      'Dish Name',
      name: 'dishName',
      desc: '',
      args: [],
    );
  }

  /// `Cuisines`
  String get cuisines {
    return Intl.message(
      'Cuisines',
      name: 'cuisines',
      desc: '',
      args: [],
    );
  }

  /// `Recent Search`
  String get recentSearch {
    return Intl.message(
      'Recent Search',
      name: 'recentSearch',
      desc: '',
      args: [],
    );
  }

  /// `Suggestions`
  String get suggestions {
    return Intl.message(
      'Suggestions',
      name: 'suggestions',
      desc: '',
      args: [],
    );
  }

  /// `Online Chefs`
  String get onlineChefs {
    return Intl.message(
      'Online Chefs',
      name: 'onlineChefs',
      desc: '',
      args: [],
    );
  }

  /// `Points`
  String get points {
    return Intl.message(
      'Points',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `Chefs`
  String get chefs {
    return Intl.message(
      'Chefs',
      name: 'chefs',
      desc: '',
      args: [],
    );
  }

  /// `Basket`
  String get basket {
    return Intl.message(
      'Basket',
      name: 'basket',
      desc: '',
      args: [],
    );
  }

  /// `Special request`
  String get specialRequest {
    return Intl.message(
      'Special request',
      name: 'specialRequest',
      desc: '',
      args: [],
    );
  }

  /// `Anything else we need to know?`
  String get anythingElseWeNeedToKnow {
    return Intl.message(
      'Anything else we need to know?',
      name: 'anythingElseWeNeedToKnow',
      desc: '',
      args: [],
    );
  }

  /// `Add a note`
  String get addANote {
    return Intl.message(
      'Add a note',
      name: 'addANote',
      desc: '',
      args: [],
    );
  }

  /// `Payment summary`
  String get paymentSummary {
    return Intl.message(
      'Payment summary',
      name: 'paymentSummary',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get subtotal {
    return Intl.message(
      'Subtotal',
      name: 'subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Total amount`
  String get totalAmount {
    return Intl.message(
      'Total amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Read more about fees`
  String get readMoreAboutFees {
    return Intl.message(
      'Read more about fees',
      name: 'readMoreAboutFees',
      desc: '',
      args: [],
    );
  }

  /// `Add foods`
  String get addFoods {
    return Intl.message(
      'Add foods',
      name: 'addFoods',
      desc: '',
      args: [],
    );
  }

  /// `Checkout`
  String get checkout {
    return Intl.message(
      'Checkout',
      name: 'checkout',
      desc: '',
      args: [],
    );
  }

  /// `Pay with`
  String get payWith {
    return Intl.message(
      'Pay with',
      name: 'payWith',
      desc: '',
      args: [],
    );
  }

  /// `Debit/Credit Card`
  String get debitCreditCard {
    return Intl.message(
      'Debit/Credit Card',
      name: 'debitCreditCard',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Paypal`
  String get paypal {
    return Intl.message(
      'Paypal',
      name: 'paypal',
      desc: '',
      args: [],
    );
  }

  /// `Save on your order`
  String get saveOnYourOrder {
    return Intl.message(
      'Save on your order',
      name: 'saveOnYourOrder',
      desc: '',
      args: [],
    );
  }

  /// `Enter voucher code`
  String get enterVoucherCode {
    return Intl.message(
      'Enter voucher code',
      name: 'enterVoucherCode',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Disclaimer`
  String get disclaimer {
    return Intl.message(
      'Disclaimer',
      name: 'disclaimer',
      desc: '',
      args: [],
    );
  }

  /// `Place order`
  String get placeOrder {
    return Intl.message(
      'Place order',
      name: 'placeOrder',
      desc: '',
      args: [],
    );
  }

  /// `Add Card details`
  String get addCardDetails {
    return Intl.message(
      'Add Card details',
      name: 'addCardDetails',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get pay {
    return Intl.message(
      'Pay',
      name: 'pay',
      desc: '',
      args: [],
    );
  }

  /// `Card number`
  String get cardNumber {
    return Intl.message(
      'Card number',
      name: 'cardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Expiry date (mm/yy)`
  String get expiryDateMMYY {
    return Intl.message(
      'Expiry date (mm/yy)',
      name: 'expiryDateMMYY',
      desc: '',
      args: [],
    );
  }

  /// `Security code`
  String get securityCode {
    return Intl.message(
      'Security code',
      name: 'securityCode',
      desc: '',
      args: [],
    );
  }

  /// `Save credit card details`
  String get saveCreditCardDetails {
    return Intl.message(
      'Save credit card details',
      name: 'saveCreditCardDetails',
      desc: '',
      args: [],
    );
  }

  /// `Secure payment with SSL Encryption info`
  String get securePaymentWithSSLEncryptionInfo {
    return Intl.message(
      'Secure payment with SSL Encryption info',
      name: 'securePaymentWithSSLEncryptionInfo',
      desc: '',
      args: [],
    );
  }

  /// `Pay By Paypal`
  String get payByPaypal {
    return Intl.message(
      'Pay By Paypal',
      name: 'payByPaypal',
      desc: '',
      args: [],
    );
  }

  /// `Order Status`
  String get orderStatus {
    return Intl.message(
      'Order Status',
      name: 'orderStatus',
      desc: '',
      args: [],
    );
  }

  /// `Invoice`
  String get invoice {
    return Intl.message(
      'Invoice',
      name: 'invoice',
      desc: '',
      args: [],
    );
  }

  /// `Preparing Order`
  String get preparingOrder {
    return Intl.message(
      'Preparing Order',
      name: 'preparingOrder',
      desc: '',
      args: [],
    );
  }

  /// `On The Way`
  String get onTheWay {
    return Intl.message(
      'On The Way',
      name: 'onTheWay',
      desc: '',
      args: [],
    );
  }

  /// `Tracking`
  String get tracking {
    return Intl.message(
      'Tracking',
      name: 'tracking',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Delivery`
  String get confirmDelivery {
    return Intl.message(
      'Confirm Delivery',
      name: 'confirmDelivery',
      desc: '',
      args: [],
    );
  }

  /// `Arrives In`
  String get arrivesIn {
    return Intl.message(
      'Arrives In',
      name: 'arrivesIn',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get minutes {
    return Intl.message(
      'Minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get orderDetails {
    return Intl.message(
      'Order Details',
      name: 'orderDetails',
      desc: '',
      args: [],
    );
  }

  /// `Your orders`
  String get yourOrders {
    return Intl.message(
      'Your orders',
      name: 'yourOrders',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `Vouchers`
  String get vouchers {
    return Intl.message(
      'Vouchers',
      name: 'vouchers',
      desc: '',
      args: [],
    );
  }

  /// `Your wallet`
  String get yourWallet {
    return Intl.message(
      'Your wallet',
      name: 'yourWallet',
      desc: '',
      args: [],
    );
  }

  /// `Contract`
  String get contract {
    return Intl.message(
      'Contract',
      name: 'contract',
      desc: '',
      args: [],
    );
  }

  /// `Profile Settings`
  String get profileSettings {
    return Intl.message(
      'Profile Settings',
      name: 'profileSettings',
      desc: '',
      args: [],
    );
  }

  /// `No Access To Dail System!`
  String get noAccessToDailSystem {
    return Intl.message(
      'No Access To Dail System!',
      name: 'noAccessToDailSystem',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Shipping fee`
  String get shippingFee {
    return Intl.message(
      'Shipping fee',
      name: 'shippingFee',
      desc: '',
      args: [],
    );
  }

  /// `Delivery in`
  String get deliveryIn {
    return Intl.message(
      'Delivery in',
      name: 'deliveryIn',
      desc: '',
      args: [],
    );
  }

  /// `Km`
  String get km {
    return Intl.message(
      'Km',
      name: 'km',
      desc: '',
      args: [],
    );
  }

  /// `Nutritional value per 100g`
  String get nutritionalValuePer100g {
    return Intl.message(
      'Nutritional value per 100g',
      name: 'nutritionalValuePer100g',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `Meals`
  String get meals {
    return Intl.message(
      'Meals',
      name: 'meals',
      desc: '',
      args: [],
    );
  }

  /// `Chef Menu`
  String get chefMenu {
    return Intl.message(
      'Chef Menu',
      name: 'chefMenu',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get delivery {
    return Intl.message(
      'Delivery',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `Order created successfully`
  String get orderCreatedSuccessfully {
    return Intl.message(
      'Order created successfully',
      name: 'orderCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Hour`
  String get hour {
    return Intl.message(
      'Hour',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `Chef Cuisines`
  String get chefCuisines {
    return Intl.message(
      'Chef Cuisines',
      name: 'chefCuisines',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your location or allow access to your location to ﬁnd restaurants near you.`
  String
      get pleaseEnterYourLocationOrAllowAccessToYourLocationToFndRestaurantsNearYou {
    return Intl.message(
      'Please enter your location or allow access to your location to ﬁnd restaurants near you.',
      name:
          'pleaseEnterYourLocationOrAllowAccessToYourLocationToFndRestaurantsNearYou',
      desc: '',
      args: [],
    );
  }

  /// `Use Current Location`
  String get useCurrentLocation {
    return Intl.message(
      'Use Current Location',
      name: 'useCurrentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Search or enter an address`
  String get searchOrEnterAnAddress {
    return Intl.message(
      'Search or enter an address',
      name: 'searchOrEnterAnAddress',
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
