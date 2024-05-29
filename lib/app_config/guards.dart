import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/app/pages/driver/reg_cubit.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final regCubit = G.rd<RegCubit>();
    final userBloc = G.cContext.read<UserBloc>();

    userBloc.add(UserFromSharedRefEvent(
      afterFetchSuccess: (context, route, user) async {
        // redirect to registeration if has cached reg-steps
        if (await regCubit.hasActiveRegisteration() &&
            userBloc.state.user.accessToken.isNotEmpty) {
          return regCubit.init();
        }

        if (!(user?.mobileVerified ?? false)) {
          return router.replaceAll([LoginRoute()]);
        }

        if (user?.address?.isEmpty ?? true) {
          return router.replaceAll([LoginRoute()]);
        }

        if (G.isCustomerApp) {
          router.push(const LoadingRoute());
          // ignore: use_build_context_synchronously
          final basket = await G.rd<BasketCubit>().getBaskets();

          if (basket == null) return resolver.next(true);
          return basket();
        }

        if ( //(user?.accountApproved ?? false) &&
            (user?.contractApproved ?? false)) return resolver.next(true);

        router.replaceAll([LoginRoute()]);
      },
      context: G.cContext,
      // in case of no stored data
      autoLogin: (p0) => router.push(LoginRoute()),
      route: "",
    ));
  }
}
