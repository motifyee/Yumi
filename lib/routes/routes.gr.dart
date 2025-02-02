// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i33;
import 'package:common_code/common_code.dart' as _i35;
import 'package:flutter/material.dart' as _i34;
import 'package:yumi/app/inherited_pages/loading.dart' as _i13;
import 'package:yumi/app/pages/auth/login/login_screen.dart' as _i15;
import 'package:yumi/app/pages/auth/registeration/pages/add_phone_screen/add_phone_screen.dart'
    as _i1;
import 'package:yumi/app/pages/auth/registeration/pages/add_phone_screen/verify_add_phone_otp_screen.dart'
    as _i21;
import 'package:yumi/app/pages/auth/registeration/pages/contract_screen/contract_screen.dart'
    as _i8;
import 'package:yumi/app/pages/auth/registeration/pages/documentation_screen/documentation_screen.dart'
    as _i10;
import 'package:yumi/app/pages/auth/registeration/pages/location_screen/location_screen.dart'
    as _i14;
import 'package:yumi/app/pages/auth/registeration/pages/onboarding_screen/onboarding_screen.dart'
    as _i22;
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/schedule_screen.dart'
    as _i19;
import 'package:yumi/app/pages/auth/registeration/pages/signup_screen/signup_screen.dart'
    as _i29;
import 'package:yumi/app/pages/auth/registeration/registeration_screen/registeration_screen.dart'
    as _i27;
import 'package:yumi/app/pages/basket/basket_screen.dart' as _i2;
import 'package:yumi/app/pages/basket/checkout.dart' as _i5;
import 'package:yumi/app/pages/basket/widgets/payment_stripe.dart' as _i24;
import 'package:yumi/app/pages/basket/widgets/payment_visa.dart' as _i25;
import 'package:yumi/app/pages/basket/widgets/tracking_order.dart' as _i30;
import 'package:yumi/app/pages/calories/calories_screen.dart' as _i3;
import 'package:yumi/app/pages/chat/chat.dart' as _i4;
import 'package:yumi/app/pages/chef_customer_address/chef_customer_address.dart'
    as _i6;
import 'package:yumi/app/pages/chef_profile/chef_profile.dart' as _i7;
import 'package:yumi/app/pages/customer_location/customer_location.dart' as _i9;
import 'package:yumi/app/pages/financial_view/financial_view.dart' as _i11;
import 'package:yumi/app/pages/home/home.dart' as _i12;
import 'package:yumi/app/pages/meal_profile/meal_profile.dart' as _i16;
import 'package:yumi/app/pages/menu/chef/menu_pre.dart' as _i17;
import 'package:yumi/app/pages/notification/notification_screen.dart' as _i20;
import 'package:yumi/app/pages/order/customer/customer_order.dart' as _i18;
import 'package:yumi/app/pages/order/widgets/order_status.dart' as _i23;
import 'package:yumi/app/pages/performance_analysis/performance_analysis.dart'
    as _i26;
import 'package:yumi/app/pages/settings/settings_screen.dart' as _i28;
import 'package:yumi/app/pages/transactions/transactions.dart' as _i31;
import 'package:yumi/app/pages/wallet/wallet_screen.dart' as _i32;

abstract class $YumiRouter extends _i33.RootStackRouter {
  $YumiRouter({super.navigatorKey});

