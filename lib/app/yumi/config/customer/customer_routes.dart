import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/app/yumi/config/guards.dart';
import 'package:yumi/routes/routes.gr.dart';

class CustomerRoutes extends $YumiRouter {
  CustomerRoutes();

  @override
  List<CustomRoute> get routes => [
        CustomRoute(
          path: '/registeration',
          page: RegisterationRoute.page,
          children: [
            RedirectRoute(path: '', redirectTo: 'signup'),
            CustomRoute(
                path: 'signup',
                page: SignUpRoute.page,
                transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
                reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
            CustomRoute(
                path: 'addPhone',
                page: AddPhoneRoute.page,
                transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
                reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
            CustomRoute(
                path: 'otp',
                page: OTPRoute.page,
                transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
                reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
            CustomRoute(
                path: 'location',
                page: LocationRoute.page,
                transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
                reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
          ],
        ),

        /// routes go here
        CustomRoute(
            page: LoadingRoute.page,
            keepHistory: false,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: LoginRoute.page,
            keepHistory: false,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: SignUpRoute.page,
            keepHistory: false,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            initial: true,
            page: HomeRoute.page,
            guards: [AuthGuard()],
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: MenuPreOrderRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: NotificationRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: MyScheduleRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: CaloriesReferenceRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: DocumentationRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: ContractRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: OnboardingRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),

        CustomRoute(
            page: PerformanceAnalysisRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: FinancialViewRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(page: ChatRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: TransactionsRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: SettingsRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: ChefProfileRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: BasketRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: CheckOutRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: PaymentVisaRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: OrderStatusRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: TrackingOrderRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: WalletRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: MealProfileRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: CustomerLocationRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: MyOrdersRoute.page, transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds, reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: ChefCustomerAddressRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            path: '/customer_location',
            page: LocationRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds: CommonDimens.animationDuration.inMilliseconds),
      ];
}
