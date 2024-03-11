// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
<<<<<<< HEAD
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:yumi/features/contract/contract_screen.dart' as _i6;
import 'package:yumi/features/documentation/documentation_screen.dart' as _i7;
=======
import 'package:auto_route/auto_route.dart' as _i21;
import 'package:flutter/material.dart' as _i22;
>>>>>>> origin/master
import 'package:yumi/screens/calories.dart' as _i1;
import 'package:yumi/screens/cart.dart' as _i2;
import 'package:yumi/screens/chat.dart' as _i3;
import 'package:yumi/screens/checkout.dart' as _i4;
import 'package:yumi/screens/chef_profile.dart' as _i5;
<<<<<<< HEAD
import 'package:yumi/screens/financial_view.dart' as _i8;
import 'package:yumi/screens/forget_password.dart' as _i9;
import 'package:yumi/screens/home.dart' as _i10;
import 'package:yumi/screens/login.dart' as _i11;
import 'package:yumi/screens/menu_pre.dart' as _i12;
import 'package:yumi/screens/my_schedule.dart' as _i13;
import 'package:yumi/screens/notification.dart' as _i14;
import 'package:yumi/screens/payment_visa.dart' as _i15;
import 'package:yumi/screens/performance_analysis.dart' as _i16;
import 'package:yumi/screens/signup.dart' as _i17;
import 'package:yumi/screens/transactions.dart' as _i18;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    CaloriesReferenceRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
=======
import 'package:yumi/screens/documentation.dart' as _i6;
import 'package:yumi/screens/financial_view.dart' as _i7;
import 'package:yumi/screens/forget_password.dart' as _i8;
import 'package:yumi/screens/home.dart' as _i9;
import 'package:yumi/screens/login.dart' as _i10;
import 'package:yumi/screens/menu_pre.dart' as _i11;
import 'package:yumi/screens/my_schedule.dart' as _i12;
import 'package:yumi/screens/notification.dart' as _i13;
import 'package:yumi/screens/order_status.dart' as _i14;
import 'package:yumi/screens/payment_paypal.dart' as _i15;
import 'package:yumi/screens/payment_visa.dart' as _i16;
import 'package:yumi/screens/performance_analysis.dart' as _i17;
import 'package:yumi/screens/signup.dart' as _i18;
import 'package:yumi/screens/tracking_order.dart' as _i19;
import 'package:yumi/screens/transactions.dart' as _i20;

abstract class $AppRouter extends _i21.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i21.PageFactory> pagesMap = {
    CaloriesReferenceRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
>>>>>>> origin/master
        routeData: routeData,
        child: const _i1.CaloriesReferenceScreen(),
      );
    },
<<<<<<< HEAD
    Cart.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
=======
    CartRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
