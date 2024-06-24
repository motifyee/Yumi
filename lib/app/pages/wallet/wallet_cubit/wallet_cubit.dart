import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/core/use_cases.dart';
import 'package:yumi/domain/wallet/entity/wallet.dart';
import 'package:yumi/domain/wallet/use_case/get_wallet.dart';
import 'package:yumi/global.dart';

part 'wallet_cubit.freezed.dart';
part 'wallet_cubit.g.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState({required Wallet wallet, required bool isLoading}) = _WalletState;

  factory WalletState.initial() {
    return const WalletState(wallet: Wallet(), isLoading: false);
  }

  factory WalletState.fromJson(Map<String, dynamic> json) => _$WalletStateFromJson(json);
}

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletState.initial());

  getWallet() async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final Either<Failure, Wallet> task = await GetWallet().call(NoParams());

    task.fold(
      (l) => G.snackBar((l.error as DioException).response?.data['message']),
      (r) => emit(state.copyWith(wallet: r, isLoading: false)),
    );
  }
}
