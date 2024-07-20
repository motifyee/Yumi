import 'package:auto_route/auto_route.dart';
import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nested/nested.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/pages/basket/cubit/basket_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/categories/categories_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_cubit.dart';
import 'package:yumi/app/pages/notification/cubit/notification_cubit.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/settings/bankinfo/cubit/bankinfo_cubit.dart';
import 'package:yumi/app/pages/settings/components/profile/cubit/profile_form_cubit.dart';
import 'package:yumi/app/pages/wallet/wallet_cubit/wallet_cubit.dart';

import 'package:yumi/app/yumi/config/customer/customer_routes.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/bloc/app_info/app_info_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/ingredients/ingredients_cubit.dart';
import 'package:yumi/bloc/navigator/navigator_bloc.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:yumi/generated/l10n.dart';

class CustomerAppConfig implements AppConfig {
  final RootStackRouter _appRouter = CustomerRoutes();
  @override
  RootStackRouter get appRouter => _appRouter;

  @override
  String get appTitle => YumiApp.customers.name;

  final List<SingleChildWidget> _providers = [
    BlocProvider(create: (context) => RegCubit()),
    BlocProvider(create: (context) => UserCubit()),
    BlocProvider(create: (context) => NavigatorBloc()),
    BlocProvider(create: (context) => ProfileCubit()),
    BlocProvider(create: (context) => ProfileFormCubit()),
    BlocProvider(create: (context) => BankInfoCubit()),
    BlocProvider(create: (context) => CategoriesCubit()),
    BlocProvider(create: (context) => MealCubit()),
    BlocProvider(create: (context) => IngredientsCubit()),
    BlocProvider(create: (context) => BasketCubit()),
    BlocProvider(create: (context) => AppInfoCubit()),
    BlocProvider(create: (context) => WalletCubit()),
    BlocProvider(create: (context) => NotificationCubit()),
    BlocProvider(create: (context) => SignalRCubit()),
  ];
  @override
  List<SingleChildWidget> get blocProviders => _providers;

  @override
  Iterable<LocalizationsDelegate>? get localizationsDelegates => const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  @override
  Iterable<Locale> get supportedLocales => S.delegate.supportedLocales;

  @override
  Locale get locale => const Locale('en');

  @override
  ThemeData? get theme => commonTheme;
}
