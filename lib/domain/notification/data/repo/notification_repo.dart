import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/pagination_helper.dart';

abstract class NotificationRepo {
  TaskEither<Failure, PaginationHelper<Notification>> loadNotification(
      {required PaginationHelper<Notification> pagination});
}
