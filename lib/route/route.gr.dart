// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i34;
import 'package:flutter/material.dart' as _i35;
import 'package:yumi/app/components/loading_indicator/loading_page.dart'
    as _i15;
import 'package:yumi/app/pages/auth/registeration/add_phone_screen.dart' as _i1;
import 'package:yumi/app/pages/auth/registeration/location_screen.dart' as _i16;
import 'package:yumi/app/pages/auth/registeration/model/address.dart' as _i36;
import 'package:yumi/app/pages/auth/registeration/reg_screen.dart' as _i28;
import 'package:yumi/app/pages/auth/registeration/signup/signup_screen.dart'
    as _i30;
import 'package:yumi/app/pages/auth/registeration/verify_add_phone_otp_screen.dart'
    as _i23;
import 'package:yumi/app/pages/basket/basket_screen.dart' as _i2;
import 'package:yumi/app/pages/basket/checkout.dart' as _i5;
import 'package:yumi/app/pages/basket/widgets/payment_paypal.dart' as _i25;
import 'package:yumi/app/pages/basket/widgets/payment_visa.dart' as _i26;
import 'package:yumi/app/pages/calories/calories_screen.dart' as _i3;
import 'package:yumi/app/pages/chef_application/application_flow_screen.dart'
    as _i6;
import 'package:yumi/app/pages/chef_application/contract/contract_screen.dart'
    as _i9;
import 'package:yumi/app/pages/chef_application/documentation/documentation_screen.dart'
    as _i11;
import 'package:yumi/app/pages/chef_customer_address/chef_customer_address.dart'
    as _i7;
import 'package:yumi/app/pages/notification/notification_screen.dart' as _i22;
import 'package:yumi/app/pages/order/customer/customer_order.dart' as _i20;
import 'package:yumi/app/pages/order/widgets/order_status.dart' as _i24;
import 'package:yumi/app/pages/schedule/schedule_screen.dart' as _i21;
import 'package:yumi/app/pages/settings/settings_screen.dart' as _i29;
import 'package:yumi/app/pages/transactions/transactions.dart' as _i32;
import 'package:yumi/app/pages/wallet/wallet_screen.dart' as _i33;
import 'package:yumi/domain/chef/entity/chef.dart' as _i37;
import 'package:yumi/domain/order/entity/order.dart' as _i39;
import 'package:yumi/model/meal_model.dart' as _i38;
import 'package:yumi/screens/chat.dart' as _i4;
import 'package:yumi/screens/chef/menu_pre.dart' as _i19;
import 'package:yumi/screens/customer/chef_profile.dart' as _i8;
import 'package:yumi/screens/customer/customer_location.dart' as _i10;
import 'package:yumi/screens/customer/meal_profile.dart' as _i18;
import 'package:yumi/screens/customer/tracking_order.dart' as _i31;
import 'package:yumi/screens/financial_view.dart' as _i12;
import 'package:yumi/screens/forget_password.dart' as _i13;
import 'package:yumi/screens/home.dart' as _i14;
import 'package:yumi/screens/login.dart' as _i17;
import 'package:yumi/screens/performance_analysis.dart' as _i27;

