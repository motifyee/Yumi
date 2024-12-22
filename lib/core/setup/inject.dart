import 'package:common_code/common_code.dart';
import 'package:common_code/core/setup/connection.dart';
import 'package:common_code/core/setup/internet_connectivity_checker.dart';
import 'package:common_code/domain/bank_info/data/repos/bank_info_repo.dart';
import 'package:common_code/domain/bank_info/data/repos/remote/bank_info_remote_repo.dart';
import 'package:common_code/domain/bank_info/data/sources/bank_info_src.dart';
import 'package:common_code/domain/bank_info/data/sources/remote/bank_info_remote_src.dart';
import 'package:yumi/domain/address/data/repo/address_repo.dart';
import 'package:yumi/domain/address/data/repo/remote/address_remote_repo.dart';
import 'package:yumi/domain/address/data/source/address_source.dart';
import 'package:yumi/domain/address/data/source/remote/address_remote_source.dart';
import 'package:yumi/domain/basket/data/repo/basket_repo.dart';
import 'package:yumi/domain/basket/data/repo/remote/basket_remote_repo.dart';
import 'package:yumi/domain/basket/data/source/basket_source.dart';
import 'package:yumi/domain/basket/data/source/remote/basket_remote_source.dart';
import 'package:common_code/domain/food_delivery/calories/data/repo/calories_repo.dart';
import 'package:common_code/domain/food_delivery/calories/data/repo/remote/calories_repo_remote.dart';
import 'package:common_code/domain/food_delivery/calories/data/source/calories_source.dart';
import 'package:common_code/domain/food_delivery/calories/data/source/remote/calories_source_remote.dart';
import 'package:common_code/domain/food_delivery/categories/data/repo/categories_repo.dart';
import 'package:common_code/domain/food_delivery/categories/data/repo/remote/categories_remote_repo.dart';
import 'package:common_code/domain/food_delivery/categories/data/source/categories_src.dart';
import 'package:common_code/domain/food_delivery/categories/data/source/remote/categories_remote_src.dart';
import 'package:common_code/domain/food_delivery/chef/data/respositories/chef_repo.dart';
import 'package:common_code/domain/food_delivery/chef/data/respositories/remote/chef_remote_repo.dart';
import 'package:common_code/domain/food_delivery/chef/data/sources/chef_src.dart';
import 'package:common_code/domain/food_delivery/chef/data/sources/remote/chef_remote_src.dart';
import 'package:common_code/domain/food_delivery/meal/data/repo/meal_repo.dart';
import 'package:common_code/domain/food_delivery/meal/data/repo/remote/meal_repo_remote.dart';
import 'package:common_code/domain/food_delivery/meal/data/source/meal_source.dart';
import 'package:common_code/domain/food_delivery/meal/data/source/remote/meal_source_remote.dart';
import 'package:common_code/domain/notification/data/repo/notification_repo.dart';
import 'package:common_code/domain/notification/data/repo/remote/notification_repo_remote.dart';
import 'package:common_code/domain/notification/data/source/notification_source.dart';
import 'package:common_code/domain/notification/data/source/remote/notification_source_remote.dart';
import 'package:common_code/domain/food_delivery/order/data/repo/order_repo.dart';
import 'package:common_code/domain/food_delivery/order/data/repo/remote/order_repo_remote.dart';
import 'package:common_code/domain/food_delivery/order/data/source/order_source.dart';
import 'package:common_code/domain/food_delivery/order/data/source/remote/order_source_remote.dart';
import 'package:common_code/domain/profile/data/repos/profile_repo.dart';
import 'package:common_code/domain/profile/data/repos/remote/profile_remote_repo.dart';
import 'package:common_code/domain/profile/data/sources/profile_source.dart';
import 'package:common_code/domain/profile/data/sources/remote/profile_remote_src.dart';
import 'package:common_code/domain/schedule/data/repos/remote/schedule_remote_repo.dart';
import 'package:common_code/domain/schedule/data/repos/schedule_repo.dart';
import 'package:common_code/domain/schedule/data/sources/remote/schedule_remote_source.dart';
import 'package:common_code/domain/schedule/data/sources/schedule_sources.dart';
import 'package:yumi/domain/ingredients/data/repo/ingredients_repo.dart';
import 'package:yumi/domain/ingredients/data/repo/remote/ingredients_remote_repo.dart';
import 'package:yumi/domain/ingredients/data/source/ingredients_source.dart';
import 'package:yumi/domain/ingredients/data/source/remote/ingredients_remote_source.dart';
import 'package:yumi/domain/review/data/repo/remote/review_remote_repo.dart';
import 'package:yumi/domain/review/data/repo/review_repo.dart';
import 'package:yumi/domain/review/data/source/remote/review_remote_source.dart';
import 'package:yumi/domain/review/data/source/review_source.dart';
import 'package:yumi/domain/transactions/data/repo/remote/transaction_repo_remote.dart';
import 'package:yumi/domain/transactions/data/repo/transaction_repo.dart';
import 'package:yumi/domain/transactions/data/source/remote/transaction_source_remote.dart';
import 'package:yumi/domain/transactions/data/source/transaction_source.dart';
import 'package:common_code/domain/vehicle/data/repos/remote/vehicle_remote_repo.dart';
import 'package:common_code/domain/vehicle/data/repos/vehicle_repo.dart';
import 'package:common_code/domain/vehicle/data/sources/remote/vehicle_remote_src.dart';
import 'package:common_code/domain/vehicle/data/sources/vehicle_src.dart';
import 'package:common_code/domain/wallet/data/repo/remote/wallet_repo_remote.dart';
import 'package:common_code/domain/wallet/data/repo/wallet_repo.dart';
import 'package:common_code/domain/wallet/data/source/remote/wallet_source_remote.dart';
import 'package:common_code/domain/wallet/data/source/wallet_source.dart';

