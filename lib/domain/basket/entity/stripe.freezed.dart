// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stripe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StripeModel _$StripeModelFromJson(Map<String, dynamic> json) {
  return _StripeModel.fromJson(json);
}

/// @nodoc
mixin _$StripeModel {
  String get id =>
      throw _privateConstructorUsedError; // required String object,
  int get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_capturable')
  int? get amountCapturable => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_received')
  int? get amountReceived =>
      throw _privateConstructorUsedError; // String? application,
// @JsonKey(name: 'application_fee_amount') String? applicationFeeAmount,
// @JsonKey(name: 'canceled_at') String? canceledAt,
// @JsonKey(name: 'cancellation_reason') String? cancellationReason,
// @JsonKey(name: 'capture_method') String? captureMethod,
  @JsonKey(name: 'client_secret')
  String get clientSecret => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirmation_method')
  String get confirmationMethod =>
      throw _privateConstructorUsedError; // required int created,
// required String currency,
// String? customer,
// String? description,
// String? invoice,
// @JsonKey(name: 'last_payment_error') String? lastPaymentError,
// @JsonKey(name: 'latest_charge') String? latestCharge,
  bool get livemode => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_action')
  dynamic get nextAction => throw _privateConstructorUsedError;
  @JsonKey(name: 'on_behalf_of')
  dynamic get onBehalfOf => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  dynamic get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method_configuration_details')
  dynamic get paymentMethodConfigurationDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method_options')
  Map<String, dynamic>? get paymentMethodOptions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method_types')
  List<String>? get paymentMethodTypes => throw _privateConstructorUsedError;
  dynamic get processing =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'receipt_email') String? receiptEmail,
  dynamic get review => throw _privateConstructorUsedError;
  @JsonKey(name: 'setup_future_usage')
  dynamic get setupFutureUsage => throw _privateConstructorUsedError;
  dynamic get shipping => throw _privateConstructorUsedError;
  dynamic get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'statement_descriptor')
  dynamic get statementDescriptor => throw _privateConstructorUsedError;
  @JsonKey(name: 'statement_descriptor_suffix')
  dynamic get statementDescriptorSuffix => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_data')
  dynamic get transferData => throw _privateConstructorUsedError;
  @JsonKey(name: 'transfer_group')
  dynamic get transferGroup => throw _privateConstructorUsedError;

  /// Serializes this StripeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StripeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StripeModelCopyWith<StripeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StripeModelCopyWith<$Res> {
  factory $StripeModelCopyWith(
          StripeModel value, $Res Function(StripeModel) then) =
      _$StripeModelCopyWithImpl<$Res, StripeModel>;
  @useResult
  $Res call(
      {String id,
      int amount,
      @JsonKey(name: 'amount_capturable') int? amountCapturable,
      @JsonKey(name: 'amount_received') int? amountReceived,
      @JsonKey(name: 'client_secret') String clientSecret,
      @JsonKey(name: 'confirmation_method') String confirmationMethod,
      bool livemode,
      Map<String, dynamic>? metadata,
      @JsonKey(name: 'next_action') dynamic nextAction,
      @JsonKey(name: 'on_behalf_of') dynamic onBehalfOf,
      @JsonKey(name: 'payment_method') dynamic paymentMethod,
      @JsonKey(name: 'payment_method_configuration_details')
      dynamic paymentMethodConfigurationDetails,
      @JsonKey(name: 'payment_method_options')
      Map<String, dynamic>? paymentMethodOptions,
      @JsonKey(name: 'payment_method_types') List<String>? paymentMethodTypes,
      dynamic processing,
      dynamic review,
      @JsonKey(name: 'setup_future_usage') dynamic setupFutureUsage,
      dynamic shipping,
      dynamic source,
      @JsonKey(name: 'statement_descriptor') dynamic statementDescriptor,
      @JsonKey(name: 'statement_descriptor_suffix')
      dynamic statementDescriptorSuffix,
      String status,
      @JsonKey(name: 'transfer_data') dynamic transferData,
      @JsonKey(name: 'transfer_group') dynamic transferGroup});
}

