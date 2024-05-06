import 'package:nested/nested.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:yumi/app/pages/settings/profile/cubit/profile_cubit.dart';
import 'package:yumi/bloc/basket/basket_form_bloc.dart';
import 'package:yumi/bloc/chefs/chefs_list_bloc.dart';
import 'package:yumi/bloc/ingredient/ingredient_list_bloc.dart';
import 'package:yumi/bloc/meal/form/meal_form_bloc.dart';
import 'package:yumi/bloc/meal/ingredient_form/ingredient_form_bloc.dart';
import 'package:yumi/bloc/navigator/navigator_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/app/pages/chef_application/bloc.dart';
import 'package:yumi/app/pages/chef_application/documentation/bloc/documentation_bloc.dart';
import 'package:yumi/app/pages/chef_application/documentation/bloc/icon_bloc.dart';
import 'package:yumi/app/pages/schedule/cubit/schedule_cubit.dart';
import 'package:yumi/app/pages/settings/bankinfo/bloc/bankinfo_bloc.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/theme/theme.dart';

import 'generated/l10n.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WakelockPlus.enable();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _providers,
      child: _materialApp(),
    );
  }

  MaterialApp _materialApp() {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'YUMI',
      theme: defaultTheme,
      builder: _builder,
    );
  }

  List<SingleChildWidget> get _providers {
    return [
      BlocProvider(create: (context) => UserBloc()),
      BlocProvider(create: (context) => NavigatorBloc()),
      BlocProvider(create: (context) => ProfileCubit()),
      BlocProvider(create: (context) => BankInfoBloc()),
      BlocProvider(create: (context) => ChefFlowBloc()),
      BlocProvider(create: (context) => DocsBloc()),
      BlocProvider(create: (context) => MealFormBloc()),
      BlocProvider(create: (context) => SVGBloc()),
      BlocProvider(create: (context) => IngredientListBloc()),
      BlocProvider(create: (context) => IngredientFormBloc()),
      BlocProvider(create: (context) => ChefsListBloc()),
      BlocProvider(create: (context) => BasketFormBloc()),
      BlocProvider(create: (context) => ScheduleCubit()),
    ];
  }

  Widget _builder(context, child) {
    return Builder(
        key: G.builderKey,
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: SafeArea(
              child: Container(
                color: ThemeSelector.colors.background,
                child: child ?? const Text(''),
              ),
            ),
          );
        });
  }
}
