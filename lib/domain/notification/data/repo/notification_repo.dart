import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/pagination.dart';

abstract class NotificationRepo {
  TaskEither<Failure, Pagination<NotificationS>> loadNotification(
      {required Pagination<NotificationS> pagination});
}
