import 'package:dependencies/dependencies.dart';

part 'stripe.freezed.dart';
part 'stripe.g.dart';

@freezed
class StripeModel with _$StripeModel {
  const factory StripeModel(
      {required String id,
      required String object,
      required int amount,
      @JsonKey(name: 'amount_capturable') int? amountCapturable,
      @JsonKey(name: 'amount_received') int? amountReceived,
      String? application,
      @JsonKey(name: 'application_fee_amount') String? applicationFeeAmount,
      @JsonKey(name: 'canceled_at') String? canceledAt,
      @JsonKey(name: 'cancellation_reason') String? cancellationReason,
      @JsonKey(name: 'capture_method') String? captureMethod,
      @JsonKey(name: 'client_secret') required String clientSecret,
      @JsonKey(name: 'confirmation_method') required String confirmationMethod,
      required int created,
      required String currency,
      String? customer,
      String? description,
      String? invoice,
      @JsonKey(name: 'last_payment_error') String? lastPaymentError,
      @JsonKey(name: 'latest_charge') String? latestCharge,
      required bool livemode,
      Map<String, dynamic>? metadata,
      @JsonKey(name: 'next_action') dynamic nextAction,
      @JsonKey(name: 'on_behalf_of') dynamic onBehalfOf,
      @JsonKey(name: 'payment_method') dynamic paymentMethod,
      @JsonKey(name: 'payment_method_configuration_details')
      String? paymentMethodConfigurationDetails,
      @JsonKey(name: 'payment_method_options')
      Map<String, dynamic>? paymentMethodOptions,
      @JsonKey(name: 'payment_method_types') List<String>? paymentMethodTypes,
      dynamic processing,
      @JsonKey(name: 'receipt_email') String? receiptEmail,
      dynamic review,
      @JsonKey(name: 'setup_future_usage') dynamic setupFutureUsage,
      dynamic shipping,
      dynamic source,
      @JsonKey(name: 'statement_descriptor') dynamic statementDescriptor,
      @JsonKey(name: 'statement_descriptor_suffix')
      dynamic statementDescriptorSuffix,
      required String status,
      @JsonKey(name: 'transfer_data') dynamic transferData,
      @JsonKey(name: 'transfer_group') dynamic transferGroup}) = _StripeModel;

  factory StripeModel.fromJson(Map<String, dynamic> json) =>
      _$StripeModelFromJson(json);
}
