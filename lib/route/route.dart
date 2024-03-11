import 'package:auto_route/auto_route.dart';
import 'package:yumi/route/route.gr.dart';

/// every change must:
/// add @RoutePage() to screen widget
/// then run:
/// dart run build_runner build
/// dart run build_runner watch

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: SignUpRoute.page, keepHistory: false),
        AutoRoute(page: ForgetPasswordRoute.page, keepHistory: false),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: MenuPreOrderRoute.page),
        AutoRoute(page: NotificationRoute.page),
        AutoRoute(page: MyScheduleRoute.page),
        AutoRoute(page: CaloriesReferenceRoute.page),
        AutoRoute(page: DocumentationRoute.page),
        AutoRoute(page: ContractRoute.page),
        AutoRoute(page: ChefApplicationFlowRoute.page),

        AutoRoute(page: PerformanceAnalysisRoute.page),
        AutoRoute(page: FinancialViewRoute.page),
        AutoRoute(page: ChatRoute.page),
        AutoRoute(page: TransactionsRoute.page),
        AutoRoute(page: ChefProfileRoute.page),
        AutoRoute(page: BasketRoute.page),
        AutoRoute(page: CheckOutRoute.page),
        AutoRoute(page: PaymentVisaRoute.page),
        AutoRoute(page: OrderStatusRoute.page),
        AutoRoute(page: TrackingOrderRoute.page),
      ];
}