/// @nodoc
class _$StripeModelCopyWithImpl<$Res, $Val extends StripeModel>
    implements $StripeModelCopyWith<$Res> {
  _$StripeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StripeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? amountCapturable = freezed,
    Object? amountReceived = freezed,
    Object? clientSecret = null,
    Object? confirmationMethod = null,
    Object? livemode = null,
    Object? metadata = freezed,
    Object? nextAction = freezed,
    Object? onBehalfOf = freezed,
    Object? paymentMethod = freezed,
    Object? paymentMethodConfigurationDetails = freezed,
    Object? paymentMethodOptions = freezed,
    Object? paymentMethodTypes = freezed,
    Object? processing = freezed,
    Object? review = freezed,
    Object? setupFutureUsage = freezed,
    Object? shipping = freezed,
    Object? source = freezed,
    Object? statementDescriptor = freezed,
    Object? statementDescriptorSuffix = freezed,
    Object? status = null,
    Object? transferData = freezed,
    Object? transferGroup = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      amountCapturable: freezed == amountCapturable
          ? _value.amountCapturable
          : amountCapturable // ignore: cast_nullable_to_non_nullable
              as int?,
      amountReceived: freezed == amountReceived
          ? _value.amountReceived
          : amountReceived // ignore: cast_nullable_to_non_nullable
              as int?,
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
      confirmationMethod: null == confirmationMethod
          ? _value.confirmationMethod
          : confirmationMethod // ignore: cast_nullable_to_non_nullable
              as String,
      livemode: null == livemode
          ? _value.livemode
          : livemode // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      nextAction: freezed == nextAction
          ? _value.nextAction
          : nextAction // ignore: cast_nullable_to_non_nullable
              as dynamic,
      onBehalfOf: freezed == onBehalfOf
          ? _value.onBehalfOf
          : onBehalfOf // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentMethodConfigurationDetails: freezed ==
              paymentMethodConfigurationDetails
          ? _value.paymentMethodConfigurationDetails
          : paymentMethodConfigurationDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentMethodOptions: freezed == paymentMethodOptions
          ? _value.paymentMethodOptions
          : paymentMethodOptions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      paymentMethodTypes: freezed == paymentMethodTypes
          ? _value.paymentMethodTypes
          : paymentMethodTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      processing: freezed == processing
          ? _value.processing
          : processing // ignore: cast_nullable_to_non_nullable
              as dynamic,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as dynamic,
      setupFutureUsage: freezed == setupFutureUsage
          ? _value.setupFutureUsage
          : setupFutureUsage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      shipping: freezed == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as dynamic,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as dynamic,
      statementDescriptor: freezed == statementDescriptor
          ? _value.statementDescriptor
          : statementDescriptor // ignore: cast_nullable_to_non_nullable
              as dynamic,
      statementDescriptorSuffix: freezed == statementDescriptorSuffix
          ? _value.statementDescriptorSuffix
          : statementDescriptorSuffix // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      transferData: freezed == transferData
          ? _value.transferData
          : transferData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      transferGroup: freezed == transferGroup
          ? _value.transferGroup
          : transferGroup // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StripeModelImplCopyWith<$Res>
    implements $StripeModelCopyWith<$Res> {
  factory _$$StripeModelImplCopyWith(
          _$StripeModelImpl value, $Res Function(_$StripeModelImpl) then) =
      __$$StripeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int amount,
      @JsonKey(name: 'amount_capturable') int? amountCapturable,
      @JsonKey(name: 'amount_received') int? amountReceived,
      @JsonKey(name: 'client_secret') String clientSecret,
      @JsonKey(name: 'confirmation_method') String confirmationMethod,
      bool livemode,
      Map<String, dynamic>? metadata,
      @JsonKey(name: 'next_action') dynamic nextAction,
      @JsonKey(name: 'on_behalf_of') dynamic onBehalfOf,
      @JsonKey(name: 'payment_method') dynamic paymentMethod,
      @JsonKey(name: 'payment_method_configuration_details')
      dynamic paymentMethodConfigurationDetails,
      @JsonKey(name: 'payment_method_options')
      Map<String, dynamic>? paymentMethodOptions,
      @JsonKey(name: 'payment_method_types') List<String>? paymentMethodTypes,
      dynamic processing,
      dynamic review,
      @JsonKey(name: 'setup_future_usage') dynamic setupFutureUsage,
      dynamic shipping,
      dynamic source,
      @JsonKey(name: 'statement_descriptor') dynamic statementDescriptor,
      @JsonKey(name: 'statement_descriptor_suffix')
      dynamic statementDescriptorSuffix,
      String status,
      @JsonKey(name: 'transfer_data') dynamic transferData,
      @JsonKey(name: 'transfer_group') dynamic transferGroup});
}

