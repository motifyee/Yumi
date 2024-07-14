import 'package:common_code/common_code.dart';
import 'package:yumi/domain/notification/entity/notification.dart';

abstract class NotificationSource {
  Future<PaginatedData<NotificationS>> loadNotifications(
      {required PaginatedData<NotificationS> pagination});
}
