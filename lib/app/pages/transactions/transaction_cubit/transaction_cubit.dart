import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/domain/transactions/use_case/get_all_transaction.dart';
import 'package:yumi/statics/pager.dart';

part 'transaction_cubit.freezed.dart';
part 'transaction_cubit.g.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState({required Pager<Transaction> pager}) =
      _TransactionState;

  factory TransactionState.initial() {
    return const TransactionState(pager: Pager(data: []));
  }

  factory TransactionState.fromJson(Map<String, dynamic> json) =>
      _$TransactionStateFromJson(json);
}

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionState.initial());

  getAllTransactions({required String userId}) async {
    if (state.pager.canRequest) {
      emit(state.copyWith(
          pager: state.pager.copyWith(isLoading: true) as Pager<Transaction>));

      final Either<Failure, Pager<Transaction>> task = await GetAllTransaction()
          .call(GetAllTransactionParams(pager: state.pager, userId: userId));
      task.fold((l) => null, (r) => emit(state.copyWith(pager: r)));
    }
  }
}
