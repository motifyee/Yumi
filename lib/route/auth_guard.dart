import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    bool authenticated =
        G.context.read<UserBloc>().state.user.accessToken.isNotEmpty;

    if (authenticated) {
      resolver.next(true);
    } else {
      resolver.redirect(LoginRoute());
    }
  }
}
