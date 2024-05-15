import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/domain/wallet/entity/wallet.dart';
import 'package:yumi/service/wallet_service.dart';

part 'wallet_cubit.freezed.dart';
part 'wallet_cubit.g.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState({required Wallet wallet}) = _WalletState;

  factory WalletState.initial() {
    return const WalletState(wallet: Wallet());
  }

  factory WalletState.fromJson(Map<String, dynamic> json) =>
      _$WalletStateFromJson(json);
}

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletState.initial());

  getWallet() async {
    Response res = await WalletService.getWallet();
    emit(state.copyWith(wallet: Wallet.fromJson(res.data)));
  }
}
