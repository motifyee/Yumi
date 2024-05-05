import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/pagination_helper.dart';

abstract class NotificationSource {
  Future<PaginationHelper<Notification>> loadNotifications(
      {required PaginationHelper<Notification> pagination});
}
