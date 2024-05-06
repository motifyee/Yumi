import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/domain/notification/entity/notificationType_converter.dart';
import 'package:yumi/extensions/datetime_toIso8601string_converter.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class NotificationS with _$Notification {
  const factory NotificationS({
    required String id,
    @NotificationTypeConverter() required NotificationTypeEnum notificationType,
    @DateTimeToIso8601StringConverter() required DateTime date,
    required String description,
    @JsonKey(name: 'type_ID') required int typeID,
    @JsonKey(name: 'driver_ID') String? driverID,
    @JsonKey(name: 'chef_ID') String? chefID,
    @JsonKey(name: 'client_ID') String? clientID,
    @JsonKey(name: 'employee_ID') int? employeeID,
  }) = _Notification;

  factory NotificationS.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}

enum NotificationTypeEnum {
  FinishOrder,
  PickupPreOrder,
  PickupOrder,
  DeliveryPreOrder,
  DeliveryOrder,
}
