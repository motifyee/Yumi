import 'package:fpdart/fpdart.dart';
import 'package:yumi/app/inject.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/notification/data/repo/notification_repo.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/pagination_helper.dart';

class LoadNotification
    extends UseCase<PaginationHelper<Notification>, LoadNotificationParams> {
  NotificationRepo notificationRepo;
  LoadNotification({NotificationRepo? notificationRepo})
      : notificationRepo = notificationRepo ?? getIt<NotificationRepo>();

  @override
  Future<Either<Failure, PaginationHelper<Notification>>> call(
          LoadNotificationParams params) =>
      notificationRepo.loadNotification(pagination: params.pagination).run();
}

class LoadNotificationParams extends Params {
  final PaginationHelper<Notification> pagination;

  LoadNotificationParams({required this.pagination});
  @override
  List<Object?> get props => [pagination];
}
