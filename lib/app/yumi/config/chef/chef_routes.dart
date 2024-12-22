import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/yumi/config/guards.dart';
import 'package:yumi/routes/routes.gr.dart';

class ChefRoutes extends $YumiRouter {
  ChefRoutes();

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
                  CommonDimens.animationDuration.inMilliseconds,
            ),
            CustomRoute(
              path: RegStep.addPhone.name,
              page: AddPhoneRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
              durationInMilliseconds:
                  CommonDimens.animationDuration.inMilliseconds,
              reverseDurationInMilliseconds:
                  CommonDimens.animationDuration.inMilliseconds,
            ),
            CustomRoute(
              path: RegStep.otp.name,
              page: OTPRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
              durationInMilliseconds:
                  CommonDimens.animationDuration.inMilliseconds,
              reverseDurationInMilliseconds:
                  CommonDimens.animationDuration.inMilliseconds,
            ),
            CustomRoute(
              path: RegStep.location.name,
              page: LocationRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
              durationInMilliseconds:
                  CommonDimens.animationDuration.inMilliseconds,
              reverseDurationInMilliseconds:
                  CommonDimens.animationDuration.inMilliseconds,
            ),
            CustomRoute(
              path: RegStep.onboarding.name,
              page: OnboardingRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
              durationInMilliseconds:
                  CommonDimens.animationDuration.inMilliseconds,
              reverseDurationInMilliseconds:
                  CommonDimens.animationDuration.inMilliseconds,
            ),
          ],
        ),

        /// routes go here
        CustomRoute(
          page: LoadingRoute.page,
          keepHistory: false,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: LoadingRoute.page,
          keepHistory: false,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: LoginRoute.page,
          keepHistory: false,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: SignUpRoute.page,
          keepHistory: false,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          initial: true,
          page: HomeRoute.page,
          guards: [AuthGuard()],
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: MenuPreOrderRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: NotificationRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: MyScheduleRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: CaloriesReferenceRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: DocumentationRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: ContractRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: OnboardingRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),

        CustomRoute(
          page: PerformanceAnalysisRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: FinancialViewRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: ChatRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: TransactionsRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: ChefProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: BasketRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: CheckOutRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: PaymentVisaRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: OrderStatusRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: TrackingOrderRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: WalletRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: MealProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
        CustomRoute(
          page: CustomerLocationRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
          durationInMilliseconds: CommonDimens.animationDuration.inMilliseconds,
          reverseDurationInMilliseconds:
              CommonDimens.animationDuration.inMilliseconds,
        ),
      ];
}

// enum Screens {
//   login,
//   signup,
//   addPhone,
//   otp,
//   location,
//   onboarding,
//   registeration,
//   home,
//   settings,
//   //
//   menuPreOrder,
//   notification,
//   mySchedule,
//   caloriesReference,
//   documentation,
//   contract,
//   performanceAnalysis,
//   financialView,
//   chat,
//   transactions,
//   chefProfile,
//   basket,
//   checkOut,
//   paymentVisa,
//   orderStatus,
//   trackingOrder,
//   wallet,
//   mealProfile,
//   customerLocation,
//   chefCustomerAddress,
//   myOrders,
// }

// extension ScreensExt on Screens {
//   String get route => '/$name';

//   GoRoute goRoute(Widget Function(BuildContext, GoRouterState)? builder) {
//     return GoRoute(
//       name: name,
//       path: route,
//       builder: builder,
//     );
//   }
// }

// class ActiveGoRoute {
//   Route? route;
//   Route? previousRoute;

//   ActiveGoRoute();

//   void didPush(Route route, Route? previousRoute) {
//     this.route = route;
//     this.previousRoute = previousRoute;
//   }
// }

// class Observer extends NavigatorObserver {
//   @override
//   void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     super.didPush(route, previousRoute);

//     if (route.settings.name == null) return;

//     getIt<ActiveGoRoute>().didPush(route, previousRoute);
//   }
// }

// GoRouter chefRouter = GoRouter(
//   navigatorKey: G().routerKey,
//   observers: [Observer()],
//   redirect: (context, state) async {
//     final regRoutes = RegStep.values.map((s) => '/${s.name}').toList()
//       ..addAll(['/login', '/loadingScreen']);

//     if (regRoutes.contains(state.fullPath)) return null;

//     final userCubit = context.read<UserCubit>();

