part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState(
          {required PaginationHelper<NotificationS> pagination}) =
      _NotificationState;

  factory NotificationState.initial() {
    return NotificationState(
        pagination:
            const PaginationHelper<NotificationS>(data: <NotificationS>[]));
  }

  factory NotificationState.fromJson(Map<String, dynamic> json) =>
      _$NotificationStateFromJson(json);
}
