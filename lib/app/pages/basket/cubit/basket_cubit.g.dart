// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BasketStateImpl _$$BasketStateImplFromJson(Map<String, dynamic> json) =>
    _$BasketStateImpl(
      basket: Basket.fromJson(json['basket'] as Map<String, dynamic>),
      isPickUpOnly: json['isPickUpOnly'] as bool,
    );

Map<String, dynamic> _$$BasketStateImplToJson(_$BasketStateImpl instance) =>
    <String, dynamic>{
      'basket': instance.basket,
      'isPickUpOnly': instance.isPickUpOnly,
    };
