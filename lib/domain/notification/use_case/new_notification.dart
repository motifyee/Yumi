import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/pagination.dart';

class NewNotification
    extends UseCase<Pagination<NotificationS>, NewNotificationParams> {
  @override
  Future<Either<Failure, Pagination<NotificationS>>> call(
      NewNotificationParams params) async {
    return Right(params.pagination.copyWith(data: <NotificationS>[
      params.notificationS,
      ...params.pagination.data,
    ]) as Pagination<NotificationS>);
  }
}

class NewNotificationParams extends Params {
  final NotificationS notificationS;
  final Pagination<NotificationS> pagination;

  NewNotificationParams(
      {required this.notificationS, required this.pagination});

  @override
  List<Object?> get props => [notificationS, pagination];
}
