// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StripeModelImpl _$$StripeModelImplFromJson(Map<String, dynamic> json) =>
    _$StripeModelImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toInt(),
      amountCapturable: (json['amount_capturable'] as num?)?.toInt(),
      amountReceived: (json['amount_received'] as num?)?.toInt(),
      clientSecret: json['client_secret'] as String,
      confirmationMethod: json['confirmation_method'] as String,
      currency: json['currency'] as String,
      livemode: json['livemode'] as bool,
      metadata: json['metadata'] as Map<String, dynamic>?,
      nextAction: json['next_action'],
      onBehalfOf: json['on_behalf_of'],
      paymentMethod: json['payment_method'],
      paymentMethodConfigurationDetails:
          json['payment_method_configuration_details'],
      paymentMethodOptions:
          json['payment_method_options'] as Map<String, dynamic>?,
      paymentMethodTypes: (json['payment_method_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      processing: json['processing'],
      review: json['review'],
      setupFutureUsage: json['setup_future_usage'],
      shipping: json['shipping'],
      source: json['source'],
      statementDescriptor: json['statement_descriptor'],
      statementDescriptorSuffix: json['statement_descriptor_suffix'],
      status: json['status'] as String,
      transferData: json['transfer_data'],
      transferGroup: json['transfer_group'],
    );

Map<String, dynamic> _$$StripeModelImplToJson(_$StripeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'amount_capturable': instance.amountCapturable,
      'amount_received': instance.amountReceived,
      'client_secret': instance.clientSecret,
      'confirmation_method': instance.confirmationMethod,
      'currency': instance.currency,
      'livemode': instance.livemode,
      'metadata': instance.metadata,
      'next_action': instance.nextAction,
      'on_behalf_of': instance.onBehalfOf,
      'payment_method': instance.paymentMethod,
      'payment_method_configuration_details':
          instance.paymentMethodConfigurationDetails,
      'payment_method_options': instance.paymentMethodOptions,
      'payment_method_types': instance.paymentMethodTypes,
      'processing': instance.processing,
      'review': instance.review,
      'setup_future_usage': instance.setupFutureUsage,
      'shipping': instance.shipping,
      'source': instance.source,
      'statement_descriptor': instance.statementDescriptor,
      'statement_descriptor_suffix': instance.statementDescriptorSuffix,
      'status': instance.status,
      'transfer_data': instance.transferData,
      'transfer_group': instance.transferGroup,
    };
