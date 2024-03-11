// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:flutter/material.dart' as _i21;
import 'package:yumi/features/chef_application/application_flow_screen.dart'
    as _i5;
import 'package:yumi/features/chef_application/contract/contract_screen.dart'
    as _i7;
import 'package:yumi/features/chef_application/documentation/documentation_screen.dart'
    as _i8;
import 'package:yumi/screens/calories.dart' as _i1;
import 'package:yumi/screens/cart.dart' as _i2;
import 'package:yumi/screens/chat.dart' as _i3;
import 'package:yumi/screens/checkout.dart' as _i4;
import 'package:yumi/screens/chef_profile.dart' as _i6;
import 'package:yumi/screens/financial_view.dart' as _i9;
import 'package:yumi/screens/forget_password.dart' as _i10;
import 'package:yumi/screens/home.dart' as _i11;
import 'package:yumi/screens/login.dart' as _i12;
import 'package:yumi/screens/menu_pre.dart' as _i13;
import 'package:yumi/screens/my_schedule.dart' as _i14;
import 'package:yumi/screens/notification.dart' as _i15;
import 'package:yumi/screens/payment_visa.dart' as _i16;
import 'package:yumi/screens/performance_analysis.dart' as _i17;
import 'package:yumi/screens/signup.dart' as _i18;
import 'package:yumi/screens/transactions.dart' as _i19;

abstract class $AppRouter extends _i20.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    CaloriesReferenceRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CaloriesReferenceScreen(),
      );
    },
<<<<<<< HEAD
    Cart.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CartScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ChatScreen(),
      );
    },
<<<<<<< HEAD
    CheckOut.name: (routeData) {
      final args =
          routeData.argsAs<CheckOutArgs>(orElse: () => const CheckOutArgs());
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CheckOutScreen(key: args.key),
      );
    },
    ChefApplicationFlowRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ChefApplicationFlowScreen(),
      );
    },
    ChefProfile.name: (routeData) {
      final args = routeData.argsAs<ChefProfileArgs>();
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ChefProfile(
          key: args.key,
          chef: args.chef,
        ),
      );
    },
<<<<<<< HEAD
    ContractRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ContractScreen(),
      );
    },
    DocumentationRoute.name: (routeData) {
      final args = routeData.argsAs<DocumentationRouteArgs>(
          orElse: () => const DocumentationRouteArgs());
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.DocumentationScreen(key: args.key),
      );
    },
    FinancialViewRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.FinancialViewScreen(),
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ForgetPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.HomeScreen(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.LoginScreen(key: args.key),
      );
    },
    MenuPreOrderRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.MenuPreOrderScreen(),
      );
    },
    MyScheduleRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.MyScheduleScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.NotificationScreen(),
      );
    },
<<<<<<< HEAD
    PaymentVisa.name: (routeData) {
      final args = routeData.argsAs<PaymentVisaArgs>(
          orElse: () => const PaymentVisaArgs());
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.PaymentVisa(key: args.key),
      );
    },
    PerformanceAnalysisRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.PerformanceAnalysisScreen(),
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
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.SignUpScreen(key: args.key),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.TransactionsScreen(),
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
class CaloriesReferenceRoute extends _i20.PageRouteInfo<void> {
  const CaloriesReferenceRoute({List<_i20.PageRouteInfo>? children})
      : super(
          CaloriesReferenceRoute.name,
          initialChildren: children,
        );

