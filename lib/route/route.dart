import 'package:auto_route/auto_route.dart';
import 'package:yumi/app/yumi/config/guards.dart';
import 'package:yumi/route/route.gr.dart';

/// every change must:
/// add @RoutePage() to screen widget
/// then run:
/// dart run build_runner build
/// dart run build_runner watch

@AutoRouterConfig()
class YumiRouter extends $YumiRouter {
  YumiRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/registeration',
          page: RegisterationRoute.page,
          children: [
            RedirectRoute(path: '', redirectTo: 'signup'),
            AutoRoute(path: 'signup', page: SignUpRoute.page),
            AutoRoute(path: 'addPhone', page: AddPhoneRoute.page),
            AutoRoute(path: 'otp', page: OTPRoute.page),
            AutoRoute(path: 'location', page: LocationRoute.page),
          ],
        ),

        /// routes go here
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: SignUpRoute.page, keepHistory: false),

        AutoRoute(page: HomeRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: MenuPreOrderRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: NotificationRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: MyScheduleRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: CaloriesReferenceRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: DocumentationRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: ContractRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: OnboardingRoute.page, guards: [AuthGuard()]),

        AutoRoute(page: PerformanceAnalysisRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: FinancialViewRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: ChatRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: TransactionsRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: SettingsRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: ChefProfileRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: BasketRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: CheckOutRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: PaymentVisaRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: OrderStatusRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: TrackingOrderRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: WalletRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: MealProfileRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: CustomerLocationRoute.page, guards: [AuthGuard()]),
        AutoRoute(page: MyOrdersRoute.page, guards: [AuthGuard()]),
      ];
}
