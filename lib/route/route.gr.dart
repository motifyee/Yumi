// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:yumi/screens/forget_password.dart' as _i1;
import 'package:yumi/screens/login.dart' as _i2;
import 'package:yumi/screens/signup.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ForgetPassword.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ForgetPassword(),
      );
    },
    Login.name: (routeData) {
      final args = routeData.argsAs<LoginArgs>(orElse: () => const LoginArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.Login(key: args.key),
      );
    },
    SignUp.name: (routeData) {
      final args =
          routeData.argsAs<SignUpArgs>(orElse: () => const SignUpArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.SignUp(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.ForgetPassword]
class ForgetPassword extends _i4.PageRouteInfo<void> {
  const ForgetPassword({List<_i4.PageRouteInfo>? children})
      : super(
          ForgetPassword.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPassword';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.Login]
class Login extends _i4.PageRouteInfo<LoginArgs> {
  Login({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          Login.name,
          args: LoginArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'Login';

  static const _i4.PageInfo<LoginArgs> page = _i4.PageInfo<LoginArgs>(name);
}

class LoginArgs {
  const LoginArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'LoginArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.SignUp]
class SignUp extends _i4.PageRouteInfo<SignUpArgs> {
  SignUp({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          SignUp.name,
          args: SignUpArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignUp';

  static const _i4.PageInfo<SignUpArgs> page = _i4.PageInfo<SignUpArgs>(name);
}

class SignUpArgs {
  const SignUpArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'SignUpArgs{key: $key}';
  }
}
