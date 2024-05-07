import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/domain/notification/entity/notification.dart';

class NotificationTypeConverter
    extends JsonConverter<NotificationTypeEnum, String> {
  const NotificationTypeConverter();

  @override
  NotificationTypeEnum fromJson(String json) {
    return NotificationTypeEnum.values.byName(json);
  }

  @override
  String toJson(NotificationTypeEnum object) {
    return object.name;
  }
}
