import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/failures.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/domain/transactions/use_case/get_all_transaction.dart';
import 'package:yumi/statics/pagination_helper.dart';

part 'transaction_cubit.freezed.dart';
part 'transaction_cubit.g.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState(
          {required PaginationHelper<Transaction> paginationHelper}) =
      _TransactionState;

  factory TransactionState.initial() {
    return TransactionState(paginationHelper: PaginationHelper(data: []));
  }

  factory TransactionState.fromJson(Map<String, dynamic> json) =>
      _$TransactionStateFromJson(json);
}

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionState.initial());

  getAllTransactions({required String userId}) async {
    if (state.paginationHelper.canRequest) {
      emit(state.copyWith(
          paginationHelper: state.paginationHelper.copyWith(isLoading: true)
              as PaginationHelper<Transaction>));

      final Either<Failure, PaginationHelper<Transaction>> task =
          await GetAllTransaction().call(GetAllTransactionParams(
              paginationHelper: state.paginationHelper, userId: userId));
      task.fold((l) => null, (r) => emit(state.copyWith(paginationHelper: r)));
    }
  }
}
