import 'package:dependencies/dependencies.dart';
import 'package:fpdart/fpdart.dart';
import 'package:common_code/core/failures.dart';
import 'package:common_code/core/use_cases.dart';
import 'package:common_code/domain/wallet/entity/wallet.dart';
import 'package:common_code/domain/wallet/use_case/get_wallet.dart';
import 'package:yumi/global.dart';

part 'wallet_cubit.freezed.dart';
part 'wallet_cubit.g.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState({required Wallet wallet, required bool isLoading}) =
      _WalletState;

  factory WalletState.initial() {
    return const WalletState(wallet: Wallet(), isLoading: false);
  }

  factory WalletState.fromJson(Map<String, dynamic> json) =>
      _$WalletStateFromJson(json);
}

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletState.initial());

  getWallet() async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final Either<Failure, Wallet> task = await GetWallet().call(NoParams());

    task.fold(
      (l) {
        emit(state.copyWith(isLoading: false));
        G().snackBar(l.toString());
      },
      (r) => emit(state.copyWith(wallet: r, isLoading: false)),
    );
  }
}
