import 'package:fpdart/fpdart.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/pager.dart';

abstract class NotificationRepo {
  TaskEither<Failure, Pager<NotificationS>> loadNotification(
      {required Pager<NotificationS> pagination});
}
