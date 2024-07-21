import 'package:bloc/bloc.dart';
import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common_code/core/failures.dart';
import 'package:common_code/domain/notification/entity/notification.dart';
import 'package:common_code/domain/notification/use_case/load_notification.dart';
import 'package:common_code/domain/notification/use_case/new_notification.dart';

part 'notification_cubit.freezed.dart';
part 'notification_cubit.g.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState.initial());

  loadNotification() async {
    if (state.pagination.isLoading) return;
    emit(state.copyWith(
        pagination: state.pagination.copyWith(isLoading: true)
            as PaginatedData<NotificationS>));
    Either<Failure, PaginatedData<NotificationS>> task =
        await LoadNotification()
            .call(LoadNotificationParams(pagination: state.pagination));

    task.fold((l) => null,
        (r) => emit(state.copyWith(pagination: r, isNewNotification: false)));
  }

  newNotification(NotificationS notificationS) async {
    Either<Failure, PaginatedData<NotificationS>> task = await NewNotification()
        .call(NewNotificationParams(
            notificationS: notificationS, pagination: state.pagination));
    task.fold((l) => null,
        (r) => emit(state.copyWith(pagination: r, isNewNotification: true)));
  }

  resetNotification() {
    emit(NotificationState.initial());
  }
}
