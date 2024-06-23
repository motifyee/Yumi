import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/pagination.dart';

abstract class NotificationSource {
  Future<Pagination<NotificationS>> loadNotifications(
      {required Pagination<NotificationS> pagination});
}
