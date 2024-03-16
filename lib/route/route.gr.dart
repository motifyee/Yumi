// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:flutter/material.dart' as _i26;
import 'package:yumi/features/chef_application/application_flow_screen.dart'
    as _i5;
import 'package:yumi/features/chef_application/contract/contract_screen.dart'
    as _i7;
import 'package:yumi/features/chef_application/documentation/documentation_screen.dart'
    as _i9;
import 'package:yumi/model/chef_model.dart' as _i27;
import 'package:yumi/model/meal_model.dart' as _i28;
import 'package:yumi/screens/basket.dart' as _i1;
import 'package:yumi/screens/calories.dart' as _i2;
import 'package:yumi/screens/chat.dart' as _i3;
import 'package:yumi/screens/checkout.dart' as _i4;
import 'package:yumi/screens/chef_profile.dart' as _i6;
import 'package:yumi/screens/customer_wallet.dart' as _i8;
import 'package:yumi/screens/financial_view.dart' as _i10;
import 'package:yumi/screens/forget_password.dart' as _i11;
import 'package:yumi/screens/home.dart' as _i12;
import 'package:yumi/screens/login.dart' as _i13;
import 'package:yumi/screens/meal_profile.dart' as _i14;
import 'package:yumi/screens/menu_pre.dart' as _i15;
import 'package:yumi/screens/my_schedule.dart' as _i16;
import 'package:yumi/screens/notification.dart' as _i17;
import 'package:yumi/screens/order_status.dart' as _i18;
import 'package:yumi/screens/payment_paypal.dart' as _i19;
import 'package:yumi/screens/payment_visa.dart' as _i20;
import 'package:yumi/screens/performance_analysis.dart' as _i21;
import 'package:yumi/screens/signup.dart' as _i22;
import 'package:yumi/screens/tracking_order.dart' as _i23;
import 'package:yumi/screens/transactions.dart' as _i24;

abstract class $AppRouter extends _i25.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    BasketRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BasketScreen(),
      );
    },
    CaloriesReferenceRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CaloriesReferenceScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ChatScreen(),
      );
    },
    CheckOutRoute.name: (routeData) {
      final args = routeData.argsAs<CheckOutRouteArgs>(
          orElse: () => const CheckOutRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CheckOutScreen(key: args.key),
      );
    },
    ChefApplicationFlowRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ChefApplicationFlowScreen(),
      );
    },
    ChefProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ChefProfileRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ChefProfileScreen(
          key: args.key,
          chef: args.chef,
          menuTarget: args.menuTarget,
        ),
      );
    },
    ContractRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ContractScreen(),
      );
    },
    CustomerWalletRoute.name: (routeData) {
      final args = routeData.argsAs<CustomerWalletRouteArgs>(
          orElse: () => const CustomerWalletRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.CustomerWalletScreen(key: args.key),
      );
    },
    DocumentationRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.DocumentationScreen(),
      );
    },
    FinancialViewRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.FinancialViewScreen(),
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ForgetPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.HomeScreen(key: args.key),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.LoginScreen(key: args.key),
      );
    },
    MealProfileRoute.name: (routeData) {
      final args = routeData.argsAs<MealProfileRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.MealProfileScreen(
          key: args.key,
          meal: args.meal,
        ),
      );
    },
    MenuPreOrderRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.MenuPreOrderScreen(),
      );
    },
    MyScheduleRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.MyScheduleScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.NotificationScreen(),
      );
    },
    OrderStatusRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.OrderStatusScreen(),
      );
    },
    PaymentPaypalRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.PaymentPaypalScreen(),
      );
    },
    PaymentVisaRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentVisaRouteArgs>(
          orElse: () => const PaymentVisaRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.PaymentVisaScreen(key: args.key),
      );
    },
    PerformanceAnalysisRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.PerformanceAnalysisScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpRouteArgs>(
          orElse: () => const SignUpRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.SignUpScreen(key: args.key),
      );
    },
    TrackingOrderRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.TrackingOrderScreen(),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.TransactionsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.BasketScreen]
