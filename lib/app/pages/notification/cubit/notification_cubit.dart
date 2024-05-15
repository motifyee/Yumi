import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/domain/notification/use_case/load_notification.dart';
import 'package:yumi/statics/pagination_helper.dart';

part 'notification_cubit.freezed.dart';
part 'notification_cubit.g.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState.initial());

  loadNotification() async {
    if (state.pagination.isLoading) return;
    emit(state.copyWith(
        pagination: state.pagination.copyWith(isLoading: true)
            as PaginationHelper<NotificationS>));
    Either<Failure, PaginationHelper<NotificationS>> task =
        await LoadNotification()
            .call(LoadNotificationParams(pagination: state.pagination));

    task.fold((l) => null, (r) => emit(state.copyWith(pagination: r)));
  }
}
