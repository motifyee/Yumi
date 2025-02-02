import 'package:common_code/common_code.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:common_code/util/global_context.dart';
import 'package:dependencies/fpdart.dart';
import 'package:dependencies/dependencies.dart';
import 'package:dependencies/stripe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/domain/basket/entity/stripe.dart';

class StripePayment extends UseCase<bool, StripePaymentParams> {
  @override
  Future<Either<Failure, bool>> call(StripePaymentParams params) async {
    try {
      final stripe = await _getClientSecret(params);

      await _initPaymentSheet(stripe: stripe);
      await Stripe.instance.presentPaymentSheet();

      return const Right(true);
    } catch (error) {
      return switch (error) {
        PlatformException _ => Left(GenericFailure(error.message)),
        StripeException _ => Left(GenericFailure(error.error.message)),
        _ => Left(GenericFailure(error.toString()))
      };
    }
  }
}

class StripePaymentParams extends Params {
  final double amount;
  final String currency;

  Map<String, dynamic> toJson() {
    return {'amount': (amount * 100).toStringAsFixed(0), 'currency': currency};
  }

  StripePaymentParams({required this.amount, required this.currency});
  @override
  List<Object?> get props => throw UnimplementedError();
}

Future<StripeModel> _getClientSecret(StripePaymentParams params) async {
  final baseUrl = APIClient.baseUrl;
  APIClient.baseUrl = Endpoints().stripeApi;

  final Response res = await APIClient().post(
    Endpoints().stripePaymentIntent,
    // options: Options(
    //   headers: {
    //     'Authorization': 'Bearer ${StripeKeys.secretKey}',
    //     'Content-Type': 'application/x-www-form-urlencoded'
    //   },
    // ),
    data: params.toJson(),
  );

  APIClient.baseUrl = baseUrl;

  return StripeModel.fromJson(res.data);
}

Future<void> _initPaymentSheet({required StripeModel stripe}) async {
  await Stripe.instance.initPaymentSheet(
    paymentSheetParameters: SetupPaymentSheetParameters(
      style: ThemeMode.light,
      allowsRemovalOfLastSavedPaymentMethod: true,
      removeSavedPaymentMethodMessage: 'removeSavedPaymentMethodMessage',
      // billingDetailsCollectionConfiguration: BillingDetailsCollectionConfiguration(name: CollectionMode.always, email: CollectionMode.always, attachDefaultsToPaymentMethod: true),
      setupIntentClientSecret: stripe.clientSecret,
      paymentIntentClientSecret: stripe.clientSecret,
      merchantDisplayName: StripeKeys.appName,
      customFlow: false,
      intentConfiguration: IntentConfiguration(
        mode: IntentMode.paymentMode(
          currencyCode: stripe.currency,
          amount: stripe.amount,
          setupFutureUsage: IntentFutureUsage.OffSession,
          captureMethod: CaptureMethod.AutomaticAsync,
        ),
      ),
      customerId: GlobalContext().readCubit<UserCubit>()?.state.user.userName,
      billingDetails: BillingDetails(
        name: GlobalContext().readCubit<UserCubit>()?.state.user.userName,
        email: GlobalContext().readCubit<UserCubit>()?.state.user.email,
      ),
      appearance: PaymentSheetAppearance(
        primaryButton: PaymentSheetPrimaryButtonAppearance(
          shapes: const PaymentSheetPrimaryButtonShape(blurRadius: 15),
          colors: PaymentSheetPrimaryButtonTheme(
            dark: PaymentSheetPrimaryButtonThemeColors(
              background: CommonColors.primary,
              border: CommonColors.primary,
              text: CommonColors.onPrimary,
            ),
            light: PaymentSheetPrimaryButtonThemeColors(
              background: CommonColors.primary,
              border: CommonColors.primary,
              text: CommonColors.onPrimary,
            ),
          ),
        ),
        shapes: PaymentSheetShape(
          borderRadius: 15,
          shadow: PaymentSheetShadowParams(
            color: CommonColors.secondary,
            opacity: .05,
          ),
          borderWidth: 0,
        ),
        colors: PaymentSheetAppearanceColors(
          background: CommonColors.background,
          componentDivider: CommonColors.secondary,
          icon: CommonColors.primary,
          componentBackground: CommonColors.background,
          componentBorder: CommonColors.secondary,
          componentText: CommonColors.secondary,
          error: CommonColors.primary,
          placeholderText: CommonColors.secondaryTant,
          primary: CommonColors.primary,
          primaryText: CommonColors.primary,
          secondaryText: CommonColors.secondary,
        ),
      ),
    ),
  );
}
