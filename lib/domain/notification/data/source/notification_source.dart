import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/paginatedData.dart';

abstract class NotificationSource {
  Future<PaginatedData<NotificationS>> loadNotifications(
      {required PaginatedData<NotificationS> pagination});
}
