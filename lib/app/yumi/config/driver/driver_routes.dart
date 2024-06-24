import 'package:auto_route/auto_route.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/yumi/config/guards.dart';
import 'package:yumi/route/route.gr.dart';

class DriverRoutes extends $AppRouter {
  DriverRoutes();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/registeration',
          page: RegisterationRoute.page,
          children: [
            RedirectRoute(path: '', redirectTo: RegStep.signup.name),
            AutoRoute(path: RegStep.signup.name, page: SignUpRoute.page),
            AutoRoute(path: RegStep.addPhone.name, page: AddPhoneRoute.page),
            AutoRoute(path: RegStep.otp.name, page: OTPRoute.page),
            AutoRoute(path: RegStep.location.name, page: LocationRoute.page),
            AutoRoute(
                path: RegStep.onboarding.name, page: OnboardingRoute.page),
          ],
        ),

        /// routes go here
        AutoRoute(page: LoadingRoute.page, keepHistory: false),
        AutoRoute(page: LoginRoute.page, keepHistory: false),
        AutoRoute(page: SignUpRoute.page, keepHistory: false),
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
        AutoRoute(page: OnboardingRoute.page),

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
        AutoRoute(page: WalletRoute.page),
        AutoRoute(page: MealProfileRoute.page),
        AutoRoute(page: CustomerLocationRoute.page),
        AutoRoute(page: ChefCustomerAddressRoute.page),
      ];
}