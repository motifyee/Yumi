import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/notification/entity/notification.dart';
import 'package:yumi/statics/pager.dart';

class NewNotification
    extends UseCase<Pager<NotificationS>, NewNotificationParams> {
  @override
  Future<Either<Failure, Pager<NotificationS>>> call(
      NewNotificationParams params) async {
    return Right(params.pager.copyWith(data: <NotificationS>[
      params.notificationS,
      ...params.pager.data,
    ]) as Pager<NotificationS>);
  }
}

class NewNotificationParams extends Params {
  final NotificationS notificationS;
  final Pager<NotificationS> pager;

  NewNotificationParams({required this.notificationS, required this.pager});

  @override
  List<Object?> get props => [notificationS, pager];
}