  static const String name = 'CaloriesReferenceRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Cart]
class Cart extends _i20.PageRouteInfo<void> {
  const Cart({List<_i20.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ChatScreen]
class ChatRoute extends _i20.PageRouteInfo<void> {
  const ChatRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CheckOut]
class CheckOut extends _i20.PageRouteInfo<CheckOutArgs> {
  CheckOut({
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          CheckOutRoute.name,
          args: CheckOutRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CheckOutRoute';

  static const _i20.PageInfo<CheckOutArgs> page =
      _i20.PageInfo<CheckOutArgs>(name);
}

class CheckOutRouteArgs {
  const CheckOutRouteArgs({this.key});

  final _i21.Key? key;

  @override
  String toString() {
    return 'CheckOutRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.ChefApplicationFlowScreen]
class ChefApplicationFlowRoute extends _i20.PageRouteInfo<void> {
  const ChefApplicationFlowRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ChefApplicationFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChefApplicationFlowRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ChefProfile]
class ChefProfile extends _i20.PageRouteInfo<ChefProfileArgs> {
  ChefProfile({
    _i21.Key? key,
    required dynamic chef,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          ChefProfileRoute.name,
          args: ChefProfileRouteArgs(
            key: key,
            chef: chef,
          ),
          initialChildren: children,
        );

  static const String name = 'ChefProfileRoute';

  static const _i20.PageInfo<ChefProfileArgs> page =
      _i20.PageInfo<ChefProfileArgs>(name);
}

class ChefProfileRouteArgs {
  const ChefProfileRouteArgs({
    this.key,
    required this.chef,
  });

  final _i21.Key? key;

  final dynamic chef;

  @override
  String toString() {
    return 'ChefProfileRouteArgs{key: $key, chef: $chef}';
  }
}

/// generated route for
/// [_i7.ContractScreen]
class ContractRoute extends _i20.PageRouteInfo<void> {
  const ContractRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ContractRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContractRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i8.DocumentationScreen]
class DocumentationRoute extends _i20.PageRouteInfo<DocumentationRouteArgs> {
  DocumentationRoute({
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          DocumentationRoute.name,
          args: DocumentationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DocumentationRoute';

  static const _i20.PageInfo<DocumentationRouteArgs> page =
      _i20.PageInfo<DocumentationRouteArgs>(name);
}

class DocumentationRouteArgs {
  const DocumentationRouteArgs({this.key});

  final _i21.Key? key;

  @override
  String toString() {
    return 'DocumentationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.FinancialViewScreen]
class FinancialViewRoute extends _i20.PageRouteInfo<void> {
  const FinancialViewRoute({List<_i20.PageRouteInfo>? children})
      : super(
          FinancialViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinancialViewRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i20.PageRouteInfo<void> {
  const ForgetPasswordRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ForgetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i11.HomeScreen]
class HomeRoute extends _i20.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i20.PageInfo<HomeRouteArgs> page =
      _i20.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i21.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i12.LoginScreen]
class LoginRoute extends _i20.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i20.PageInfo<LoginRouteArgs> page =
      _i20.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i21.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.MenuPreOrderScreen]
class MenuPreOrderRoute extends _i20.PageRouteInfo<void> {
  const MenuPreOrderRoute({List<_i20.PageRouteInfo>? children})
      : super(
          MenuPreOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuPreOrderRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i14.MyScheduleScreen]
class MyScheduleRoute extends _i20.PageRouteInfo<void> {
  const MyScheduleRoute({List<_i20.PageRouteInfo>? children})
      : super(
          MyScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyScheduleRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i15.NotificationScreen]
class NotificationRoute extends _i20.PageRouteInfo<void> {
  const NotificationRoute({List<_i20.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PaymentVisa]
class PaymentVisa extends _i20.PageRouteInfo<PaymentVisaArgs> {
  PaymentVisa({
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
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

  static const _i20.PageInfo<PaymentVisaArgs> page =
      _i20.PageInfo<PaymentVisaArgs>(name);
}

class PaymentVisaArgs {
  const PaymentVisaArgs({this.key});

  final _i21.Key? key;

  @override
  String toString() {
    return 'PaymentVisaArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.PerformanceAnalysisScreen]
class PerformanceAnalysisRoute extends _i20.PageRouteInfo<void> {
  const PerformanceAnalysisRoute({List<_i20.PageRouteInfo>? children})
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

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SignUpScreen]
class SignUpRoute extends _i20.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i20.PageInfo<SignUpRouteArgs> page =
      _i20.PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i21.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i19.TransactionsScreen]
class TransactionsRoute extends _i20.PageRouteInfo<void> {
  const TransactionsRoute({List<_i20.PageRouteInfo>? children})
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

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}
