import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/pagination_helper.dart';

abstract class NotificationSource {
  Future<PaginationHelper<NotificationS>> loadNotifications(
      {required PaginationHelper<NotificationS> pagination});
}
