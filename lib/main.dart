import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/ingredient/ingredient_list_bloc.dart';
import 'package:yumi/bloc/meal/ingredient_form_bloc.dart';
import 'package:yumi/bloc/meal/meal_form_bloc.dart';
import 'package:yumi/bloc/meal/meal_list_bloc.dart';
import 'package:yumi/bloc/navigator/navigator_bloc.dart';
import 'package:yumi/bloc/profile/form/profile_form_bloc.dart';
import 'package:yumi/bloc/profile/profile_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/route/route.dart';
import 'package:yumi/statics/theme_statics.dart';
import 'package:yumi/theme/theme.dart';

import 'generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      providers: [
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => NavigatorBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => ProfileFormBloc()),
        BlocProvider(create: (context) => CategoriesBloc()),
        BlocProvider(create: (context) => MealListBloc()),
        BlocProvider(create: (context) => MealFormBloc()),
        BlocProvider(create: (context) => IngredientListBloc()),
        BlocProvider(create: (context) => IngredientFormBloc()),
      ],
      child: MaterialApp.router(
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
        builder: (context, child) {
          return Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              child: SafeArea(
                  child: Container(
                color: ThemeSelector.colors.background,
                child: child ?? const Text(''),
              )));
        },
      ),
    );
  }
}