void initGetItBase() {}

Future<void> inject() async {
  sl.registerFactory<ProfileSrc>(() => ProfileRemoteSrc());
  sl.registerFactory<ProfileRepo>(() => ProfileRemoteRepo(profileSrc: sl()));

  sl.registerFactory<ScheduleSrc>(() => ScheduleRemoteSrc());
  sl.registerFactory<ScheduleRepo>(() => ScheduleRemoteRepo());

  sl.registerFactory<CaloriesSource>(() => CaloriesRemoteSource());
  sl.registerFactory<CaloriesRepo>(
    () => CaloriesRepoRemote(caloriesSource: sl()),
  );

  sl.registerFactory<BasketSource>(() => BasketRemoteSource());
  sl.registerFactory<BasketRepo>(() => BasketRemoteRepo());

  sl.registerFactory<NotificationSource>(() => NotificationSourceRemote());
  sl.registerFactory<NotificationRepo>(() => NotificationRepoRemote());

  sl.registerFactory<TransactionSource>(() => TransactionSourceRemote());
  sl.registerFactory<TransactionRepo>(() => TransactionRepoRemote());

  sl.registerFactory<ChefSrc>(() => ChefRemoteSrc());
  sl.registerFactory<ChefRepo>(() => ChefRemoteRepo(src: sl()));

  sl.registerFactory<OrderRepo>(() => OrderRepoRemote());
  sl.registerFactory<OrderSource>(() => OrderSourceRemote());

  sl.registerFactory<WalletRepo>(() => WalletRepoRemote());
  sl.registerFactory<WalletSource>(() => WalletSourceRemote());

  sl.registerFactory<CategoriesSrc>(() => CategoriesRemoteSrc());
  sl.registerFactory<CategoriesRepo>(
    () => CategoriesRemoteRepo(
      categoriesSrc: sl(),
    ),
  );
  sl.registerFactory<MealRepo>(() => MealRepoRemote());
  sl.registerFactory<MealSource>(() => MealSourceRemote());

  sl.registerFactory<AuthSrc>(() => AuthRemoteSrc());
  sl.registerFactory<AuthRepo>(() => AuthRemoteRepo(src: sl()));

  sl.registerFactory<BankInfoSrc>(() => BankInfoRemoteSrc());
  sl.registerFactory<BankInfoRepo>(() => BankInfoRemoteRepo(src: sl()));

  sl.registerFactory<VehicleSrc>(() => VehicleRemoteSrc());
  sl.registerFactory<VehicleRepo>(() => VehicleRemoteRepo(src: sl()));

  sl.registerFactory<ReviewSource>(() => ReviewRemoteSource());
  sl.registerFactory<ReviewRepo>(() => ReviewRemoteRepo());

  sl.registerFactory<IngredientsSource>(() => IngredientsRemoteSource());
  sl.registerFactory<IngredientsRepo>(() => IngredientsRemoteRepo());

  sl.registerFactory<AddressRepo>(() => AddressRemoteRepo());
  sl.registerFactory<AddressSource>(() => AddressRemoteSource());

  // Utils
  sl.registerLazySingleton<InternetChecker>(() => InternetChecker());
  sl.registerLazySingleton<Connection>(() => Connection());
}
