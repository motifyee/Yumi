import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/paginatedData.dart';

abstract class NotificationRepo {
  TaskEither<Failure, PaginatedData<NotificationS>> loadNotification(
      {required PaginatedData<NotificationS> pagination});
}
