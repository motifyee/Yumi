// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WalletStateImpl _$$WalletStateImplFromJson(Map<String, dynamic> json) =>
    _$WalletStateImpl(
      wallet: Wallet.fromJson(json['wallet'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool,
    );

Map<String, dynamic> _$$WalletStateImplToJson(_$WalletStateImpl instance) =>
    <String, dynamic>{
      'wallet': instance.wallet,
      'isLoading': instance.isLoading,
    };
