import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/domain/transactions/use_case/get_all_transaction.dart';
import 'package:yumi/statics/pagination.dart';

part 'transaction_cubit.freezed.dart';
part 'transaction_cubit.g.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState(
      {required Pagination<Transaction> pagination}) = _TransactionState;

  factory TransactionState.initial() {
    return TransactionState(pagination: const Pagination(data: []));
  }

  factory TransactionState.fromJson(Map<String, dynamic> json) =>
      _$TransactionStateFromJson(json);
}

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionState.initial());

  getAllTransactions({required String userId}) async {
    if (state.pagination.canRequest) {
      emit(state.copyWith(
          pagination: state.pagination.copyWith(isLoading: true)
              as Pagination<Transaction>));

      final Either<Failure, Pagination<Transaction>> task =
          await GetAllTransaction().call(GetAllTransactionParams(
              pagination: state.pagination, userId: userId));
      task.fold((l) => null, (r) => emit(state.copyWith(pagination: r)));
    }
  }
}
