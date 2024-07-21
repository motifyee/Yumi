import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/notification/data/repo/notification_repo.dart';
import 'package:common_code/domain/notification/entity/notification.dart';

class LoadNotification
    extends UseCase<PaginatedData<NotificationS>, LoadNotificationParams> {
  NotificationRepo notificationRepo;
  LoadNotification({NotificationRepo? notificationRepo})
      : notificationRepo = notificationRepo ?? getIt<NotificationRepo>();

  @override
  Future<Either<Failure, PaginatedData<NotificationS>>> call(
          LoadNotificationParams params) =>
      notificationRepo.loadNotification(pagination: params.pagination).run();
}

class LoadNotificationParams extends Params {
  final PaginatedData<NotificationS> pagination;

  LoadNotificationParams({required this.pagination});
  @override
  List<Object?> get props => [pagination];
}
