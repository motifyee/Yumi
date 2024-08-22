import 'package:common_code/common_code.dart';
import 'package:common_code/domain/notification/entity/notificationStatus_converter.dart';
import 'package:dependencies/dependencies.dart';
import 'package:common_code/domain/notification/entity/notificationType_converter.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class NotificationS with _$NotificationS {
  const factory NotificationS({
    required String id,
    @NotificationTypeConverter() required NotificationTypeEnum notificationType,
    @NotificationStatusConverter() required YumiStatus yumiStatus,
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

enum YumiStatus {
  GeneralNotification,
  NewOrderReceived,
  DriverAccept,
  ChefAccept,
  ChefStart,
  ChefFinished,
  DriverReceived,
  ClientReceivedOrder,
  SystemCancelChefDelayed,
  SystemCancelDriverDelayed,
  DriverDelayedCustomerWaitDriverOrCancel,
  DriverPenalty,
  ChefPenalty,
  DriverBonus,
  CustomerBonus,
  CustomerRefund,
  ChefReceivedMoney,
  AccountApproved,
  ContractApproved,
  CustomerCancelChefDelayed,
  CustomerCancelDriverDelayed,
  CustomerWaitChefDelayed,
  CustomerWaitDriverDelayed,
  DriverReceivedMoney,
  SystemCancelNoDriverAccept,
}
