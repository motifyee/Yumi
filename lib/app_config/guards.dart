import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    G.cContext.read<UserBloc>().add(UserFromSharedRefEvent(
          afterFetchSuccess: (context, route, user) {
            if ((user?.mobileVerified ?? false) &&
                (user?.accountApproved ?? false)) {
              resolver.next(true);
            }

            router.push(LoginRoute());
          },
          context: G.cContext,
          autoLogin: (p0) => router.push(LoginRoute()),
          route: "",
        ));
  }
}