class BasketRoute extends _i25.PageRouteInfo<void> {
  const BasketRoute({List<_i25.PageRouteInfo>? children})
      : super(
          BasketRoute.name,
          initialChildren: children,
        );

  static const String name = 'BasketRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CaloriesReferenceScreen]
class CaloriesReferenceRoute extends _i25.PageRouteInfo<void> {
  const CaloriesReferenceRoute({List<_i25.PageRouteInfo>? children})
      : super(
          CaloriesReferenceRoute.name,
          initialChildren: children,
        );

  static const String name = 'CaloriesReferenceRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ChatScreen]
class ChatRoute extends _i25.PageRouteInfo<void> {
  const ChatRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CheckOutScreen]
class CheckOutRoute extends _i25.PageRouteInfo<CheckOutRouteArgs> {
  CheckOutRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          CheckOutRoute.name,
          args: CheckOutRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CheckOutRoute';

  static const _i25.PageInfo<CheckOutRouteArgs> page =
      _i25.PageInfo<CheckOutRouteArgs>(name);
}

class CheckOutRouteArgs {
  const CheckOutRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'CheckOutRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.ChefApplicationFlowScreen]
class ChefApplicationFlowRoute extends _i25.PageRouteInfo<void> {
  const ChefApplicationFlowRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ChefApplicationFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChefApplicationFlowRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ChefProfileScreen]
class ChefProfileRoute extends _i25.PageRouteInfo<ChefProfileRouteArgs> {
  ChefProfileRoute({
    _i26.Key? key,
    required _i27.ChefModel chef,
    required _i28.MenuTarget menuTarget,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          ChefProfileRoute.name,
          args: ChefProfileRouteArgs(
            key: key,
            chef: chef,
            menuTarget: menuTarget,
          ),
          initialChildren: children,
        );

  static const String name = 'ChefProfileRoute';

  static const _i25.PageInfo<ChefProfileRouteArgs> page =
      _i25.PageInfo<ChefProfileRouteArgs>(name);
}

class ChefProfileRouteArgs {
  const ChefProfileRouteArgs({
    this.key,
    required this.chef,
    required this.menuTarget,
  });

  final _i26.Key? key;

  final _i27.ChefModel chef;

  final _i28.MenuTarget menuTarget;

  @override
  String toString() {
    return 'ChefProfileRouteArgs{key: $key, chef: $chef, menuTarget: $menuTarget}';
  }
}

/// generated route for
/// [_i7.ContractScreen]
class ContractRoute extends _i25.PageRouteInfo<void> {
  const ContractRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ContractRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContractRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CustomerWalletScreen]
class CustomerWalletRoute extends _i25.PageRouteInfo<CustomerWalletRouteArgs> {
  CustomerWalletRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          CustomerWalletRoute.name,
          args: CustomerWalletRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CustomerWalletRoute';

  static const _i25.PageInfo<CustomerWalletRouteArgs> page =
      _i25.PageInfo<CustomerWalletRouteArgs>(name);
}

class CustomerWalletRouteArgs {
  const CustomerWalletRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'CustomerWalletRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.DocumentationScreen]
class DocumentationRoute extends _i25.PageRouteInfo<void> {
  const DocumentationRoute({List<_i25.PageRouteInfo>? children})
      : super(
          DocumentationRoute.name,
          initialChildren: children,
        );

