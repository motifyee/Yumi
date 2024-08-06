import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/yumi/config/guards.dart';
import 'package:yumi/routes/routes.gr.dart';

class DriverRoutes extends $YumiRouter {
  DriverRoutes();

  @override
  List<CustomRoute> get routes => [
        CustomRoute(
          path: '/registeration',
          page: RegisterationRoute.page,
          children: [
            RedirectRoute(path: '', redirectTo: RegStep.signup.name),
            CustomRoute(
                path: RegStep.signup.name,
                page: SignUpRoute.page,
                transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                durationInMilliseconds:
                    CommonDimens.animationDuration.inMilliseconds,
                reverseDurationInMilliseconds:
                    CommonDimens.animationDuration.inMilliseconds),
            CustomRoute(
                path: RegStep.addPhone.name,
                page: AddPhoneRoute.page,
                transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                durationInMilliseconds:
                    CommonDimens.animationDuration.inMilliseconds,
                reverseDurationInMilliseconds:
                    CommonDimens.animationDuration.inMilliseconds),
            CustomRoute(
                path: RegStep.otp.name,
                page: OTPRoute.page,
                transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                durationInMilliseconds:
                    CommonDimens.animationDuration.inMilliseconds,
                reverseDurationInMilliseconds:
                    CommonDimens.animationDuration.inMilliseconds),
            CustomRoute(
                path: RegStep.location.name,
                page: LocationRoute.page,
                transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                durationInMilliseconds:
                    CommonDimens.animationDuration.inMilliseconds,
                reverseDurationInMilliseconds:
                    CommonDimens.animationDuration.inMilliseconds),
            CustomRoute(
                path: RegStep.onboarding.name,
                page: OnboardingRoute.page,
                transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
                durationInMilliseconds:
                    CommonDimens.animationDuration.inMilliseconds,
                reverseDurationInMilliseconds:
                    CommonDimens.animationDuration.inMilliseconds),
          ],
        ),

        /// routes go here
        CustomRoute(
            page: LoadingRoute.page,
            keepHistory: false,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: LoginRoute.page,
            keepHistory: false,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: SignUpRoute.page,
            keepHistory: false,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            initial: true,
            page: HomeRoute.page,
            guards: [AuthGuard()],
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: MenuPreOrderRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: NotificationRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: MyScheduleRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: CaloriesReferenceRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: DocumentationRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: ContractRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: OnboardingRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),

        CustomRoute(
            page: PerformanceAnalysisRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: FinancialViewRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: ChatRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: TransactionsRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: ChefProfileRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: BasketRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: CheckOutRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: PaymentVisaRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: OrderStatusRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: TrackingOrderRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: WalletRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: MealProfileRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: CustomerLocationRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
        CustomRoute(
            page: ChefCustomerAddressRoute.page,
            transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            durationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds,
            reverseDurationInMilliseconds:
                CommonDimens.animationDuration.inMilliseconds),
      ];
}
