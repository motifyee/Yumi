import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:yumi/app/components/signal_r/cubit/signal_r_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/pages/documentation_screen/cubit/docs_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/cubit/registeration_cubit/reg_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/categories/categories_bloc.dart';
import 'package:yumi/app/pages/menu/cubit/form/meal_form_bloc.dart';
import 'package:yumi/app/pages/menu/cubit/ingredient_form/ingredient_form_bloc.dart';
import 'package:yumi/app/pages/menu/cubit/meal_list/meal_list_bloc.dart';
import 'package:yumi/app/pages/menu/cubit/categories/cubit/categories_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/meal/form/meal_form_bloc.dart';
import 'package:yumi/app/pages/menu/cubit/meal/ingredient_form/ingredient_form_bloc.dart';
import 'package:yumi/app/pages/menu/cubit/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/app/pages/notification/cubit/notification_cubit.dart';
import 'package:yumi/app/pages/auth/registeration/pages/schedule_screen/cubit/schedule_cubit.dart';
import 'package:yumi/app/pages/settings/bankinfo/bloc/bankinfo_bloc.dart';
import 'package:yumi/app/pages/profile/cubit/profile_cubit.dart';
import 'package:yumi/app/pages/wallet/wallet_cubit/wallet_cubit.dart';
import 'package:yumi/app/yumi/config/app_config.dart';
import 'package:yumi/app/yumi/config/chef/chef_routes.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/bloc/app_info/app_info_cubit.dart';
import 'package:yumi/app/pages/menu/cubit/chef/chef_cubit.dart';
import 'package:yumi/bloc/ingredient/ingredient_list_bloc.dart';
import 'package:yumi/bloc/navigator/navigator_bloc.dart';
import 'package:yumi/domain/user/cubit/user_cubit.dart';

class ChefAppConfig implements AppConfig {
  @override
  AppTargetUser get appTargetUser => AppTargetUser.chefs;

  final RootStackRouter _appRouter = ChefRoutes();
  @override
  RootStackRouter get appRouter => _appRouter;

  final List<SingleChildWidget> _providers = [
    BlocProvider(create: (context) => UserCubit()),
    BlocProvider(create: (context) => BankInfoBloc()),
    BlocProvider(create: (context) => CategoriesCubit()),
    BlocProvider(create: (context) => MealFormBloc()),
    BlocProvider(create: (context) => IngredientListBloc()),
    BlocProvider(create: (context) => IngredientFormBloc()),
    BlocProvider(create: (context) => ChefsCubit()),
    //
    BlocProvider(create: (context) => ProfileCubit()),
    BlocProvider(create: (context) => DocsCubit()),
    BlocProvider(create: (context) => MealListBloc()),
    BlocProvider(create: (context) => RegCubit()),
    BlocProvider(create: (context) => ScheduleCubit()),
    BlocProvider(create: (context) => NavigatorBloc()),
    BlocProvider(create: (context) => AppInfoCubit()),
    BlocProvider(create: (context) => WalletCubit()),
    BlocProvider(create: (context) => NotificationCubit()),
    BlocProvider(create: (context) => SignalRCubit()),
  ];
  @override
  List<SingleChildWidget> get blocProviders => _providers;
}
