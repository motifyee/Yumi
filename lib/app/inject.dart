import 'package:get_it/get_it.dart';
import 'package:yumi/domain/basket/data/repo/basket_repo.dart';
import 'package:yumi/domain/basket/data/repo/remote/basket_remote_repo.dart';
import 'package:yumi/domain/basket/data/source/basket_source.dart';
import 'package:yumi/domain/basket/data/source/remote/basket_remote_source.dart';
import 'package:yumi/domain/calories/data/repo/calories_repo.dart';
import 'package:yumi/domain/calories/data/repo/remote/calories_repo_remote.dart';
import 'package:yumi/domain/calories/data/source/calories_source.dart';
import 'package:yumi/domain/calories/data/source/remote/calories_source_remote.dart';
import 'package:yumi/domain/profile/data/repos/profile_repo.dart';
import 'package:yumi/domain/profile/data/repos/remote/profile_remote_repo.dart';
import 'package:yumi/domain/profile/data/sources/profile_source.dart';
import 'package:yumi/domain/profile/data/sources/remote/profile_remote_src.dart';
import 'package:yumi/domain/schedule/data/repos/remote/schedule_remote_repo.dart';
import 'package:yumi/domain/schedule/data/repos/schedule_repo.dart';
import 'package:yumi/domain/schedule/data/sources/remote/schedule_remote_source.dart';
import 'package:yumi/domain/schedule/data/sources/schedule_sources.dart';

// get_it -> dependency injection, allocates resources app wide
// view_it -> state management using get_it

// getx -> state management, routing, .....
// get

// Provider
// Riverpod
// Bloc/Cubit

final sl = GetIt.I; // sl == Service Locator
final getIt = sl.get;

void initGetItBase() {}

Future<void> init() async {
  // instantianes a new instance of ProfileRepo each time it is called
  sl.registerFactory<ProfileRepo>(() => ProfileRemoteRepo(profileSrc: sl()));
  sl.registerFactory<ProfileSrc>(() => ProfileRemoteSrc());

  sl.registerFactory<ScheduleRepo>(() => ScheduleRemoteRepo());
  sl.registerFactory<ScheduleSrc>(() => ScheduleRemoteSrc());

  sl.registerFactory<CaloriesRepo>(
      () => CaloriesRepoRemote(caloriesSource: sl()));
  sl.registerFactory<CaloriesSource>(() => CaloriesSourceRemote());

  sl.registerFactory<BasketRepo>(() => BasketRemoteRepo());
  sl.registerFactory<BasketSource>(() => BasketRemoteSource());

  // instantianes a new instance of ProfileRepo first time it is called
  // saves the instance for future Use

  // getIt<UserState>();
  // sl.registerLazySingleton<UserState>(() => G.read<UserBloc>().state);
  // sl.registerFactory<UserState>(() => G.read<UserBloc>().state);
}