  @override
  final Map<String, _i33.PageFactory> pagesMap = {
    AddPhoneRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddPhoneScreen(),
      );
    },
    BasketRoute.name: (routeData) {
      final args = routeData.argsAs<BasketRouteArgs>(
          orElse: () => const BasketRouteArgs());
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BasketScreen(key: args.key),
      );
    },
    CaloriesReferenceRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CaloriesReferenceScreen(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ChatScreen(),
      );
    },
    CheckOutRoute.name: (routeData) {
      final args = routeData.argsAs<CheckOutRouteArgs>(
          orElse: () => const CheckOutRouteArgs());
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CheckOutScreen(key: args.key),
      );
    },
    ChefCustomerAddressRoute.name: (routeData) {
      final args = routeData.argsAs<ChefCustomerAddressRouteArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ChefCustomerAddressScreen(
          key: args.key,
          isChef: args.isChef,
          id: args.id,
          address: args.address,
        ),
      );
    },
    ChefProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ChefProfileRouteArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.ChefProfileScreen(
          key: args.key,
          chef: args.chef,
          menuTarget: args.menuTarget,
        ),
      );
    },
    ContractRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ContractScreen(),
      );
    },
    CustomerLocationRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.CustomerLocationScreen(),
      );
    },
    DocumentationRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.DocumentationScreen(),
      );
    },
    FinancialViewRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.FinancialViewScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.HomeScreen(key: args.key),
      );
    },
    LoadingRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.LoadingScreen(),
      );
    },
    LocationRoute.name: (routeData) {
      final args = routeData.argsAs<LocationRouteArgs>(
          orElse: () => const LocationRouteArgs());
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.LocationScreen(
          key: args.key,
          routeFn: args.routeFn,
          isBack: args.isBack,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.LoginScreen(),
      );
    },
    MealProfileRoute.name: (routeData) {
      final args = routeData.argsAs<MealProfileRouteArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.MealProfileScreen(
          key: args.key,
          meal: args.meal,
          chef: args.chef,
        ),
      );
    },
    MenuPreOrderRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.MenuPreOrderScreen(),
      );
    },
    MyOrdersRoute.name: (routeData) {
      final args = routeData.argsAs<MyOrdersRouteArgs>(
          orElse: () => const MyOrdersRouteArgs());
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.MyOrdersScreen(
          key: args.key,
          isHistory: args.isHistory,
        ),
      );
    },
    MyScheduleRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.MyScheduleScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      final args = routeData.argsAs<NotificationRouteArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.NotificationScreen(
          key: args.key,
          isScreen: args.isScreen,
        ),
      );
    },
    OTPRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.OTPScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.OnboardingScreen(),
      );
    },
    OrderStatusRoute.name: (routeData) {
      final args = routeData.argsAs<OrderStatusRouteArgs>();
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.OrderStatusScreen(
          key: args.key,
          order: args.order,
        ),
      );
    },
    PaymentStripeRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.PaymentStripeScreen(),
      );
    },
    PaymentVisaRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.PaymentVisaScreen(),
      );
    },
    PerformanceAnalysisRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.PerformanceAnalysisScreen(),
      );
    },
    RegisterationRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.RegisterationScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.SettingsScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.SignUpScreen(),
      );
    },
    TrackingOrderRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.TrackingOrderScreen(),
      );
    },
    TransactionsRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.TransactionsScreen(),
      );
    },
    WalletRoute.name: (routeData) {
      return _i33.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i32.WalletScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddPhoneScreen]