  static const String name = 'DocumentationRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i10.FinancialViewScreen]
class FinancialViewRoute extends _i25.PageRouteInfo<void> {
  const FinancialViewRoute({List<_i25.PageRouteInfo>? children})
      : super(
          FinancialViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinancialViewRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i25.PageRouteInfo<void> {
  const ForgetPasswordRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ForgetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i12.HomeScreen]
class HomeRoute extends _i25.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i25.PageInfo<HomeRouteArgs> page =
      _i25.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.LoginScreen]
class LoginRoute extends _i25.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i25.PageInfo<LoginRouteArgs> page =
      _i25.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.MealProfileScreen]
class MealProfileRoute extends _i25.PageRouteInfo<MealProfileRouteArgs> {
  MealProfileRoute({
    _i26.Key? key,
    required _i28.MealModel meal,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          MealProfileRoute.name,
          args: MealProfileRouteArgs(
            key: key,
            meal: meal,
          ),
          initialChildren: children,
        );

  static const String name = 'MealProfileRoute';

  static const _i25.PageInfo<MealProfileRouteArgs> page =
      _i25.PageInfo<MealProfileRouteArgs>(name);
}

class MealProfileRouteArgs {
  const MealProfileRouteArgs({
    this.key,
    required this.meal,
  });

  final _i26.Key? key;

  final _i28.MealModel meal;

  @override
  String toString() {
    return 'MealProfileRouteArgs{key: $key, meal: $meal}';
  }
}

/// generated route for
/// [_i15.MenuPreOrderScreen]
class MenuPreOrderRoute extends _i25.PageRouteInfo<void> {
  const MenuPreOrderRoute({List<_i25.PageRouteInfo>? children})
      : super(
          MenuPreOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuPreOrderRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i16.MyScheduleScreen]
class MyScheduleRoute extends _i25.PageRouteInfo<void> {
  const MyScheduleRoute({List<_i25.PageRouteInfo>? children})
      : super(
          MyScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyScheduleRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i17.NotificationScreen]
class NotificationRoute extends _i25.PageRouteInfo<void> {
  const NotificationRoute({List<_i25.PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i18.OrderStatusScreen]
class OrderStatusRoute extends _i25.PageRouteInfo<void> {
  const OrderStatusRoute({List<_i25.PageRouteInfo>? children})
      : super(
          OrderStatusRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderStatusRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i19.PaymentPaypalScreen]
class PaymentPaypalRoute extends _i25.PageRouteInfo<void> {
  const PaymentPaypalRoute({List<_i25.PageRouteInfo>? children})
      : super(
          PaymentPaypalRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentPaypalRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i20.PaymentVisaScreen]
class PaymentVisaRoute extends _i25.PageRouteInfo<PaymentVisaRouteArgs> {
  PaymentVisaRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          PaymentVisaRoute.name,
          args: PaymentVisaRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'PaymentVisaRoute';

  static const _i25.PageInfo<PaymentVisaRouteArgs> page =
      _i25.PageInfo<PaymentVisaRouteArgs>(name);
}

class PaymentVisaRouteArgs {
  const PaymentVisaRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'PaymentVisaRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i21.PerformanceAnalysisScreen]
class PerformanceAnalysisRoute extends _i25.PageRouteInfo<void> {
  const PerformanceAnalysisRoute({List<_i25.PageRouteInfo>? children})
      : super(
          PerformanceAnalysisRoute.name,
          initialChildren: children,
        );

  static const String name = 'PerformanceAnalysisRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i22.SignUpScreen]
class SignUpRoute extends _i25.PageRouteInfo<SignUpRouteArgs> {
  SignUpRoute({
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          SignUpRoute.name,
          args: SignUpRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i25.PageInfo<SignUpRouteArgs> page =
      _i25.PageInfo<SignUpRouteArgs>(name);
}

class SignUpRouteArgs {
  const SignUpRouteArgs({this.key});

  final _i26.Key? key;

  @override
  String toString() {
    return 'SignUpRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i23.TrackingOrderScreen]
class TrackingOrderRoute extends _i25.PageRouteInfo<void> {
  const TrackingOrderRoute({List<_i25.PageRouteInfo>? children})
      : super(
          TrackingOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrackingOrderRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i24.TransactionsScreen]
class TransactionsRoute extends _i25.PageRouteInfo<void> {
  const TransactionsRoute({List<_i25.PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}
