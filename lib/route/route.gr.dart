// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;
import 'package:yumi/screens/calories.dart' as _i1;
import 'package:yumi/screens/cart.dart' as _i2;
import 'package:yumi/screens/chat.dart' as _i3;
import 'package:yumi/screens/checkout.dart' as _i4;
import 'package:yumi/screens/chef_profile.dart' as _i5;
import 'package:yumi/screens/documentation.dart' as _i6;
import 'package:yumi/screens/financial_view.dart' as _i7;
import 'package:yumi/screens/forget_password.dart' as _i8;
import 'package:yumi/screens/home.dart' as _i9;
import 'package:yumi/screens/login.dart' as _i10;
import 'package:yumi/screens/menu_pre.dart' as _i11;
import 'package:yumi/screens/my_schedule.dart' as _i12;
import 'package:yumi/screens/notification.dart' as _i13;
import 'package:yumi/screens/payment_visa.dart' as _i14;
import 'package:yumi/screens/performance_analysis.dart' as _i15;
import 'package:yumi/screens/signup.dart' as _i16;
import 'package:yumi/screens/transactions.dart' as _i17;

abstract class $AppRouter extends _i18.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    CaloriesReferenceRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CaloriesReferenceScreen(),
      );
    },
    Cart.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.Cart(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ChatScreen(),
      );
    },
    CheckOut.name: (routeData) {
      final args =
          routeData.argsAs<CheckOutArgs>(orElse: () => const CheckOutArgs());
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CheckOut(key: args.key),
      );
    },
    ChefProfile.name: (routeData) {
      final args = routeData.argsAs<ChefProfileArgs>();
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ChefProfile(
          key: args.key,
          chef: args.chef,
        ),
      );
    },
    DocumentationRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.DocumentationScreen(),
      );
    },
    FinancialViewRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.FinancialViewScreen(),
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ForgetPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.HomeScreen(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.LoginScreen(key: args.key),
      );
    },
    MenuPreOrderRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MenuPreOrderScreen(),
      );
    },
    MyScheduleRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.MyScheduleScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.NotificationScreen(),
      );
    },
    PaymentVisa.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.PaymentVisa(),
      );
    },
    PerformanceAnalysisRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PerformanceAnalysisScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.SignUpScreen(key: args.key),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.TransactionsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CaloriesReferenceScreen]
class CaloriesReferenceRoute extends _i18.PageRouteInfo<void> {
  const CaloriesReferenceRoute({List<_i18.PageRouteInfo>? children})
      : super(
          CaloriesReferenceRoute.name,
          initialChildren: children,
        );

  static const String name = 'CaloriesReferenceRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Cart]
class Cart extends _i18.PageRouteInfo<void> {
  const Cart({List<_i18.PageRouteInfo>? children})
      : super(
          Cart.name,
          initialChildren: children,
        );

  static const String name = 'Cart';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ChatScreen]
class ChatRoute extends _i18.PageRouteInfo<void> {
  const ChatRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CheckOut]
class CheckOut extends _i18.PageRouteInfo<CheckOutArgs> {
  CheckOut({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          CheckOut.name,
          args: CheckOutArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CheckOut';

  static const _i18.PageInfo<CheckOutArgs> page =
      _i18.PageInfo<CheckOutArgs>(name);
}

class CheckOutArgs {
  const CheckOutArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'CheckOutArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.ChefProfile]
class ChefProfile extends _i18.PageRouteInfo<ChefProfileArgs> {
  ChefProfile({
    _i19.Key? key,
    required dynamic chef,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          ChefProfile.name,
          args: ChefProfileArgs(
            key: key,
            chef: chef,
          ),
          initialChildren: children,
        );

  static const String name = 'ChefProfile';

  static const _i18.PageInfo<ChefProfileArgs> page =
      _i18.PageInfo<ChefProfileArgs>(name);
}

class ChefProfileArgs {
  const ChefProfileArgs({
    this.key,
    required this.chef,
  });

  final _i19.Key? key;

  final dynamic chef;

  @override
  String toString() {
    return 'ChefProfileArgs{key: $key, chef: $chef}';
  }
}

/// generated route for
/// [_i6.DocumentationScreen]
class DocumentationRoute extends _i18.PageRouteInfo<void> {
  const DocumentationRoute({List<_i18.PageRouteInfo>? children})
      : super(
          DocumentationRoute.name,
          initialChildren: children,
        );

  static const String name = 'DocumentationRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i7.FinancialViewScreen]
class FinancialViewRoute extends _i18.PageRouteInfo<void> {
  const FinancialViewRoute({List<_i18.PageRouteInfo>? children})
      : super(
          FinancialViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinancialViewRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i18.PageRouteInfo<void> {
  const ForgetPasswordRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ForgetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i9.HomeScreen]
class HomeRoute extends _i18.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i18.PageInfo<HomeRouteArgs> page =
      _i18.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.LoginScreen]
class LoginRoute extends _i18.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i18.PageInfo<LoginRouteArgs> page =
      _i18.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.MenuPreOrderScreen]
class MenuPreOrderRoute extends _i18.PageRouteInfo<void> {
  const MenuPreOrderRoute({List<_i18.PageRouteInfo>? children})
      : super(
          MenuPreOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuPreOrderRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i12.MyScheduleScreen]
class MyScheduleRoute extends _i18.PageRouteInfo<void> {
  const MyScheduleRoute({List<_i18.PageRouteInfo>? children})
      : super(
          MyScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyScheduleRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i13.NotificationScreen]
class NotificationRoute extends _i18.PageRouteInfo<void> {
  const NotificationRoute({List<_i18.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i14.PaymentVisa]
class PaymentVisa extends _i18.PageRouteInfo<void> {
  const PaymentVisa({List<_i18.PageRouteInfo>? children})
      : super(
          PaymentVisa.name,
          initialChildren: children,
        );

  static const String name = 'PaymentVisa';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PerformanceAnalysisScreen]
class PerformanceAnalysisRoute extends _i18.PageRouteInfo<void> {
  const PerformanceAnalysisRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PerformanceAnalysisRoute.name,
          initialChildren: children,
        );

  static const String name = 'PerformanceAnalysisRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SignUpScreen]
class SignUpRoute extends _i18.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i19.Key? key,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i18.PageInfo<SignUpRouteArgs> page =
      _i18.PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i19.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.TransactionsScreen]
class TransactionsRoute extends _i18.PageRouteInfo<void> {
  const TransactionsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}
