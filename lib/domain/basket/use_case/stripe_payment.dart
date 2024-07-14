import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:common_code/core/failures.dart';
import 'package:common_code/core/use_cases.dart';
import 'package:fpdart/fpdart.dart';

class StripePayment extends UseCase<bool, bool> {
  @override
  Future<Either<Failure, bool>> call(bool params) async {
    // 1. create payment intent on the server
    final data = await _createTestPaymentSheet();

    // 2. initialize the payment sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Set to true for custom flow
        customFlow: false,
        // Main params
        merchantDisplayName: 'Flutter Stripe Store Demo',
        paymentIntentClientSecret: data['paymentIntent'],
        // Customer keys
        customerEphemeralKeySecret: data['ephemeralKey'],
        customerId: data['customer'],
        // Extra options
        applePay: const PaymentSheetApplePay(
          merchantCountryCode: 'US',
        ),
        googlePay: const PaymentSheetGooglePay(
          merchantCountryCode: 'US',
          testEnv: true,
        ),
        style: ThemeMode.dark,
      ),
    );
    await Stripe.instance.presentPaymentSheet();

    return const Right(true);
  }
}

Future<void> initPaymentSheet() async {}

_createTestPaymentSheet() {
  return {'paymentIntent': '', 'ephemeralKey': '', 'customer': ''};
}