class AddPhoneRoute extends _i33.PageRouteInfo<void> {
  const AddPhoneRoute({List<_i33.PageRouteInfo>? children})
      : super(
          AddPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddPhoneRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BasketScreen]
class BasketRoute extends _i33.PageRouteInfo<BasketRouteArgs> {
  BasketRoute({
    _i34.Key? key,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          BasketRoute.name,
          args: BasketRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'BasketRoute';

  static const _i33.PageInfo<BasketRouteArgs> page =
      _i33.PageInfo<BasketRouteArgs>(name);
}

class BasketRouteArgs {
  const BasketRouteArgs({this.key});

  final _i34.Key? key;

  @override
  String toString() {
    return 'BasketRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.CaloriesReferenceScreen]
class CaloriesReferenceRoute extends _i33.PageRouteInfo<void> {
  const CaloriesReferenceRoute({List<_i33.PageRouteInfo>? children})
      : super(
          CaloriesReferenceRoute.name,
          initialChildren: children,
        );

  static const String name = 'CaloriesReferenceRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChatScreen]
class ChatRoute extends _i33.PageRouteInfo<void> {
  const ChatRoute({List<_i33.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i5.CheckOutScreen]
class CheckOutRoute extends _i33.PageRouteInfo<CheckOutRouteArgs> {
  CheckOutRoute({
    _i34.Key? key,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          CheckOutRoute.name,
          args: CheckOutRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CheckOutRoute';

  static const _i33.PageInfo<CheckOutRouteArgs> page =
      _i33.PageInfo<CheckOutRouteArgs>(name);
}

class CheckOutRouteArgs {
  const CheckOutRouteArgs({this.key});

  final _i34.Key? key;

  @override
  String toString() {
    return 'CheckOutRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.ChefCustomerAddressScreen]
class ChefCustomerAddressRoute
    extends _i33.PageRouteInfo<ChefCustomerAddressRouteArgs> {
  ChefCustomerAddressRoute({
    _i34.Key? key,
    bool isChef = true,
    required String id,
    _i35.Address? address,
    List<_i33.PageRouteInfo>? children,
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

  static const _i33.PageInfo<ChefCustomerAddressRouteArgs> page =
      _i33.PageInfo<ChefCustomerAddressRouteArgs>(name);
}

class ChefCustomerAddressRouteArgs {
  const ChefCustomerAddressRouteArgs({
    this.key,
    this.isChef = true,
    required this.id,
    this.address,
  });

  final _i34.Key? key;

  final bool isChef;

  final String id;

  final _i35.Address? address;

  @override
  String toString() {
    return 'ChefCustomerAddressRouteArgs{key: $key, isChef: $isChef, id: $id, address: $address}';
  }
}

/// generated route for
/// [_i7.ChefProfileScreen]
class ChefProfileRoute extends _i33.PageRouteInfo<ChefProfileRouteArgs> {
  ChefProfileRoute({
    _i34.Key? key,
    required _i35.Chef chef,
    required _i35.OrderType menuTarget,
    List<_i33.PageRouteInfo>? children,
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

  static const _i33.PageInfo<ChefProfileRouteArgs> page =
      _i33.PageInfo<ChefProfileRouteArgs>(name);
}

class ChefProfileRouteArgs {
  const ChefProfileRouteArgs({
    this.key,
    required this.chef,
    required this.menuTarget,
  });

  final _i34.Key? key;

  final _i35.Chef chef;

  final _i35.OrderType menuTarget;

  @override
  String toString() {
    return 'ChefProfileRouteArgs{key: $key, chef: $chef, menuTarget: $menuTarget}';
  }
}

/// generated route for
/// [_i8.ContractScreen]
class ContractRoute extends _i33.PageRouteInfo<void> {
  const ContractRoute({List<_i33.PageRouteInfo>? children})
      : super(
          ContractRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContractRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i9.CustomerLocationScreen]
class CustomerLocationRoute extends _i33.PageRouteInfo<void> {
  const CustomerLocationRoute({List<_i33.PageRouteInfo>? children})
      : super(
          CustomerLocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerLocationRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i10.DocumentationScreen]
class DocumentationRoute extends _i33.PageRouteInfo<void> {
  const DocumentationRoute({List<_i33.PageRouteInfo>? children})
      : super(
          DocumentationRoute.name,
          initialChildren: children,
        );

  static const String name = 'DocumentationRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i11.FinancialViewScreen]
class FinancialViewRoute extends _i33.PageRouteInfo<void> {
  const FinancialViewRoute({List<_i33.PageRouteInfo>? children})
      : super(
          FinancialViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'FinancialViewRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i12.HomeScreen]
class HomeRoute extends _i33.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i34.Key? key,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i33.PageInfo<HomeRouteArgs> page =
      _i33.PageInfo<HomeRouteArgs>(name);
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i34.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i13.LoadingScreen]
class LoadingRoute extends _i33.PageRouteInfo<void> {
  const LoadingRoute({List<_i33.PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i14.LocationScreen]
class LocationRoute extends _i33.PageRouteInfo<LocationRouteArgs> {
  LocationRoute({
    _i34.Key? key,
    dynamic Function({_i35.Address address})? routeFn,
    bool isBack = false,
    List<_i33.PageRouteInfo>? children,
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

  static const _i33.PageInfo<LocationRouteArgs> page =
      _i33.PageInfo<LocationRouteArgs>(name);
}

class LocationRouteArgs {
  const LocationRouteArgs({
    this.key,
    this.routeFn,
    this.isBack = false,
  });

  final _i34.Key? key;

  final dynamic Function({_i35.Address address})? routeFn;

  final bool isBack;

  @override
  String toString() {
    return 'LocationRouteArgs{key: $key, routeFn: $routeFn, isBack: $isBack}';
  }
}

/// generated route for
/// [_i15.LoginScreen]
class LoginRoute extends _i33.PageRouteInfo<void> {
  const LoginRoute({List<_i33.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i16.MealProfileScreen]
class MealProfileRoute extends _i33.PageRouteInfo<MealProfileRouteArgs> {
  MealProfileRoute({
    _i34.Key? key,
    required _i35.Meal meal,
    required _i35.Chef chef,
    List<_i33.PageRouteInfo>? children,
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

  static const _i33.PageInfo<MealProfileRouteArgs> page =
      _i33.PageInfo<MealProfileRouteArgs>(name);
}

class MealProfileRouteArgs {
  const MealProfileRouteArgs({
    this.key,
    required this.meal,
    required this.chef,
  });

  final _i34.Key? key;

  final _i35.Meal meal;

  final _i35.Chef chef;

  @override
  String toString() {
    return 'MealProfileRouteArgs{key: $key, meal: $meal, chef: $chef}';
  }
}

/// generated route for
/// [_i17.MenuPreOrderScreen]
class MenuPreOrderRoute extends _i33.PageRouteInfo<void> {
  const MenuPreOrderRoute({List<_i33.PageRouteInfo>? children})
      : super(
          MenuPreOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'MenuPreOrderRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i18.MyOrdersScreen]
class MyOrdersRoute extends _i33.PageRouteInfo<MyOrdersRouteArgs> {
  MyOrdersRoute({
    _i34.Key? key,
    bool isHistory = false,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          MyOrdersRoute.name,
          args: MyOrdersRouteArgs(
            key: key,
            isHistory: isHistory,
          ),
          initialChildren: children,
        );

  static const String name = 'MyOrdersRoute';

  static const _i33.PageInfo<MyOrdersRouteArgs> page =
      _i33.PageInfo<MyOrdersRouteArgs>(name);
}

class MyOrdersRouteArgs {
  const MyOrdersRouteArgs({
    this.key,
    this.isHistory = false,
  });

  final _i34.Key? key;

  final bool isHistory;

  @override
  String toString() {
    return 'MyOrdersRouteArgs{key: $key, isHistory: $isHistory}';
  }
}

/// generated route for
/// [_i19.MyScheduleScreen]
class MyScheduleRoute extends _i33.PageRouteInfo<void> {
  const MyScheduleRoute({List<_i33.PageRouteInfo>? children})
      : super(
          MyScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyScheduleRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i20.NotificationScreen]
class NotificationRoute extends _i33.PageRouteInfo<NotificationRouteArgs> {
  NotificationRoute({
    _i34.Key? key,
    required bool isScreen,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          NotificationRoute.name,
          args: NotificationRouteArgs(
            key: key,
            isScreen: isScreen,
          ),
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const _i33.PageInfo<NotificationRouteArgs> page =
      _i33.PageInfo<NotificationRouteArgs>(name);
}

class NotificationRouteArgs {
  const NotificationRouteArgs({
    this.key,
    required this.isScreen,
  });

  final _i34.Key? key;

  final bool isScreen;

  @override
  String toString() {
    return 'NotificationRouteArgs{key: $key, isScreen: $isScreen}';
  }
}

/// generated route for
/// [_i21.OTPScreen]
class OTPRoute extends _i33.PageRouteInfo<void> {
  const OTPRoute({List<_i33.PageRouteInfo>? children})
      : super(
          OTPRoute.name,
          initialChildren: children,
        );

  static const String name = 'OTPRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i22.OnboardingScreen]
class OnboardingRoute extends _i33.PageRouteInfo<void> {
  const OnboardingRoute({List<_i33.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i23.OrderStatusScreen]
class OrderStatusRoute extends _i33.PageRouteInfo<OrderStatusRouteArgs> {
  OrderStatusRoute({
    _i34.Key? key,
    required _i35.Order order,
    List<_i33.PageRouteInfo>? children,
  }) : super(
          OrderStatusRoute.name,
          args: OrderStatusRouteArgs(
            key: key,
            order: order,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderStatusRoute';

  static const _i33.PageInfo<OrderStatusRouteArgs> page =
      _i33.PageInfo<OrderStatusRouteArgs>(name);
}

class OrderStatusRouteArgs {
  const OrderStatusRouteArgs({
    this.key,
    required this.order,
  });

  final _i34.Key? key;

  final _i35.Order order;

  @override
  String toString() {
    return 'OrderStatusRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i24.PaymentStripeScreen]
class PaymentStripeRoute extends _i33.PageRouteInfo<void> {
  const PaymentStripeRoute({List<_i33.PageRouteInfo>? children})
      : super(
          PaymentStripeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentStripeRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i25.PaymentVisaScreen]
class PaymentVisaRoute extends _i33.PageRouteInfo<void> {
  const PaymentVisaRoute({List<_i33.PageRouteInfo>? children})
      : super(
          PaymentVisaRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentVisaRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i26.PerformanceAnalysisScreen]
class PerformanceAnalysisRoute extends _i33.PageRouteInfo<void> {
  const PerformanceAnalysisRoute({List<_i33.PageRouteInfo>? children})
      : super(
          PerformanceAnalysisRoute.name,
          initialChildren: children,
        );

  static const String name = 'PerformanceAnalysisRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i27.RegisterationScreen]
class RegisterationRoute extends _i33.PageRouteInfo<void> {
  const RegisterationRoute({List<_i33.PageRouteInfo>? children})
      : super(
          RegisterationRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterationRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i28.SettingsScreen]
class SettingsRoute extends _i33.PageRouteInfo<void> {
  const SettingsRoute({List<_i33.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i29.SignUpScreen]
class SignUpRoute extends _i33.PageRouteInfo<void> {
  const SignUpRoute({List<_i33.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i30.TrackingOrderScreen]
class TrackingOrderRoute extends _i33.PageRouteInfo<void> {
  const TrackingOrderRoute({List<_i33.PageRouteInfo>? children})
      : super(
          TrackingOrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrackingOrderRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i31.TransactionsScreen]
class TransactionsRoute extends _i33.PageRouteInfo<void> {
  const TransactionsRoute({List<_i33.PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}

/// generated route for
/// [_i32.WalletScreen]
class WalletRoute extends _i33.PageRouteInfo<void> {
  const WalletRoute({List<_i33.PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i33.PageInfo<void> page = _i33.PageInfo<void>(name);
}
