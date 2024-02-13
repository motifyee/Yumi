import 'package:auto_route/auto_route.dart';
import 'package:yumi/route/route.gr.dart';

/// every change must:
/// add @RoutePage() to screen widget
/// then run:
/// flutter packages pub run build_runner build
///  flutter packages pub run build_runner watch

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: Login.page, initial: true),
        AutoRoute(page: SignUp.page, keepHistory: false),
        AutoRoute(page: ForgetPassword.page, keepHistory: false),
        AutoRoute(page: Home.page)
      ];
}
