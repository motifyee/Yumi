import 'package:dependencies/dependencies.dart';

part 'stripe.freezed.dart';
part 'stripe.g.dart';

@freezed
class StripeModel with _$StripeModel {
  const factory StripeModel({
    required String id,
    // required String object,
    required int amount,
    @JsonKey(name: 'amount_capturable') int? amountCapturable,
    @JsonKey(name: 'amount_received') int? amountReceived,
    // String? application,
    // @JsonKey(name: 'application_fee_amount') String? applicationFeeAmount,
    // @JsonKey(name: 'canceled_at') String? canceledAt,
    // @JsonKey(name: 'cancellation_reason') String? cancellationReason,
    // @JsonKey(name: 'capture_method') String? captureMethod,
    @JsonKey(name: 'client_secret') required String clientSecret,
    @JsonKey(name: 'confirmation_method') required String confirmationMethod,
    // required int created,
    required String currency,
    // String? customer,
    // String? description,
    // String? invoice,
    // @JsonKey(name: 'last_payment_error') String? lastPaymentError,
    // @JsonKey(name: 'latest_charge') String? latestCharge,
    required bool livemode,
    Map<String, dynamic>? metadata,
    @JsonKey(name: 'next_action') nextAction,
    @JsonKey(name: 'on_behalf_of') onBehalfOf,
    @JsonKey(name: 'payment_method') paymentMethod,
    @JsonKey(name: 'payment_method_configuration_details')
    paymentMethodConfigurationDetails,
    @JsonKey(name: 'payment_method_options')
    Map<String, dynamic>? paymentMethodOptions,
    @JsonKey(name: 'payment_method_types') List<String>? paymentMethodTypes,
    processing,
    // @JsonKey(name: 'receipt_email') String? receiptEmail,
    review,
    @JsonKey(name: 'setup_future_usage') setupFutureUsage,
    shipping,
    source,
    @JsonKey(name: 'statement_descriptor') statementDescriptor,
    @JsonKey(name: 'statement_descriptor_suffix') statementDescriptorSuffix,
    required String status,
    @JsonKey(name: 'transfer_data') transferData,
    @JsonKey(name: 'transfer_group') transferGroup,
  }) = _StripeModel;

  factory StripeModel.fromJson(Map<String, dynamic> json) =>
      _$StripeModelFromJson(json);
}
