import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    G.cContext.read<UserBloc>().add(UserFromSharedRefEvent(
          afterFetchSuccess: (context, route, user) async {
            if ((user?.mobileVerified ?? false) &&
                (G.isCustomerApp || (user?.accountApproved ?? false))) {
              if (G.isCustomerApp) {
                final rt = await G.cContext.read<BasketCubit>().getBaskets();
                if (rt == null) return resolver.next(true);
                return rt();
              } else {
                return resolver.next(true);
              }
            }

            // router.push(const RegisterationRoute());
            router.replaceAll([LoginRoute()]);
          },
          context: G.cContext,
          // in case of no stored data
          autoLogin: (p0) => router.push(LoginRoute()),
          route: "",
        ));
  }
}
