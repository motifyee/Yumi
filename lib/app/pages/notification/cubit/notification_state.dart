part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState(
      {required Pagination<NotificationS> pagination,
      required bool isNewNotification}) = _NotificationState;

  factory NotificationState.initial() {
    return NotificationState(
      pagination: Pagination<NotificationS>(data: <NotificationS>[]),
      isNewNotification: false,
    );
  }

  factory NotificationState.fromJson(Map<String, dynamic> json) =>
      _$NotificationStateFromJson(json);
}