>>>>>>> origin/master
        routeData: routeData,
        child: const _i2.CartScreen(),
      );
    },
    ChatRoute.name: (routeData) {
<<<<<<< HEAD
      return _i19.AutoRoutePage<dynamic>(
=======
      return _i21.AutoRoutePage<dynamic>(
>>>>>>> origin/master
        routeData: routeData,
        child: const _i3.ChatScreen(),
      );
    },
<<<<<<< HEAD
    CheckOut.name: (routeData) {
      final args =
          routeData.argsAs<CheckOutArgs>(orElse: () => const CheckOutArgs());
      return _i19.AutoRoutePage<dynamic>(
=======
    CheckOutRoute.name: (routeData) {
      final args = routeData.argsAs<CheckOutRouteArgs>(
          orElse: () => const CheckOutRouteArgs());
      return _i21.AutoRoutePage<dynamic>(
>>>>>>> origin/master
        routeData: routeData,
        child: _i4.CheckOutScreen(key: args.key),
      );
    },
<<<<<<< HEAD
    ChefProfile.name: (routeData) {
      final args = routeData.argsAs<ChefProfileArgs>();
      return _i19.AutoRoutePage<dynamic>(
=======
    ChefProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ChefProfileRouteArgs>();
      return _i21.AutoRoutePage<dynamic>(
>>>>>>> origin/master
        routeData: routeData,
        child: _i5.ChefProfileScreen(
          key: args.key,
          chef: args.chef,
        ),
      );
    },
<<<<<<< HEAD
    ContractRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
=======
    DocumentationRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
>>>>>>> origin/master
        routeData: routeData,
        child: const _i6.ContractScreen(),
      );
    },
    DocumentationRoute.name: (routeData) {
      final args = routeData.argsAs<DocumentationRouteArgs>(
          orElse: () => const DocumentationRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DocumentationScreen(key: args.key),
      );
    },
    FinancialViewRoute.name: (routeData) {
<<<<<<< HEAD
      return _i19.AutoRoutePage<dynamic>(
=======
      return _i21.AutoRoutePage<dynamic>(
>>>>>>> origin/master
        routeData: routeData,
        child: const _i8.FinancialViewScreen(),
      );
    },
    ForgetPasswordRoute.name: (routeData) {
<<<<<<< HEAD
      return _i19.AutoRoutePage<dynamic>(
=======
      return _i21.AutoRoutePage<dynamic>(
>>>>>>> origin/master
        routeData: routeData,
        child: const _i9.ForgetPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
<<<<<<< HEAD
      return _i19.AutoRoutePage<dynamic>(
=======
      return _i21.AutoRoutePage<dynamic>(
>>>>>>> origin/master
        routeData: routeData,
        child: _i10.HomeScreen(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
<<<<<<< HEAD
      return _i19.AutoRoutePage<dynamic>(
=======
      return _i21.AutoRoutePage<dynamic>(
>>>>>>> origin/master
        routeData: routeData,
        child: _i11.LoginScreen(key: args.key),
      );
    },
    MenuPreOrderRoute.name: (routeData) {
<<<<<<< HEAD
      return _i19.AutoRoutePage<dynamic>(
=======
      return _i21.AutoRoutePage<dynamic>(
>>>>>>> origin/master
        routeData: routeData,
        child: const _i12.MenuPreOrderScreen(),
      );
    },
    MyScheduleRoute.name: (routeData) {
<<<<<<< HEAD
      return _i19.AutoRoutePage<dynamic>(
=======
      return _i21.AutoRoutePage<dynamic>(
>>>>>>> origin/master
        routeData: routeData,
        child: const _i13.MyScheduleScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
<<<<<<< HEAD
      return _i19.AutoRoutePage<dynamic>(
=======
      return _i21.AutoRoutePage<dynamic>(
>>>>>>> origin/master
        routeData: routeData,
        child: const _i14.NotificationScreen(),
      );
    },
<<<<<<< HEAD
    PaymentVisa.name: (routeData) {
      final args = routeData.argsAs<PaymentVisaArgs>(
          orElse: () => const PaymentVisaArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.PaymentVisa(key: args.key),
      );
    },
    PerformanceAnalysisRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PerformanceAnalysisScreen(),
=======
    OrderStatusRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.OrderStatusScreen(),
      );
    },
    PaymentPaypalRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PaymentPaypalScreen(),
      );
    },
    PaymentVisaRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentVisaRouteArgs>(
          orElse: () => const PaymentVisaRouteArgs());
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.PaymentVisaScreen(key: args.key),
      );
    },
    PerformanceAnalysisRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.PerformanceAnalysisScreen(),
>>>>>>> origin/master
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
<<<<<<< HEAD
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.SignUpScreen(key: args.key),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.TransactionsScreen(),
=======
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.SignUpScreen(key: args.key),
      );
    },
    TrackingOrderRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.TrackingOrderScreen(),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i21.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.TransactionsScreen(),
>>>>>>> origin/master
      );
    },
  };
}

/// generated route for
/// [_i1.CaloriesReferenceScreen]
<<<<<<< HEAD
class CaloriesReferenceRoute extends _i19.PageRouteInfo<void> {
  const CaloriesReferenceRoute({List<_i19.PageRouteInfo>? children})
=======
class CaloriesReferenceRoute extends _i21.PageRouteInfo<void> {
  const CaloriesReferenceRoute({List<_i21.PageRouteInfo>? children})
>>>>>>> origin/master
      : super(
          CaloriesReferenceRoute.name,
          initialChildren: children,
        );

  static const String name = 'CaloriesReferenceRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Cart]
class Cart extends _i19.PageRouteInfo<void> {
  const Cart({List<_i19.PageRouteInfo>? children})
=======
  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CartScreen]
class CartRoute extends _i21.PageRouteInfo<void> {
  const CartRoute({List<_i21.PageRouteInfo>? children})
>>>>>>> origin/master
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
=======
  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
>>>>>>> origin/master
}

/// generated route for
/// [_i3.ChatScreen]
<<<<<<< HEAD
class ChatRoute extends _i19.PageRouteInfo<void> {
  const ChatRoute({List<_i19.PageRouteInfo>? children})
=======
class ChatRoute extends _i21.PageRouteInfo<void> {
  const ChatRoute({List<_i21.PageRouteInfo>? children})
>>>>>>> origin/master
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CheckOut]
class CheckOut extends _i19.PageRouteInfo<CheckOutArgs> {
  CheckOut({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
=======
  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CheckOutScreen]
class CheckOutRoute extends _i21.PageRouteInfo<CheckOutRouteArgs> {
  CheckOutRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
>>>>>>> origin/master
  }) : super(
          CheckOutRoute.name,
          args: CheckOutRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CheckOutRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<CheckOutArgs> page =
      _i19.PageInfo<CheckOutArgs>(name);
=======
  static const _i21.PageInfo<CheckOutRouteArgs> page =
      _i21.PageInfo<CheckOutRouteArgs>(name);
>>>>>>> origin/master
}

class CheckOutRouteArgs {
  const CheckOutRouteArgs({this.key});

<<<<<<< HEAD
  final _i20.Key? key;
=======
  final _i22.Key? key;
>>>>>>> origin/master

  @override
  String toString() {
    return 'CheckOutRouteArgs{key: $key}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i5.ChefProfile]
class ChefProfile extends _i19.PageRouteInfo<ChefProfileArgs> {
  ChefProfile({
    _i20.Key? key,
    required dynamic chef,
    List<_i19.PageRouteInfo>? children,
=======
/// [_i5.ChefProfileScreen]
class ChefProfileRoute extends _i21.PageRouteInfo<ChefProfileRouteArgs> {
  ChefProfileRoute({
    _i22.Key? key,
    required dynamic chef,
    List<_i21.PageRouteInfo>? children,
>>>>>>> origin/master
  }) : super(
          ChefProfileRoute.name,
          args: ChefProfileRouteArgs(
            key: key,
            chef: chef,
          ),
          initialChildren: children,
        );

  static const String name = 'ChefProfileRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<ChefProfileArgs> page =
      _i19.PageInfo<ChefProfileArgs>(name);
=======
  static const _i21.PageInfo<ChefProfileRouteArgs> page =
      _i21.PageInfo<ChefProfileRouteArgs>(name);
>>>>>>> origin/master
}

class ChefProfileRouteArgs {
  const ChefProfileRouteArgs({
    this.key,
    required this.chef,
  });

<<<<<<< HEAD
  final _i20.Key? key;
=======
  final _i22.Key? key;
>>>>>>> origin/master

  final dynamic chef;

  @override
  String toString() {
    return 'ChefProfileRouteArgs{key: $key, chef: $chef}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i6.ContractScreen]
class ContractRoute extends _i19.PageRouteInfo<void> {
  const ContractRoute({List<_i19.PageRouteInfo>? children})
=======
/// [_i6.DocumentationScreen]
class DocumentationRoute extends _i21.PageRouteInfo<void> {
  const DocumentationRoute({List<_i21.PageRouteInfo>? children})
>>>>>>> origin/master
      : super(
          ContractRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContractRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i7.DocumentationScreen]
class DocumentationRoute extends _i19.PageRouteInfo<DocumentationRouteArgs> {
  DocumentationRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          DocumentationRoute.name,
          args: DocumentationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DocumentationRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<DocumentationRouteArgs> page =
      _i19.PageInfo<DocumentationRouteArgs>(name);
}

class DocumentationRouteArgs {
  const DocumentationRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'DocumentationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.FinancialViewScreen]
class FinancialViewRoute extends _i19.PageRouteInfo<void> {
  const FinancialViewRoute({List<_i19.PageRouteInfo>? children})
=======
  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i7.FinancialViewScreen]
class FinancialViewRoute extends _i21.PageRouteInfo<void> {
  const FinancialViewRoute({List<_i21.PageRouteInfo>? children})
>>>>>>> origin/master
      : super(
          FinancialViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinancialViewRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i19.PageRouteInfo<void> {
  const ForgetPasswordRoute({List<_i19.PageRouteInfo>? children})
=======
  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i21.PageRouteInfo<void> {
  const ForgetPasswordRoute({List<_i21.PageRouteInfo>? children})
>>>>>>> origin/master
      : super(
          ForgetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i10.HomeScreen]
class HomeRoute extends _i19.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
=======
  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomeScreen]
class HomeRoute extends _i21.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
>>>>>>> origin/master
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<HomeRouteArgs> page =
      _i19.PageInfo<HomeRouteArgs>(name);
=======
  static const _i21.PageInfo<HomeRouteArgs> page =
      _i21.PageInfo<HomeRouteArgs>(name);
>>>>>>> origin/master
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

<<<<<<< HEAD
  final _i20.Key? key;
=======
  final _i22.Key? key;
>>>>>>> origin/master

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i11.LoginScreen]
class LoginRoute extends _i19.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
=======
/// [_i10.LoginScreen]
class LoginRoute extends _i21.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
>>>>>>> origin/master
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<LoginRouteArgs> page =
      _i19.PageInfo<LoginRouteArgs>(name);
=======
  static const _i21.PageInfo<LoginRouteArgs> page =
      _i21.PageInfo<LoginRouteArgs>(name);
>>>>>>> origin/master
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

<<<<<<< HEAD
  final _i20.Key? key;
=======
  final _i22.Key? key;
>>>>>>> origin/master

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i12.MenuPreOrderScreen]
class MenuPreOrderRoute extends _i19.PageRouteInfo<void> {
  const MenuPreOrderRoute({List<_i19.PageRouteInfo>? children})
=======
/// [_i11.MenuPreOrderScreen]
class MenuPreOrderRoute extends _i21.PageRouteInfo<void> {
  const MenuPreOrderRoute({List<_i21.PageRouteInfo>? children})
>>>>>>> origin/master
      : super(
          MenuPreOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuPreOrderRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i13.MyScheduleScreen]
class MyScheduleRoute extends _i19.PageRouteInfo<void> {
  const MyScheduleRoute({List<_i19.PageRouteInfo>? children})
=======
  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i12.MyScheduleScreen]
class MyScheduleRoute extends _i21.PageRouteInfo<void> {
  const MyScheduleRoute({List<_i21.PageRouteInfo>? children})
>>>>>>> origin/master
      : super(
          MyScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyScheduleRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i14.NotificationScreen]
class NotificationRoute extends _i19.PageRouteInfo<void> {
  const NotificationRoute({List<_i19.PageRouteInfo>? children})
=======
  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i13.NotificationScreen]
class NotificationRoute extends _i21.PageRouteInfo<void> {
  const NotificationRoute({List<_i21.PageRouteInfo>? children})
>>>>>>> origin/master
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PaymentVisa]
class PaymentVisa extends _i19.PageRouteInfo<PaymentVisaArgs> {
  PaymentVisa({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          PaymentVisa.name,
          args: PaymentVisaArgs(key: key),
=======
  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i14.OrderStatusScreen]
class OrderStatusRoute extends _i21.PageRouteInfo<void> {
  const OrderStatusRoute({List<_i21.PageRouteInfo>? children})
      : super(
          OrderStatusRoute.name,
>>>>>>> origin/master
          initialChildren: children,
        );

  static const String name = 'OrderStatusRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<PaymentVisaArgs> page =
      _i19.PageInfo<PaymentVisaArgs>(name);
}

class PaymentVisaArgs {
  const PaymentVisaArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'PaymentVisaArgs{key: $key}';
  }
}

/// generated route for
/// [_i16.PerformanceAnalysisScreen]
class PerformanceAnalysisRoute extends _i19.PageRouteInfo<void> {
  const PerformanceAnalysisRoute({List<_i19.PageRouteInfo>? children})
=======
  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PaymentPaypalScreen]
class PaymentPaypalRoute extends _i21.PageRouteInfo<void> {
  const PaymentPaypalRoute({List<_i21.PageRouteInfo>? children})
      : super(
          PaymentPaypalRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentPaypalRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PaymentVisaScreen]
class PaymentVisaRoute extends _i21.PageRouteInfo<PaymentVisaRouteArgs> {
  PaymentVisaRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
  }) : super(
          PaymentVisaRoute.name,
          args: PaymentVisaRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PaymentVisaRoute';

  static const _i21.PageInfo<PaymentVisaRouteArgs> page =
      _i21.PageInfo<PaymentVisaRouteArgs>(name);
}

class PaymentVisaRouteArgs {
  const PaymentVisaRouteArgs({this.key});

  final _i22.Key? key;

  @override
  String toString() {
    return 'PaymentVisaRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.PerformanceAnalysisScreen]
class PerformanceAnalysisRoute extends _i21.PageRouteInfo<void> {
  const PerformanceAnalysisRoute({List<_i21.PageRouteInfo>? children})
>>>>>>> origin/master
      : super(
          PerformanceAnalysisRoute.name,
          initialChildren: children,
        );

  static const String name = 'PerformanceAnalysisRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SignUpScreen]
class SignUpRoute extends _i19.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
=======
  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SignUpScreen]
class SignUpRoute extends _i21.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i22.Key? key,
    List<_i21.PageRouteInfo>? children,
>>>>>>> origin/master
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<SignUpRouteArgs> page =
      _i19.PageInfo<SignUpRouteArgs>(name);
=======
  static const _i21.PageInfo<SignUpRouteArgs> page =
      _i21.PageInfo<SignUpRouteArgs>(name);
>>>>>>> origin/master
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

<<<<<<< HEAD
  final _i20.Key? key;
=======
  final _i22.Key? key;
>>>>>>> origin/master

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i18.TransactionsScreen]
class TransactionsRoute extends _i19.PageRouteInfo<void> {
  const TransactionsRoute({List<_i19.PageRouteInfo>? children})
=======
/// [_i19.TrackingOrderScreen]
class TrackingOrderRoute extends _i21.PageRouteInfo<void> {
  const TrackingOrderRoute({List<_i21.PageRouteInfo>? children})
      : super(
          TrackingOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrackingOrderRoute';

  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
}

/// generated route for
/// [_i20.TransactionsScreen]
class TransactionsRoute extends _i21.PageRouteInfo<void> {
  const TransactionsRoute({List<_i21.PageRouteInfo>? children})
>>>>>>> origin/master
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

<<<<<<< HEAD
  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
=======
  static const _i21.PageInfo<void> page = _i21.PageInfo<void>(name);
>>>>>>> origin/master
}
