import 'package:common_code/domain/notification/entity/notification.dart';
import 'package:dependencies/dependencies.dart';

class NotificationStatusConverter extends JsonConverter<YumiStatus, String> {
  const NotificationStatusConverter();
  @override
  YumiStatus fromJson(String json) {
    if (NotificationTypeEnum.values.asNameMap().containsKey(json)) {
      return YumiStatus.values.byName(json);
    }
    return YumiStatus.GeneralNotification;
  }

  @override
  String toJson(YumiStatus object) {
    return object.name;
  }
}
