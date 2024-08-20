import 'package:common_code/common_code.dart';
import 'package:dependencies/dependencies.dart';
import 'package:common_code/domain/notification/entity/notificationType_converter.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class NotificationS with _$NotificationS {
  const factory NotificationS({
    required String id,
    @NotificationTypeConverter() required NotificationTypeEnum notificationType,
    @DateTimeToIso8601StringConverter() required DateTime createDate,
    required String description,
    @JsonKey(name: 'type_ID') int? typeID,
    @JsonKey(name: 'driver_ID') String? driverID,
    @JsonKey(name: 'chef_ID') String? chefID,
    @JsonKey(name: 'client_ID') String? clientID,
    @JsonKey(name: 'employee_ID') int? employeeID,
  }) = _NotificationS;

  factory NotificationS.fromJson(Map<String, dynamic> json) => _$NotificationSFromJson(json);
}

enum NotificationTypeEnum {
  GeneralNotification,
  DeliveryOrder,
  DeliveryPreOrder,
  PickupPreOrder,
  PickupOrder,
  FinishOrder,
  AccountApproved,
  AccountContractApproved,
}
