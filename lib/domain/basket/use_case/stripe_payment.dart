import 'package:common_code/common_code.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:common_code/util/global_context.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/domain/basket/entity/stripe.dart';
// import 'package:common_code/core/dio/stripe_interceptor.dart';

class StripePayment extends UseCase<bool, StripePaymentParams> {
  @override
  Future<Either<Failure, bool>> call(StripePaymentParams params) async {
    try {
      final clientSecret = await _getClientSecret(params);
      await _initPaymentSheet(clientSecret: clientSecret.clientSecret);
      await Stripe.instance.presentPaymentSheet();
      return const Right(true);
    } catch (error) {
      return Left(GenericFailure(error.toString()));
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
  APIClient.baseUrl = EndPoints.stripeApi;

  Response res = await APIClient().post(
    EndPoints.stripePaymentIntent,
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

Future<void> _initPaymentSheet({required String clientSecret}) async {
  await Stripe.instance.initPaymentSheet(
    paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: clientSecret,
      merchantDisplayName: StripeKeys.appName,
      customerId: GlobalContext().readCubit<UserCubit>()?.state.user.userName,
      appearance: PaymentSheetAppearance(
        shapes: PaymentSheetShape(borderRadius: 15),
        colors: PaymentSheetAppearanceColors(background: CommonColors.background, componentDivider: CommonColors.primary, icon: CommonColors.secondary),
      ),
    ),
  );
}
