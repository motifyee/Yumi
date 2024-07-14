import 'package:common_code/common_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:nested/nested.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/cubit/schedule_cubit.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/chef/chef_cubit.dart';
import 'package:yumi/bloc/ingredient/ingredient_list_bloc.dart';
import 'package:yumi/bloc/navigator/navigator_bloc.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';

import 'package:yumi/global.dart';
import 'package:yumi/route/route.dart';
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

  final _appRouter = YumiRouter();

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
      BlocProvider(create: (context) => UserCubit()),
      BlocProvider(create: (context) => NavigatorBloc()),
      BlocProvider(create: (context) => ProfileCubit()),
      BlocProvider(create: (context) => IngredientListBloc()),
      BlocProvider(create: (context) => ChefsCubit()),
      BlocProvider(create: (context) => ScheduleCubit()),
    ];
  }

  Widget _builder(context, child) {
    return Builder(
        key: G().appBuilderKey,
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: SafeArea(
              child: Container(
                color: CommonColors.background,
                child: child ?? const Text(''),
              ),
            ),
          );
        });
  }
}
