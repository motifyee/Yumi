import 'basket/basket_mock_data.dart';
import 'basket/use_case/calc_basket_spec.dart';

class DomainSpec {
  static unitTest() {
    // basket test
    CalcBasketSpec().unitTest(
        params: CalcBasketSpecParams(
            mockBasket: BasketMockData.oneItemBasketPickup,
            expectedBasket: BasketExpectedData.oneItemBasketPickup));
  }
}
