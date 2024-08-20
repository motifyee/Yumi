import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:common_code/core/failures.dart';
import 'package:yumi/domain/basket/entity/basket.dart';
import 'package:yumi/domain/basket/use_case/calc_basket.dart';

import '../../test_case.dart';

class CalcBasketSpecParams extends TestParams {
  final Basket mockBasket;
  final Basket expectedBasket;

  CalcBasketSpecParams(
      {required this.mockBasket, required this.expectedBasket});

  @override
  List<Object?> get props => [mockBasket, expectedBasket];
}

class CalcBasketSpec implements TestCase<CalcBasketSpecParams> {
  @override
  integrationTest({required CalcBasketSpecParams params}) {
    // TODO: implement integrationTest
    throw UnimplementedError();
  }

  @override
  unitTest({required CalcBasketSpecParams params}) {
    group(
      'Calc Basket',
      () {
        test(
          'one item basket',
          () async {
            final Either<Failure, Basket> task = await CalcBasket()
                .call(CalcBasketParams(basket: params.mockBasket));
            task.fold(
              (l) => expect(1, 2),
              (r) => expect(r, params.expectedBasket),
            );
          },
        );
      },
    );
  }

  @override
  widgetTest({required CalcBasketSpecParams params}) {
    // TODO: implement widgetTest
    throw UnimplementedError();
  }
}
