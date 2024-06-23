import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/notification/data/repo/notification_repo.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/pagination.dart';

class LoadNotification
    extends UseCase<Pagination<NotificationS>, LoadNotificationParams> {
  NotificationRepo notificationRepo;
  LoadNotification({NotificationRepo? notificationRepo})
      : notificationRepo = notificationRepo ?? getIt<NotificationRepo>();

  @override
  Future<Either<Failure, Pagination<NotificationS>>> call(
          LoadNotificationParams params) =>
      notificationRepo.loadNotification(pagination: params.pagination).run();
}

class LoadNotificationParams extends Params {
  final Pagination<NotificationS> pagination;

  LoadNotificationParams({required this.pagination});
  @override
  List<Object?> get props => [pagination];
}
