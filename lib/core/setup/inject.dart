import 'package:get_it/get_it.dart';
import 'package:yumi/core/setup/connection.dart';
import 'package:yumi/core/setup/internet_connectivity_checker.dart';
import 'package:yumi/domain/basket/data/repo/basket_repo.dart';
import 'package:yumi/domain/basket/data/repo/remote/basket_remote_repo.dart';
import 'package:yumi/domain/basket/data/source/basket_source.dart';
import 'package:yumi/domain/basket/data/source/remote/basket_remote_source.dart';
import 'package:yumi/domain/calories/data/repo/calories_repo.dart';
import 'package:yumi/domain/calories/data/repo/remote/calories_repo_remote.dart';
import 'package:yumi/domain/calories/data/source/calories_source.dart';
import 'package:yumi/domain/calories/data/source/remote/calories_source_remote.dart';
import 'package:yumi/domain/notification/data/repo/notification_repo.dart';
import 'package:yumi/domain/notification/data/repo/remote/notification_repo_remote.dart';
import 'package:yumi/domain/notification/data/source/notification_source.dart';
import 'package:yumi/domain/notification/data/source/remote/notification_source_remote.dart';
import 'package:yumi/domain/profile/data/repos/profile_repo.dart';
import 'package:yumi/domain/profile/data/repos/remote/profile_remote_repo.dart';
import 'package:yumi/domain/profile/data/sources/profile_source.dart';
import 'package:yumi/domain/profile/data/sources/remote/profile_remote_src.dart';
import 'package:yumi/domain/schedule/data/repos/remote/schedule_remote_repo.dart';
import 'package:yumi/domain/schedule/data/repos/schedule_repo.dart';
import 'package:yumi/domain/schedule/data/sources/remote/schedule_remote_source.dart';
import 'package:yumi/domain/schedule/data/sources/schedule_sources.dart';
import 'package:yumi/domain/transactions/data/repo/remote/transaction_repo_remote.dart';
import 'package:yumi/domain/transactions/data/repo/transaction_repo.dart';
import 'package:yumi/domain/transactions/data/source/remote/transaction_source_remote.dart';
import 'package:yumi/domain/transactions/data/source/transaction_source.dart';

final sl = GetIt.I; // sl == Service Locator
final getIt = sl.get;

void initGetItBase() {}

Future<void> inject() async {
  sl.registerFactory<ProfileRepo>(() => ProfileRemoteRepo(profileSrc: sl()));
  sl.registerFactory<ProfileSrc>(() => ProfileRemoteSrc());

  sl.registerFactory<ScheduleRepo>(() => ScheduleRemoteRepo());
  sl.registerFactory<ScheduleSrc>(() => ScheduleRemoteSrc());

  sl.registerFactory<CaloriesRepo>(
      () => CaloriesRepoRemote(caloriesSource: sl()));
  sl.registerFactory<CaloriesSource>(() => CaloriesSourceRemote());

  sl.registerFactory<BasketRepo>(() => BasketRemoteRepo());
  sl.registerFactory<BasketSource>(() => BasketRemoteSource());

  sl.registerFactory<NotificationRepo>(() => NotificationRepoRemote());
  sl.registerFactory<NotificationSource>(() => NotificationSourceRemote());

  sl.registerFactory<TransactionRepo>(() => TransactionRepoRemote());
  sl.registerFactory<TransactionSource>(() => TransactionSourceRemote());

  // Utils
  sl.registerLazySingleton<InternetChecker>(() => InternetChecker());
  sl.registerLazySingleton<Connection>(() => Connection());
}