/// @nodoc
class __$$StripeModelImplCopyWithImpl<$Res>
    extends _$StripeModelCopyWithImpl<$Res, _$StripeModelImpl>
    implements _$$StripeModelImplCopyWith<$Res> {
  __$$StripeModelImplCopyWithImpl(
      _$StripeModelImpl _value, $Res Function(_$StripeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StripeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? amountCapturable = freezed,
    Object? amountReceived = freezed,
    Object? clientSecret = null,
    Object? confirmationMethod = null,
    Object? livemode = null,
    Object? metadata = freezed,
    Object? nextAction = freezed,
    Object? onBehalfOf = freezed,
    Object? paymentMethod = freezed,
    Object? paymentMethodConfigurationDetails = freezed,
    Object? paymentMethodOptions = freezed,
    Object? paymentMethodTypes = freezed,
    Object? processing = freezed,
    Object? review = freezed,
    Object? setupFutureUsage = freezed,
    Object? shipping = freezed,
    Object? source = freezed,
    Object? statementDescriptor = freezed,
    Object? statementDescriptorSuffix = freezed,
    Object? status = null,
    Object? transferData = freezed,
    Object? transferGroup = freezed,
  }) {
    return _then(_$StripeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      amountCapturable: freezed == amountCapturable
          ? _value.amountCapturable
          : amountCapturable // ignore: cast_nullable_to_non_nullable
              as int?,
      amountReceived: freezed == amountReceived
          ? _value.amountReceived
          : amountReceived // ignore: cast_nullable_to_non_nullable
              as int?,
      clientSecret: null == clientSecret
          ? _value.clientSecret
          : clientSecret // ignore: cast_nullable_to_non_nullable
              as String,
      confirmationMethod: null == confirmationMethod
          ? _value.confirmationMethod
          : confirmationMethod // ignore: cast_nullable_to_non_nullable
              as String,
      livemode: null == livemode
          ? _value.livemode
          : livemode // ignore: cast_nullable_to_non_nullable
              as bool,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      nextAction: freezed == nextAction
          ? _value.nextAction
          : nextAction // ignore: cast_nullable_to_non_nullable
              as dynamic,
      onBehalfOf: freezed == onBehalfOf
          ? _value.onBehalfOf
          : onBehalfOf // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentMethodConfigurationDetails: freezed ==
              paymentMethodConfigurationDetails
          ? _value.paymentMethodConfigurationDetails
          : paymentMethodConfigurationDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentMethodOptions: freezed == paymentMethodOptions
          ? _value._paymentMethodOptions
          : paymentMethodOptions // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      paymentMethodTypes: freezed == paymentMethodTypes
          ? _value._paymentMethodTypes
          : paymentMethodTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      processing: freezed == processing
          ? _value.processing
          : processing // ignore: cast_nullable_to_non_nullable
              as dynamic,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as dynamic,
      setupFutureUsage: freezed == setupFutureUsage
          ? _value.setupFutureUsage
          : setupFutureUsage // ignore: cast_nullable_to_non_nullable
              as dynamic,
      shipping: freezed == shipping
          ? _value.shipping
          : shipping // ignore: cast_nullable_to_non_nullable
              as dynamic,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as dynamic,
      statementDescriptor: freezed == statementDescriptor
          ? _value.statementDescriptor
          : statementDescriptor // ignore: cast_nullable_to_non_nullable
              as dynamic,
      statementDescriptorSuffix: freezed == statementDescriptorSuffix
          ? _value.statementDescriptorSuffix
          : statementDescriptorSuffix // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      transferData: freezed == transferData
          ? _value.transferData
          : transferData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      transferGroup: freezed == transferGroup
          ? _value.transferGroup
          : transferGroup // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StripeModelImpl implements _StripeModel {
  const _$StripeModelImpl(
      {required this.id,
      required this.amount,
      @JsonKey(name: 'amount_capturable') this.amountCapturable,
      @JsonKey(name: 'amount_received') this.amountReceived,
      @JsonKey(name: 'client_secret') required this.clientSecret,
      @JsonKey(name: 'confirmation_method') required this.confirmationMethod,
      required this.livemode,
      final Map<String, dynamic>? metadata,
      @JsonKey(name: 'next_action') this.nextAction,
      @JsonKey(name: 'on_behalf_of') this.onBehalfOf,
      @JsonKey(name: 'payment_method') this.paymentMethod,
      @JsonKey(name: 'payment_method_configuration_details')
      this.paymentMethodConfigurationDetails,
      @JsonKey(name: 'payment_method_options')
      final Map<String, dynamic>? paymentMethodOptions,
      @JsonKey(name: 'payment_method_types')
      final List<String>? paymentMethodTypes,
      this.processing,
      this.review,
      @JsonKey(name: 'setup_future_usage') this.setupFutureUsage,
      this.shipping,
      this.source,
      @JsonKey(name: 'statement_descriptor') this.statementDescriptor,
      @JsonKey(name: 'statement_descriptor_suffix')
      this.statementDescriptorSuffix,
      required this.status,
      @JsonKey(name: 'transfer_data') this.transferData,
      @JsonKey(name: 'transfer_group') this.transferGroup})
      : _metadata = metadata,
        _paymentMethodOptions = paymentMethodOptions,
        _paymentMethodTypes = paymentMethodTypes;

  factory _$StripeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StripeModelImplFromJson(json);

  @override
  final String id;
// required String object,
  @override
  final int amount;
  @override
  @JsonKey(name: 'amount_capturable')
  final int? amountCapturable;
  @override
  @JsonKey(name: 'amount_received')
  final int? amountReceived;
// String? application,
// @JsonKey(name: 'application_fee_amount') String? applicationFeeAmount,
// @JsonKey(name: 'canceled_at') String? canceledAt,
// @JsonKey(name: 'cancellation_reason') String? cancellationReason,
// @JsonKey(name: 'capture_method') String? captureMethod,
  @override
  @JsonKey(name: 'client_secret')
  final String clientSecret;
  @override
  @JsonKey(name: 'confirmation_method')
  final String confirmationMethod;
// required int created,
// required String currency,
// String? customer,
// String? description,
// String? invoice,
// @JsonKey(name: 'last_payment_error') String? lastPaymentError,
// @JsonKey(name: 'latest_charge') String? latestCharge,
  @override
  final bool livemode;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'next_action')
  final dynamic nextAction;
  @override
  @JsonKey(name: 'on_behalf_of')
  final dynamic onBehalfOf;
  @override
  @JsonKey(name: 'payment_method')
  final dynamic paymentMethod;
  @override
  @JsonKey(name: 'payment_method_configuration_details')
  final dynamic paymentMethodConfigurationDetails;
  final Map<String, dynamic>? _paymentMethodOptions;
  @override
  @JsonKey(name: 'payment_method_options')
  Map<String, dynamic>? get paymentMethodOptions {
    final value = _paymentMethodOptions;
    if (value == null) return null;
    if (_paymentMethodOptions is EqualUnmodifiableMapView)
      return _paymentMethodOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<String>? _paymentMethodTypes;
  @override
  @JsonKey(name: 'payment_method_types')
  List<String>? get paymentMethodTypes {
    final value = _paymentMethodTypes;
    if (value == null) return null;
    if (_paymentMethodTypes is EqualUnmodifiableListView)
      return _paymentMethodTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final dynamic processing;
// @JsonKey(name: 'receipt_email') String? receiptEmail,
  @override
  final dynamic review;
  @override
  @JsonKey(name: 'setup_future_usage')
  final dynamic setupFutureUsage;
  @override
  final dynamic shipping;
  @override
  final dynamic source;
  @override
  @JsonKey(name: 'statement_descriptor')
  final dynamic statementDescriptor;
  @override
  @JsonKey(name: 'statement_descriptor_suffix')
  final dynamic statementDescriptorSuffix;
  @override
  final String status;
  @override
  @JsonKey(name: 'transfer_data')
  final dynamic transferData;
  @override
  @JsonKey(name: 'transfer_group')
  final dynamic transferGroup;

  @override
  String toString() {
    return 'StripeModel(id: $id, amount: $amount, amountCapturable: $amountCapturable, amountReceived: $amountReceived, clientSecret: $clientSecret, confirmationMethod: $confirmationMethod, livemode: $livemode, metadata: $metadata, nextAction: $nextAction, onBehalfOf: $onBehalfOf, paymentMethod: $paymentMethod, paymentMethodConfigurationDetails: $paymentMethodConfigurationDetails, paymentMethodOptions: $paymentMethodOptions, paymentMethodTypes: $paymentMethodTypes, processing: $processing, review: $review, setupFutureUsage: $setupFutureUsage, shipping: $shipping, source: $source, statementDescriptor: $statementDescriptor, statementDescriptorSuffix: $statementDescriptorSuffix, status: $status, transferData: $transferData, transferGroup: $transferGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StripeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.amountCapturable, amountCapturable) ||
                other.amountCapturable == amountCapturable) &&
            (identical(other.amountReceived, amountReceived) ||
                other.amountReceived == amountReceived) &&
            (identical(other.clientSecret, clientSecret) ||
                other.clientSecret == clientSecret) &&
            (identical(other.confirmationMethod, confirmationMethod) ||
                other.confirmationMethod == confirmationMethod) &&
            (identical(other.livemode, livemode) ||
                other.livemode == livemode) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            const DeepCollectionEquality()
                .equals(other.nextAction, nextAction) &&
            const DeepCollectionEquality()
                .equals(other.onBehalfOf, onBehalfOf) &&
            const DeepCollectionEquality()
                .equals(other.paymentMethod, paymentMethod) &&
            const DeepCollectionEquality().equals(
                other.paymentMethodConfigurationDetails,
                paymentMethodConfigurationDetails) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethodOptions, _paymentMethodOptions) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethodTypes, _paymentMethodTypes) &&
            const DeepCollectionEquality()
                .equals(other.processing, processing) &&
            const DeepCollectionEquality().equals(other.review, review) &&
            const DeepCollectionEquality()
                .equals(other.setupFutureUsage, setupFutureUsage) &&
            const DeepCollectionEquality().equals(other.shipping, shipping) &&
            const DeepCollectionEquality().equals(other.source, source) &&
            const DeepCollectionEquality()
                .equals(other.statementDescriptor, statementDescriptor) &&
            const DeepCollectionEquality().equals(
                other.statementDescriptorSuffix, statementDescriptorSuffix) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.transferData, transferData) &&
            const DeepCollectionEquality()
                .equals(other.transferGroup, transferGroup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        amount,
        amountCapturable,
        amountReceived,
        clientSecret,
        confirmationMethod,
        livemode,
        const DeepCollectionEquality().hash(_metadata),
        const DeepCollectionEquality().hash(nextAction),
        const DeepCollectionEquality().hash(onBehalfOf),
        const DeepCollectionEquality().hash(paymentMethod),
        const DeepCollectionEquality().hash(paymentMethodConfigurationDetails),
        const DeepCollectionEquality().hash(_paymentMethodOptions),
        const DeepCollectionEquality().hash(_paymentMethodTypes),
        const DeepCollectionEquality().hash(processing),
        const DeepCollectionEquality().hash(review),
        const DeepCollectionEquality().hash(setupFutureUsage),
        const DeepCollectionEquality().hash(shipping),
        const DeepCollectionEquality().hash(source),
        const DeepCollectionEquality().hash(statementDescriptor),
        const DeepCollectionEquality().hash(statementDescriptorSuffix),
        status,
        const DeepCollectionEquality().hash(transferData),
        const DeepCollectionEquality().hash(transferGroup)
      ]);

  /// Create a copy of StripeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StripeModelImplCopyWith<_$StripeModelImpl> get copyWith =>
      __$$StripeModelImplCopyWithImpl<_$StripeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StripeModelImplToJson(
      this,
    );
  }
}

