import 'package:auto_route/auto_route.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/yumi/config/guards.dart';
import 'package:yumi/route/route.gr.dart';

class DriverRoutes extends $AppRouter {
  DriverRoutes();

  @override
  List<CustomRoute> get routes => [
        CustomRoute(
          path: '/registeration',
          page: RegisterationRoute.page,
          children: [
            RedirectRoute(path: '', redirectTo: RegStep.signup.name),
            CustomRoute(path: RegStep.signup.name, page: SignUpRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
            CustomRoute(path: RegStep.addPhone.name, page: AddPhoneRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
            CustomRoute(path: RegStep.otp.name, page: OTPRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
            CustomRoute(path: RegStep.location.name, page: LocationRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
            CustomRoute(path: RegStep.onboarding.name, page: OnboardingRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
          ],
        ),

        /// routes go here
        CustomRoute(page: LoadingRoute.page, keepHistory: false, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: LoginRoute.page, keepHistory: false, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: SignUpRoute.page, keepHistory: false, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(initial: true, page: HomeRoute.page, guards: [AuthGuard()], transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: MenuPreOrderRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: NotificationRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: MyScheduleRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: CaloriesReferenceRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: DocumentationRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: ContractRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: OnboardingRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),

        CustomRoute(page: PerformanceAnalysisRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: FinancialViewRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: ChatRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: TransactionsRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: ChefProfileRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: BasketRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: CheckOutRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: PaymentVisaRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: OrderStatusRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: TrackingOrderRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: WalletRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: MealProfileRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: CustomerLocationRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
        CustomRoute(page: ChefCustomerAddressRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade),
      ];
}
