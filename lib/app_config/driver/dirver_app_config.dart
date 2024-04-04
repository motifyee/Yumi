import 'package:auto_route/auto_route.dart';
import 'package:bloc/src/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/app_config/app_config.dart';
import 'package:yumi/app_config/driver/driver_routes.dart';
import 'package:yumi/bloc/basket/basket_form_bloc.dart';
import 'package:yumi/bloc/categories/categories_bloc.dart';
import 'package:yumi/bloc/chefs/chefs_list_bloc.dart';
import 'package:yumi/bloc/ingredient/ingredient_list_bloc.dart';
import 'package:yumi/bloc/meal/form/meal_form_bloc.dart';
import 'package:yumi/bloc/meal/ingredient_form/ingredient_form_bloc.dart';
import 'package:yumi/bloc/meal/meal_list/meal_list_bloc.dart';
import 'package:yumi/bloc/navigator/navigator_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/driver/driver_reg_cubit.dart';
import 'package:yumi/features/chef_application/bloc.dart';
import 'package:yumi/features/chef_application/documentation/bloc/cubit/docs_cubit.dart';
import 'package:yumi/features/chef_application/documentation/bloc/documentation_bloc.dart';
import 'package:yumi/features/chef_application/documentation/bloc/icon_bloc.dart';
import 'package:yumi/features/schedule/bloc/schedule_bloc.dart';
import 'package:yumi/features/schedule/repository/repository.dart';
import 'package:yumi/features/settings/bankinfo/bloc/bankinfo_bloc.dart';
import 'package:yumi/features/settings/profile/bloc/profile_bloc.dart';
import 'package:nested/nested.dart';

class DriverAppConfig implements AppConfig {
  @override
  AppTargetUser get appTargetUser => AppTargetUser.drivers;

  final RootStackRouter _appRouter = DriverRoutes();
  @override
  RootStackRouter get appRouter => _appRouter;

  final List<SingleChildWidget> _providers = [
    BlocProvider(create: (context) => UserBloc()),
    BlocProvider(create: (context) => BankInfoBloc()),
    BlocProvider(create: (context) => CategoriesBloc()),
    BlocProvider(create: (context) => ChefFlowBloc()),
    BlocProvider(create: (context) => DocsBloc()),
    BlocProvider(create: (context) => MealFormBloc()),
    BlocProvider(create: (context) => SVGBloc()),
    BlocProvider(create: (context) => IngredientListBloc()),
    BlocProvider(create: (context) => IngredientFormBloc()),
    BlocProvider(create: (context) => ChefsListBloc()),
    BlocProvider(create: (context) => BasketFormBloc()),
    //
    BlocProvider(create: (context) => ProfileBloc()),
    BlocProvider(create: (context) => MealListBloc()),
    BlocProvider(create: (context) => DocsCubit()),
    BlocProvider(create: (context) => RegCubit()),
    BlocProvider(
        create: (context) => ScheduleBloc(scheduleRepo: ScheduleRepo())),
    BlocProvider(create: (context) => NavigatorBloc()),
  ];
  @override
  List<SingleChildWidget> get blocProviders => _providers;
}
