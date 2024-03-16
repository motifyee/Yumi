import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:yumi/bloc/basket/basket_form_bloc.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/chefs/chefs_list_bloc.dart';
import 'package:yumi/bloc/ingredient/ingredient_list_bloc.dart';
import 'package:yumi/bloc/meal/form/meal_form_bloc.dart';
import 'package:yumi/bloc/meal/ingredient_form/ingredient_form_bloc.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/bloc/navigator/navigator_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/features/chef_application/bloc.dart';
import 'package:yumi/features/chef_application/documentation/bloc/documentation_bloc.dart';
import 'package:yumi/features/chef_application/documentation/bloc/ui/icon_bloc.dart';
import 'package:yumi/features/settings/bankinfo/bloc/bankinfo_bloc.dart';
import 'package:yumi/features/settings/profle/bloc/profile_bloc.dart';
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
        BlocProvider(create: (context) => BankInfoBloc()),
        BlocProvider(create: (context) => CategoriesBloc()),
        BlocProvider(create: (context) => ChefFlowBloc()),
        BlocProvider(create: (context) => DocsBloc()),
        BlocProvider(create: (context) => MealFormBloc()),
        BlocProvider(create: (context) => MealListBloc()),
        BlocProvider(create: (context) => SVGBloc()),
        BlocProvider(create: (context) => IngredientListBloc()),
        BlocProvider(create: (context) => IngredientFormBloc()),
        BlocProvider(create: (context) => ChefsListBloc()),
        BlocProvider(create: (context) => BasketFormBloc()),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
