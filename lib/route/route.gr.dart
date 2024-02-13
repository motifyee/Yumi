// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:yumi/screens/forget_password.dart' as _i1;
import 'package:yumi/screens/home.dart' as _i2;
import 'package:yumi/screens/login.dart' as _i3;
import 'package:yumi/screens/signup.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ForgetPassword.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ForgetPassword(),
      );
    },
    Home.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.Home(),
      );
    },
    Login.name: (routeData) {
      final args = routeData.argsAs<LoginArgs>(orElse: () => const LoginArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.Login(key: args.key),
      );
    },
    SignUp.name: (routeData) {
      final args =
          routeData.argsAs<SignUpArgs>(orElse: () => const SignUpArgs());
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.SignUp(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.ForgetPassword]
class ForgetPassword extends _i5.PageRouteInfo<void> {
  const ForgetPassword({List<_i5.PageRouteInfo>? children})
      : super(
          ForgetPassword.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPassword';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Home]
class Home extends _i5.PageRouteInfo<void> {
  const Home({List<_i5.PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.Login]
class Login extends _i5.PageRouteInfo<LoginArgs> {
  Login({
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          Login.name,
          args: LoginArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i5.PageInfo<LoginArgs> page = _i5.PageInfo<LoginArgs>(name);
}

class LoginArgs {
  const LoginArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'LoginArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.SignUp]
class SignUp extends _i5.PageRouteInfo<SignUpArgs> {
  SignUp({
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          SignUp.name,
          args: SignUpArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i5.PageInfo<SignUpArgs> page = _i5.PageInfo<SignUpArgs>(name);
}

class SignUpArgs {
  const SignUpArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'SignUpArgs{key: $key}';
  }
}
