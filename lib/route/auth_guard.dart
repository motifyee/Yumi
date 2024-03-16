import 'package:auto_route/auto_route.dart';
import 'package:yumi/route/route.gr.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    const authenticated = true;

    if (authenticated) {
      resolver.next(true);
    } else {
      resolver.redirect(LoginRoute());
    }
  }
}