abstract class _StripeModel implements StripeModel {
  const factory _StripeModel(
      {required final String id,
      required final int amount,
      @JsonKey(name: 'amount_capturable') final int? amountCapturable,
      @JsonKey(name: 'amount_received') final int? amountReceived,
      @JsonKey(name: 'client_secret') required final String clientSecret,
      @JsonKey(name: 'confirmation_method')
      required final String confirmationMethod,
      required final bool livemode,
      final Map<String, dynamic>? metadata,
      @JsonKey(name: 'next_action') final dynamic nextAction,
      @JsonKey(name: 'on_behalf_of') final dynamic onBehalfOf,
      @JsonKey(name: 'payment_method') final dynamic paymentMethod,
      @JsonKey(name: 'payment_method_configuration_details')
      final dynamic paymentMethodConfigurationDetails,
      @JsonKey(name: 'payment_method_options')
      final Map<String, dynamic>? paymentMethodOptions,
      @JsonKey(name: 'payment_method_types')
      final List<String>? paymentMethodTypes,
      final dynamic processing,
      final dynamic review,
      @JsonKey(name: 'setup_future_usage') final dynamic setupFutureUsage,
      final dynamic shipping,
      final dynamic source,
      @JsonKey(name: 'statement_descriptor') final dynamic statementDescriptor,
      @JsonKey(name: 'statement_descriptor_suffix')
      final dynamic statementDescriptorSuffix,
      required final String status,
      @JsonKey(name: 'transfer_data') final dynamic transferData,
      @JsonKey(name: 'transfer_group')
      final dynamic transferGroup}) = _$StripeModelImpl;

