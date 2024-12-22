import 'package:common_code/core/setup/signalr.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/core/signal_r.dart';

import 'package:yumi/global.dart';
import 'package:yumi/routes/routes.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final regCubit = G().rd<RegCubit>();
    final userCubit = G().rd<UserCubit>();
    FlutterNativeSplash.remove();

    userCubit.loadUser().then((user) async {
      if (user == null) {
        if (await regCubit.hasActiveRegisteration()) return regCubit.initReg();

        if (G().isCustomerApp) return resolver.next(true);
        return router.replaceAll([const LoginRoute()]);
      }

      if (Signalr.hubConnection?.state != HubConnectionState.Connected) {
        initializeSignalr();
      }

      if (!(user.mobileVerified ?? false)) {
        return router.replaceAll([const LoginRoute()]);
      }

      if (user.address?.isEmpty ?? true) {
        return router.replaceAll([const LoginRoute()]);
      }

      if (G().isCustomerApp) {
        router.push(const LoadingRoute());
        // ignore: use_build_context_synchronously
        final basket = await G().rd<BasketCubit>().getBaskets();

        if (basket == null) return resolver.next(true);
        return basket();
      }

      //(user?.accountApproved ?? false) &&
      if ((user.contractApproved ?? false)) return resolver.next(true);

      router.replaceAll([const LoginRoute()]);
    });
  }
}
