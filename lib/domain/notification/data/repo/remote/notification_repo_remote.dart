import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/notification/data/repo/notification_repo.dart';
import 'package:yumi/domain/notification/data/source/notification_source.dart';
import 'package:yumi/domain/notification/entity/notification.dart';

class NotificationRepoRemote implements NotificationRepo {
  NotificationSource notificationSource;
  NotificationRepoRemote({NotificationSource? notificationSource})
      : notificationSource = notificationSource ?? getIt<NotificationSource>();
  @override
  TaskEither<Failure, PaginatedData<NotificationS>> loadNotification(
          {required PaginatedData<NotificationS> pagination}) =>
      TaskEither.tryCatch(
          () => notificationSource.loadNotifications(pagination: pagination),
          (error, stackTrace) => ServerFailure(error.toString()));
}
