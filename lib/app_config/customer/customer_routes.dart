import 'package:auto_route/auto_route.dart';
import 'package:yumi/app_config/guards.dart';
import 'package:yumi/route/route.gr.dart';

class CustomerRoutes extends $AppRouter {
  CustomerRoutes();

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
        AutoRoute(page: LoginRoute.page, keepHistory: false),
        AutoRoute(page: SignUpRoute.page, keepHistory: false),
        AutoRoute(page: ForgetPasswordRoute.page, keepHistory: false),
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
          guards: [AuthGuard()],
        ),
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
        AutoRoute(page: SettingRoute.page),
        AutoRoute(page: ChefProfileRoute.page),
        AutoRoute(page: BasketRoute.page),
        AutoRoute(page: CheckOutRoute.page),
        AutoRoute(page: PaymentVisaRoute.page),
        AutoRoute(page: OrderStatusRoute.page),
        AutoRoute(page: TrackingOrderRoute.page),
        AutoRoute(page: CustomerWalletRoute.page),
        AutoRoute(page: MealProfileRoute.page),
        AutoRoute(page: CustomerLocationRoute.page),
        AutoRoute(page: MyOrdersRoute.page),
      ];
}
