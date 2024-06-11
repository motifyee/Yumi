import 'dart:developer';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/app/pages/driver/reg_cubit.dart';
import 'package:yumi/bloc/user/cubit/user_cubit.dart';

import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final regCubit = G.rd<RegCubit>();
    final userCubit = G.rd<UserCubit>();

    userCubit.loadUser().then((user) async {
      if (user != null) {
        if (!(user.mobileVerified ?? false)) {
          return router.replaceAll([LoginRoute()]);
        }

        if (user.address?.isEmpty ?? true) {
          return router.replaceAll([LoginRoute()]);
        }

        if (G.isCustomerApp) {
          router.push(const LoadingRoute());
          // ignore: use_build_context_synchronously
          final basket = await G.rd<BasketCubit>().getBaskets();

          if (basket == null) return resolver.next(true);
          return basket();
        }

        //(user?.accountApproved ?? false) &&
        if ((user.contractApproved ?? false)) return resolver.next(true);

        router.replaceAll([LoginRoute()]);
      } else {
        if (await regCubit.hasActiveRegisteration()) return regCubit.init();

        router.push(LoginRoute());
      }
    });

    // userCubit.add(LoadxUserFromSharedRefEvent(
    //   afterFetchSuccess: (context, route, user) async {},
    //   context: G.cContext,
    //   // in case of no stored data:
    //   autoLogin: (context) async {
    //     // redirect to registeration if has cached reg-steps
    //     if (await regCubit.hasActiveRegisteration()) return regCubit.init();

    //     router.push(LoginRoute());
    //   },
    //   route: "",
    // ));
  }
}
