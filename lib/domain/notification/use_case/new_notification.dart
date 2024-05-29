import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/pagination_helper.dart';

class NewNotification
    extends UseCase<PaginationHelper<NotificationS>, NewNotificationParams> {
  @override
  Future<Either<Failure, PaginationHelper<NotificationS>>> call(
      NewNotificationParams params) async {
    return Right(params.paginationHelper.copyWith(data: <NotificationS>[
      params.notificationS,
      ...params.paginationHelper.data,
    ]) as PaginationHelper<NotificationS>);
  }
}

class NewNotificationParams extends Params {
  final NotificationS notificationS;
  final PaginationHelper<NotificationS> paginationHelper;

  NewNotificationParams(
      {required this.notificationS, required this.paginationHelper});

  @override
  List<Object?> get props => [notificationS, paginationHelper];
}
