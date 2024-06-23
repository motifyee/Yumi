import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/pager.dart';

abstract class NotificationSource {
  Future<Pager<NotificationS>> loadNotifications(
      {required Pager<NotificationS> pagination});
}