abstract class $AppRouter extends _i34.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i34.PageFactory> pagesMap = {
    AddPhoneRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddPhoneScreen(),
      );
    },
    BasketRoute.name: (routeData) {
      final args = routeData.argsAs<BasketRouteArgs>(
          orElse: () => const BasketRouteArgs());
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BasketScreen(key: args.key),
      );
    },
    CaloriesReferenceRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CaloriesReferenceScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ChatScreen(),
      );
    },
    CheckOutRoute.name: (routeData) {
      final args = routeData.argsAs<CheckOutRouteArgs>(
          orElse: () => const CheckOutRouteArgs());
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CheckOutScreen(key: args.key),
      );
    },
    ChefApplicationFlowRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ChefApplicationFlowScreen(),
      );
    },
    ChefCustomerAddressRoute.name: (routeData) {
      final args = routeData.argsAs<ChefCustomerAddressRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ChefCustomerAddressScreen(
          key: args.key,
          isChef: args.isChef,
          id: args.id,
          address: args.address,
        ),
      );
    },
    ChefProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ChefProfileRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.ChefProfileScreen(
          key: args.key,
          chef: args.chef,
          menuTarget: args.menuTarget,
        ),
      );
    },
    ContractRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ContractScreen(),
      );
    },
    CustomerLocationRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CustomerLocationScreen(),
      );
    },
    DocumentationRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.DocumentationScreen(),
      );
    },
    FinancialViewRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.FinancialViewScreen(),
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ForgetPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.HomeScreen(key: args.key),
      );
    },
    LoadingRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.LoadingPage(),
      );
    },
    LocationRoute.name: (routeData) {
      final args = routeData.argsAs<LocationRouteArgs>(
          orElse: () => const LocationRouteArgs());
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.LocationScreen(
          key: args.key,
          routeFn: args.routeFn,
          isBack: args.isBack,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.LoginScreen(key: args.key),
      );
    },
    MealProfileRoute.name: (routeData) {
      final args = routeData.argsAs<MealProfileRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.MealProfileScreen(
          key: args.key,
          meal: args.meal,
          chef: args.chef,
        ),
      );
    },
    MenuPreOrderRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.MenuPreOrderScreen(),
      );
    },
    MyOrdersRoute.name: (routeData) {
      final args = routeData.argsAs<MyOrdersRouteArgs>(
          orElse: () => const MyOrdersRouteArgs());
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.MyOrdersScreen(
          key: args.key,
          isHistory: args.isHistory,
        ),
      );
    },
    MyScheduleRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.MyScheduleScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.NotificationScreen(
          key: args.key,
          isScreen: args.isScreen,
        ),
      );
    },
    OTPRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.OTPScreen(),
      );
    },
    OrderStatusRoute.name: (routeData) {
      final args = routeData.argsAs<OrderStatusRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.OrderStatusScreen(
          key: args.key,
          order: args.order,
        ),
      );
    },
    PaymentPaypalRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.PaymentPaypalScreen(),
      );
    },
    PaymentVisaRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.PaymentVisaScreen(),
      );
    },
    PerformanceAnalysisRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.PerformanceAnalysisScreen(),
      );
    },
    RegisterationRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.RegisterationScreen(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.SettingScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.SignUpScreen(),
      );
    },
    TrackingOrderRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.TrackingOrderScreen(),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i32.TransactionsScreen(),
      );
    },
    WalletRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i33.WalletScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddPhoneScreen]
class AddPhoneRoute extends _i34.PageRouteInfo<void> {
  const AddPhoneRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AddPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPhoneRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BasketScreen]
