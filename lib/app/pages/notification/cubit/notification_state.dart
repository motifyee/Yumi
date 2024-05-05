part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState(
          {required PaginationHelper<Notification> pagination}) =
      _NotificationState;

  factory NotificationState.initial() {
    return NotificationState(
        pagination: const PaginationHelper<Notification>(data: []));
  }

  factory NotificationState.fromJson(Map<String, dynamic> json) =>
      _$NotificationStateFromJson(json);
}