//     //* if (userCubit.state.user.accessToken.isNotEmpty) return null;

//     final user = await userCubit.loadUser();
//     if (user == null) {
//       final regCubit = G().rd<RegCubit>();
//       if (!(await regCubit.hasActiveRegisteration())) regCubit.initReg();

//       return Screens.login.route;
//     }

//     if (!(user.mobileVerified ?? false)) return Screens.login.route;
//     if (user.address?.isEmpty ?? true) return Screens.login.route;

//     if (G().isCustomerApp) {
//       //* router.push(const LoadingRoute());
//       // ignore: use_build_context_synchronously
//       context.go('/loadingScreen');
//       final basket = await G().rd<BasketCubit>().getBaskets();

//       if (basket == null) return null;
//       return '/basket';
//     }

//     //(user?.accountApproved ?? false) &&
//     if ((user.contractApproved ?? false)) return null;

//     return Screens.login.route;
//   },
//   initialLocation: Screens.home.route,
//   debugLogDiagnostics: true,
//   routes: <RouteBase>[
//     Screens.login.goRoute((_, __) => const LoginScreen()),
//     ShellRoute(
//       builder: (context, state, child) {
//         return StatefulWrapper(
//           onInit: () {
//             final regCubit = context.read<RegCubit>();
//             G().rd<UserCubit>().loadUser().then((_) {
//               if (!regCubit.state.registerationStarted) regCubit.initReg();
//             });

//             if (regCubit.state.partialFlow) return child;
//           },
//           child: Builder(
//             builder: (context) {
//               return Stack(
//                 children: [
//                   Positioned.fill(child: child),
//                   Positioned(
//                     right: 0,
//                     top: 0,
//                     child: Container(
//                       padding: const EdgeInsets.all(8),
//                       child: IconButton(
//                         onPressed: () => askToLogout(context),
//                         icon: SvgPicture.asset(AppAssets.logoutMenuIcon),
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         );
//       },
//       routes: <RouteBase>[
//         Screens.signup.goRoute((_, __) => const SignUpScreen()),
//         Screens.addPhone.goRoute((_, __) => const AddPhoneScreen()),
//         Screens.otp.goRoute((_, __) => const OTPScreen()),
//         Screens.location.goRoute((_, __) => LocationScreen()),
//         Screens.onboarding.goRoute((_, __) => const OnboardingScreen()),
//       ],
//     ),
//     Screens.settings.goRoute((_, __) => const SettingsScreen()),
//     Screens.home.goRoute((_, __) => HomeScreen()),
//     Screens.menuPreOrder.goRoute((_, __) => const MenuPreOrderScreen()),
//     Screens.notification
//         .goRoute((_, state) => const NotificationScreen(isScreen: false)),
//     Screens.mySchedule.goRoute((_, __) => const MyScheduleScreen()),
//     Screens.caloriesReference
//         .goRoute((_, __) => const CaloriesReferenceScreen()),
//     Screens.documentation.goRoute((_, __) => const DocumentationScreen()),
//     Screens.contract.goRoute((_, __) => const ContractScreen()),
//     Screens.performanceAnalysis
//         .goRoute((_, __) => const PerformanceAnalysisScreen()),
//     Screens.financialView.goRoute((_, __) => const FinancialViewScreen()),
//     Screens.chat.goRoute((_, __) => const ChatScreen()),
//     Screens.transactions.goRoute((_, __) => const TransactionsScreen()),
//     // Screens.chefProfile.goRoute((_, __) => ChefProfileScreen()),
//     Screens.basket.goRoute((_, __) => BasketScreen()),
//     Screens.checkOut.goRoute((_, __) => CheckOutScreen()),
//     Screens.paymentVisa.goRoute((_, __) => const PaymentVisaScreen()),
//     // Screens.orderStatus.goRoute((_, __) => OrderStatusScreen()),
//     Screens.trackingOrder.goRoute((_, __) => const TrackingOrderScreen()),
//     Screens.wallet.goRoute((_, __) => const WalletScreen()),
//     // Screens.mealProfile.goRoute((_, __) => const MealProfileScreen()),
//     Screens.customerLocation.goRoute((_, __) => const CustomerLocationScreen()),
//     ////
//     // Screens.chefCustomerAddress.goRoute((_, __) => ChefCustomerAddressScreen()),
//     Screens.myOrders.goRoute((_, __) => MyOrdersScreen()),
//   ],
// );
