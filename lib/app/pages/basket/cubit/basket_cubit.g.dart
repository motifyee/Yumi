// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasketStateImpl _$$BasketStateImplFromJson(Map<String, dynamic> json) =>
    _$BasketStateImpl(
      basket: Basket.fromJson(json['basket'] as Map<String, dynamic>),
      paymentType: $enumDecode(_$PaymentOptionEnumMap, json['paymentType']),
    );

Map<String, dynamic> _$$BasketStateImplToJson(_$BasketStateImpl instance) =>
    <String, dynamic>{
      'basket': instance.basket,
      'paymentType': _$PaymentOptionEnumMap[instance.paymentType]!,
    };

const _$PaymentOptionEnumMap = {
  PaymentOption.visa: 'visa',
  PaymentOption.wallet: 'wallet',
  PaymentOption.paypal: 'paypal',
};
