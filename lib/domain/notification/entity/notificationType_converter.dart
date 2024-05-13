import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/domain/notification/entity/notification.dart';

class NotificationTypeConverter
    extends JsonConverter<NotificationTypeEnum, String> {
  const NotificationTypeConverter();

  @override
  NotificationTypeEnum fromJson(String json) {
    if (NotificationTypeEnum.values.asNameMap().containsKey(json)) {
      return NotificationTypeEnum.values.byName(json);
    }
    return NotificationTypeEnum.GeneralNotification;
  }

  @override
  String toJson(NotificationTypeEnum object) {
    return object.name;
  }
}
