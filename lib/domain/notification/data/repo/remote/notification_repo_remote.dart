import 'package:fpdart/fpdart.dart';
import 'package:yumi/app/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/notification/data/repo/notification_repo.dart';
import 'package:yumi/domain/notification/data/source/notification_source.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/pagination_helper.dart';

class NotificationRepoRemote implements NotificationRepo {
  NotificationSource notificationSource;
  NotificationRepoRemote({NotificationSource? notificationSource})
      : notificationSource = notificationSource ?? getIt<NotificationSource>();
  @override
  TaskEither<Failure, PaginationHelper<NotificationS>> loadNotification(
          {required PaginationHelper<NotificationS> pagination}) =>
      TaskEither.tryCatch(
          () => notificationSource.loadNotifications(pagination: pagination),
          (error, stackTrace) => ServerFailure(error, stackTrace));
}