class BasketRoute extends _i34.PageRouteInfo<BasketRouteArgs> {
  BasketRoute({
    _i35.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          BasketRoute.name,
          args: BasketRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BasketRoute';

  static const _i34.PageInfo<BasketRouteArgs> page =
      _i34.PageInfo<BasketRouteArgs>(name);
}

class BasketRouteArgs {
  const BasketRouteArgs({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return 'BasketRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.CaloriesReferenceScreen]
class CaloriesReferenceRoute extends _i34.PageRouteInfo<void> {
  const CaloriesReferenceRoute({List<_i34.PageRouteInfo>? children})
      : super(
          CaloriesReferenceRoute.name,
          initialChildren: children,
        );

  static const String name = 'CaloriesReferenceRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChatScreen]
class ChatRoute extends _i34.PageRouteInfo<void> {
  const ChatRoute({List<_i34.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CheckOutScreen]
class CheckOutRoute extends _i34.PageRouteInfo<CheckOutRouteArgs> {
  CheckOutRoute({
    _i35.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          CheckOutRoute.name,
          args: CheckOutRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CheckOutRoute';

  static const _i34.PageInfo<CheckOutRouteArgs> page =
      _i34.PageInfo<CheckOutRouteArgs>(name);
}

class CheckOutRouteArgs {
  const CheckOutRouteArgs({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return 'CheckOutRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.ChefApplicationFlowScreen]
class ChefApplicationFlowRoute extends _i34.PageRouteInfo<void> {
  const ChefApplicationFlowRoute({List<_i34.PageRouteInfo>? children})
      : super(
          ChefApplicationFlowRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChefApplicationFlowRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ChefCustomerAddressScreen]
class ChefCustomerAddressRoute
    extends _i34.PageRouteInfo<ChefCustomerAddressRouteArgs> {
  ChefCustomerAddressRoute({
    _i35.Key? key,
    bool isChef = true,
    required String id,
    _i36.Address? address,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          ChefCustomerAddressRoute.name,
          args: ChefCustomerAddressRouteArgs(
            key: key,
            isChef: isChef,
            id: id,
            address: address,
          ),
          initialChildren: children,
        );

  static const String name = 'ChefCustomerAddressRoute';

  static const _i34.PageInfo<ChefCustomerAddressRouteArgs> page =
      _i34.PageInfo<ChefCustomerAddressRouteArgs>(name);
}

class ChefCustomerAddressRouteArgs {
  const ChefCustomerAddressRouteArgs({
    this.key,
    this.isChef = true,
    required this.id,
    this.address,
  });

  final _i35.Key? key;

  final bool isChef;

  final String id;

  final _i36.Address? address;

  @override
  String toString() {
    return 'ChefCustomerAddressRouteArgs{key: $key, isChef: $isChef, id: $id, address: $address}';
  }
}

/// generated route for
/// [_i8.ChefProfileScreen]
class ChefProfileRoute extends _i34.PageRouteInfo<ChefProfileRouteArgs> {
  ChefProfileRoute({
    _i35.Key? key,
    required _i37.Chef chef,
    required _i38.MenuTarget menuTarget,
    List<_i34.PageRouteInfo>? children,
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

  static const _i34.PageInfo<ChefProfileRouteArgs> page =
      _i34.PageInfo<ChefProfileRouteArgs>(name);
}

class ChefProfileRouteArgs {
  const ChefProfileRouteArgs({
    this.key,
    required this.chef,
    required this.menuTarget,
  });

  final _i35.Key? key;

  final _i37.Chef chef;

  final _i38.MenuTarget menuTarget;

  @override
  String toString() {
    return 'ChefProfileRouteArgs{key: $key, chef: $chef, menuTarget: $menuTarget}';
  }
}

/// generated route for
/// [_i9.ContractScreen]
class ContractRoute extends _i34.PageRouteInfo<void> {
  const ContractRoute({List<_i34.PageRouteInfo>? children})
      : super(
          ContractRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContractRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i10.CustomerLocationScreen]
class CustomerLocationRoute extends _i34.PageRouteInfo<void> {
  const CustomerLocationRoute({List<_i34.PageRouteInfo>? children})
      : super(
          CustomerLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerLocationRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i11.DocumentationScreen]
class DocumentationRoute extends _i34.PageRouteInfo<void> {
  const DocumentationRoute({List<_i34.PageRouteInfo>? children})
      : super(
          DocumentationRoute.name,
          initialChildren: children,
        );

  static const String name = 'DocumentationRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i12.FinancialViewScreen]
class FinancialViewRoute extends _i34.PageRouteInfo<void> {
  const FinancialViewRoute({List<_i34.PageRouteInfo>? children})
      : super(
          FinancialViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinancialViewRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ForgetPasswordScreen]
class ForgetPasswordRoute extends _i34.PageRouteInfo<void> {
  const ForgetPasswordRoute({List<_i34.PageRouteInfo>? children})
      : super(
          ForgetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPasswordRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i14.HomeScreen]
class HomeRoute extends _i34.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i35.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i34.PageInfo<HomeRouteArgs> page =
      _i34.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.LoadingPage]
class LoadingRoute extends _i34.PageRouteInfo<void> {
  const LoadingRoute({List<_i34.PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i16.LocationScreen]
class LocationRoute extends _i34.PageRouteInfo<LocationRouteArgs> {
  LocationRoute({
    _i35.Key? key,
    dynamic Function({_i36.Address address})? routeFn,
    bool isBack = false,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          LocationRoute.name,
          args: LocationRouteArgs(
            key: key,
            routeFn: routeFn,
            isBack: isBack,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i34.PageInfo<LocationRouteArgs> page =
      _i34.PageInfo<LocationRouteArgs>(name);
}

class LocationRouteArgs {
  const LocationRouteArgs({
    this.key,
    this.routeFn,
    this.isBack = false,
  });

  final _i35.Key? key;

  final dynamic Function({_i36.Address address})? routeFn;

  final bool isBack;

  @override
  String toString() {
    return 'LocationRouteArgs{key: $key, routeFn: $routeFn, isBack: $isBack}';
  }
}

/// generated route for
/// [_i17.LoginScreen]
class LoginRoute extends _i34.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i35.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i34.PageInfo<LoginRouteArgs> page =
      _i34.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i18.MealProfileScreen]
class MealProfileRoute extends _i34.PageRouteInfo<MealProfileRouteArgs> {
  MealProfileRoute({
    _i35.Key? key,
    required _i38.MealModel meal,
    required _i37.Chef chef,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          MealProfileRoute.name,
          args: MealProfileRouteArgs(
            key: key,
            meal: meal,
            chef: chef,
          ),
          initialChildren: children,
        );

  static const String name = 'MealProfileRoute';

  static const _i34.PageInfo<MealProfileRouteArgs> page =
      _i34.PageInfo<MealProfileRouteArgs>(name);
}

class MealProfileRouteArgs {
  const MealProfileRouteArgs({
    this.key,
    required this.meal,
    required this.chef,
  });

  final _i35.Key? key;

  final _i38.MealModel meal;

  final _i37.Chef chef;

  @override
  String toString() {
    return 'MealProfileRouteArgs{key: $key, meal: $meal, chef: $chef}';
  }
}

/// generated route for
/// [_i19.MenuPreOrderScreen]
class MenuPreOrderRoute extends _i34.PageRouteInfo<void> {
  const MenuPreOrderRoute({List<_i34.PageRouteInfo>? children})
      : super(
          MenuPreOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuPreOrderRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i20.MyOrdersScreen]
class MyOrdersRoute extends _i34.PageRouteInfo<MyOrdersRouteArgs> {
  MyOrdersRoute({
    _i35.Key? key,
    bool isHistory = false,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          MyOrdersRoute.name,
          args: MyOrdersRouteArgs(
            key: key,
            isHistory: isHistory,
          ),
          initialChildren: children,
        );

  static const String name = 'MyOrdersRoute';

  static const _i34.PageInfo<MyOrdersRouteArgs> page =
      _i34.PageInfo<MyOrdersRouteArgs>(name);
}

class MyOrdersRouteArgs {
  const MyOrdersRouteArgs({
    this.key,
    this.isHistory = false,
  });

  final _i35.Key? key;

  final bool isHistory;

  @override
  String toString() {
    return 'MyOrdersRouteArgs{key: $key, isHistory: $isHistory}';
  }
}

/// generated route for
/// [_i21.MyScheduleScreen]
class MyScheduleRoute extends _i34.PageRouteInfo<void> {
  const MyScheduleRoute({List<_i34.PageRouteInfo>? children})
      : super(
          MyScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyScheduleRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i22.NotificationScreen]
class NotificationRoute extends _i34.PageRouteInfo<NotificationRouteArgs> {
  NotificationRoute({
    _i35.Key? key,
    required bool isScreen,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          NotificationRoute.name,
          args: NotificationRouteArgs(
            key: key,
            isScreen: isScreen,
          ),
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i34.PageInfo<NotificationRouteArgs> page =
      _i34.PageInfo<NotificationRouteArgs>(name);
}

class NotificationRouteArgs {
  const NotificationRouteArgs({
    this.key,
    required this.isScreen,
  });

  final _i35.Key? key;

  final bool isScreen;

  @override
  String toString() {
    return 'NotificationRouteArgs{key: $key, isScreen: $isScreen}';
  }
}

/// generated route for
/// [_i23.OTPScreen]
class OTPRoute extends _i34.PageRouteInfo<void> {
  const OTPRoute({List<_i34.PageRouteInfo>? children})
      : super(
          OTPRoute.name,
          initialChildren: children,
        );

  static const String name = 'OTPRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i24.OrderStatusScreen]
class OrderStatusRoute extends _i34.PageRouteInfo<OrderStatusRouteArgs> {
  OrderStatusRoute({
    _i35.Key? key,
    required _i39.Order order,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          OrderStatusRoute.name,
          args: OrderStatusRouteArgs(
            key: key,
            order: order,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderStatusRoute';

  static const _i34.PageInfo<OrderStatusRouteArgs> page =
      _i34.PageInfo<OrderStatusRouteArgs>(name);
}

class OrderStatusRouteArgs {
  const OrderStatusRouteArgs({
    this.key,
    required this.order,
  });

  final _i35.Key? key;

  final _i39.Order order;

  @override
  String toString() {
    return 'OrderStatusRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i25.PaymentPaypalScreen]
class PaymentPaypalRoute extends _i34.PageRouteInfo<void> {
  const PaymentPaypalRoute({List<_i34.PageRouteInfo>? children})
      : super(
          PaymentPaypalRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentPaypalRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i26.PaymentVisaScreen]
class PaymentVisaRoute extends _i34.PageRouteInfo<void> {
  const PaymentVisaRoute({List<_i34.PageRouteInfo>? children})
      : super(
          PaymentVisaRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentVisaRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i27.PerformanceAnalysisScreen]
class PerformanceAnalysisRoute extends _i34.PageRouteInfo<void> {
  const PerformanceAnalysisRoute({List<_i34.PageRouteInfo>? children})
      : super(
          PerformanceAnalysisRoute.name,
          initialChildren: children,
        );

  static const String name = 'PerformanceAnalysisRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i28.RegisterationScreen]
class RegisterationRoute extends _i34.PageRouteInfo<void> {
  const RegisterationRoute({List<_i34.PageRouteInfo>? children})
      : super(
          RegisterationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterationRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i29.SettingScreen]
class SettingRoute extends _i34.PageRouteInfo<void> {
  const SettingRoute({List<_i34.PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i30.SignUpScreen]
class SignUpRoute extends _i34.PageRouteInfo<void> {
  const SignUpRoute({List<_i34.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i31.TrackingOrderScreen]
class TrackingOrderRoute extends _i34.PageRouteInfo<void> {
  const TrackingOrderRoute({List<_i34.PageRouteInfo>? children})
      : super(
          TrackingOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrackingOrderRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i32.TransactionsScreen]
class TransactionsRoute extends _i34.PageRouteInfo<void> {
  const TransactionsRoute({List<_i34.PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i33.WalletScreen]
class WalletRoute extends _i34.PageRouteInfo<void> {
  const WalletRoute({List<_i34.PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}
