import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/setup/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/notification/data/repo/notification_repo.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/pager.dart';

class LoadNotification
    extends UseCase<Pager<NotificationS>, LoadNotificationParams> {
  NotificationRepo notificationRepo;
  LoadNotification({NotificationRepo? notificationRepo})
      : notificationRepo = notificationRepo ?? getIt<NotificationRepo>();

  @override
  Future<Either<Failure, Pager<NotificationS>>> call(
          LoadNotificationParams params) =>
      notificationRepo.loadNotification(pagination: params.pagination).run();
}

class LoadNotificationParams extends Params {
  final Pager<NotificationS> pagination;

  LoadNotificationParams({required this.pagination});
  @override
  List<Object?> get props => [pagination];
}
