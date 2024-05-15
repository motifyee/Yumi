import 'package:fpdart/src/either.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/basket/entity/basket.dart';

class UpdateScheduleInBasket
    extends UseCase<Basket, UpdateScheduleInBasketParams> {
  @override
  Future<Either<Failure, Basket>> call(
      UpdateScheduleInBasketParams params) async {
    DateTime scheduleDate = params.date ??
        params.basket.invoice.scheduleDate ??
        DateTime.now().add(const Duration(days: 1));
    if (params.time != null) {
      scheduleDate = scheduleDate.copyWith(
        hour: int.parse(params.time!.split(":")[0]),
        minute: int.parse(params.time!.split(":")[1]),
      );
    }

    if ((scheduleDate).difference(DateTime.now()).inHours < 24) {
      scheduleDate = DateTime.now().add(const Duration(days: 1));
    }

    return Right(params.basket.copyWith(
        invoice: params.basket.invoice.copyWith(scheduleDate: scheduleDate)));
  }
}

class UpdateScheduleInBasketParams extends Params {
  final DateTime? date;
  final String? time;
  final Basket basket;

  UpdateScheduleInBasketParams(
      {required this.date, required this.time, required this.basket});

  @override
  List<Object?> get props => [date, time, basket];
}
