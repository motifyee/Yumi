import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/paginatedData.dart';

class NewNotification
    extends UseCase<PaginatedData<NotificationS>, NewNotificationParams> {
  @override
  Future<Either<Failure, PaginatedData<NotificationS>>> call(
      NewNotificationParams params) async {
    return Right(params.pagination.copyWith(data: <NotificationS>[
      params.notificationS,
      ...params.pagination.data,
    ]) as PaginatedData<NotificationS>);
  }
}

class NewNotificationParams extends Params {
  final NotificationS notificationS;
  final PaginatedData<NotificationS> pagination;

  NewNotificationParams(
      {required this.notificationS, required this.pagination});

  @override
  List<Object?> get props => [notificationS, pagination];
}
