import 'package:auto_route/auto_route.dart';
import 'package:common_code/routes/routes.gr.dart';

@AutoRouterConfig()
class CommonRouter extends $CommonRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoadingRoute.page),
      ];
}
