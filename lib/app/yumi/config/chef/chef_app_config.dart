import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:nested/nested.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/pages/documentation_screen/cubit/docs_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/pages/home/cubit/app_info/app_info_cubit.dart';
import 'package:yumi/app/pages/home/cubit/navigator_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/categories/categories_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/ingredient_form/ingredients_form_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/ingredient_list/ingredient_list_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal_form/meal_form_cubit.dart';
import 'package:yumi/app/pages/notification/cubit/notification_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/cubit/schedule_cubit.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/settings/bankinfo/cubit/bankinfo_cubit.dart';
import 'package:yumi/app/pages/settings/components/profile/cubit/profile_form_cubit.dart';
import 'package:yumi/app/pages/wallet/wallet_cubit/wallet_cubit.dart';
import 'package:yumi/app/yumi/config/chef/chef_routes.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/app/pages/menu/cubit/chef/chef_cubit.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/generated/l10n.dart';

class ChefAppConfig implements AppConfig {
  final RootStackRouter _appRouter = ChefRoutes();
  @override
  RootStackRouter get appRouter => _appRouter;

  ChefAppConfig() {
    FlutterNativeSplash.remove();
  }

  @override
  String get appTitle => YumiApp.chefs.name;

  final List<SingleChildWidget> _providers = [
    BlocProvider(create: (context) => UserCubit()),
    BlocProvider(create: (context) => ProfileFormCubit()),
    BlocProvider(create: (context) => BankInfoCubit()),
    BlocProvider(create: (context) => CategoriesCubit()),
    BlocProvider(create: (context) => MealFormCubit()),
    BlocProvider(create: (context) => IngredientListCubit()),
    BlocProvider(create: (context) => IngredientsFormCubit()),
    BlocProvider(create: (context) => ChefsCubit()),
    //
    BlocProvider(create: (context) => ProfileCubit()),
    BlocProvider(create: (context) => DocsCubit()),
    BlocProvider(create: (context) => MealCubit()),
    BlocProvider(create: (context) => RegCubit()),
    BlocProvider(create: (context) => ScheduleCubit()),
    BlocProvider(create: (context) => NavigatorCubit()),
    BlocProvider(create: (context) => AppInfoCubit()),
    BlocProvider(create: (context) => WalletCubit()),
    BlocProvider(create: (context) => NotificationCubit()),
    BlocProvider(create: (context) => SignalRCubit()),
  ];
  @override
  List<SingleChildWidget> get blocProviders => _providers;

  @override
  Iterable<LocalizationsDelegate>? get localizationsDelegates => const [
        CommonCodeS.delegate,
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  @override
  Iterable<Locale> get supportedLocales => S.delegate.supportedLocales;

  @override
  Locale get locale => const Locale('ar');

  @override
  ThemeData? get theme => commonTheme;
}
