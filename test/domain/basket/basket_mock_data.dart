import 'package:yumi/domain/basket/entity/basket.dart';

class BasketMockData {
  static const Basket oneItemBasketPickup = Basket(invoice: Invoice(), invoiceDetails: [InvoiceDetails(productVarintPrice: 999, quantity: '1')]);
}

class BasketExpectedData {
  static const Basket oneItemBasketPickup = Basket(invoice: Invoice(deliveryAreaPrice: 0, deliveryCostPrice: 0, invoiceTax: 74.93, totalPrice: 999, finalPrice: 1073.93), invoiceDetails: [InvoiceDetails(productVarintPrice: 999, quantity: '1')]);
}