  factory _StripeModel.fromJson(Map<String, dynamic> json) =
      _$StripeModelImpl.fromJson;

  @override
  String get id; // required String object,
  @override
  int get amount;
  @override
  @JsonKey(name: 'amount_capturable')
  int? get amountCapturable;
  @override
  @JsonKey(name: 'amount_received')
  int? get amountReceived; // String? application,
// @JsonKey(name: 'application_fee_amount') String? applicationFeeAmount,
// @JsonKey(name: 'canceled_at') String? canceledAt,
// @JsonKey(name: 'cancellation_reason') String? cancellationReason,
// @JsonKey(name: 'capture_method') String? captureMethod,
  @override
  @JsonKey(name: 'client_secret')
  String get clientSecret;
  @override
  @JsonKey(name: 'confirmation_method')
  String get confirmationMethod; // required int created,
// required String currency,
// String? customer,
// String? description,
// String? invoice,
// @JsonKey(name: 'last_payment_error') String? lastPaymentError,
// @JsonKey(name: 'latest_charge') String? latestCharge,
  @override
  bool get livemode;
  @override
  Map<String, dynamic>? get metadata;
  @override
  @JsonKey(name: 'next_action')
  dynamic get nextAction;
  @override
  @JsonKey(name: 'on_behalf_of')
  dynamic get onBehalfOf;
  @override
  @JsonKey(name: 'payment_method')
  dynamic get paymentMethod;
  @override
  @JsonKey(name: 'payment_method_configuration_details')
  dynamic get paymentMethodConfigurationDetails;
  @override
  @JsonKey(name: 'payment_method_options')
  Map<String, dynamic>? get paymentMethodOptions;
  @override
  @JsonKey(name: 'payment_method_types')
  List<String>? get paymentMethodTypes;
  @override
  dynamic
      get processing; // @JsonKey(name: 'receipt_email') String? receiptEmail,
  @override
  dynamic get review;
  @override
  @JsonKey(name: 'setup_future_usage')
  dynamic get setupFutureUsage;
  @override
  dynamic get shipping;
  @override
  dynamic get source;
  @override
  @JsonKey(name: 'statement_descriptor')
  dynamic get statementDescriptor;
  @override
  @JsonKey(name: 'statement_descriptor_suffix')
  dynamic get statementDescriptorSuffix;
  @override
  String get status;
  @override
  @JsonKey(name: 'transfer_data')
  dynamic get transferData;
  @override
  @JsonKey(name: 'transfer_group')
  dynamic get transferGroup;

  /// Create a copy of StripeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StripeModelImplCopyWith<_$StripeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
