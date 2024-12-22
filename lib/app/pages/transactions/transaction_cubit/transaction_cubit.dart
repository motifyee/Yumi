import 'package:dependencies/dependencies.dart';
import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/domain/transactions/use_case/get_all_transaction.dart';
import 'package:yumi/global.dart';

part 'transaction_cubit.freezed.dart';
part 'transaction_cubit.g.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState({
    required PaginatedData<Transaction> pagination,
  }) = _TransactionState;

  factory TransactionState.initial() {
    return TransactionState(pagination: const PaginatedData(data: []));
  }

  factory TransactionState.fromJson(Map<String, dynamic> json) =>
      _$TransactionStateFromJson(json);
}

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionState.initial());

  getAllTransactions({required String userId}) async {
    if (state.pagination.canRequest) {
      emit(
        state.copyWith(
          pagination: state.pagination.copyWith(isLoading: true)
              as PaginatedData<Transaction>,
        ),
      );

      final Either<Failure, PaginatedData<Transaction>> task =
          await GetAllTransaction().call(
        GetAllTransactionParams(
          pagination: state.pagination,
          userId: userId,
        ),
      );
      task.fold(
        (l) => G().snackBar(l.toString()),
        (r) => emit(state.copyWith(pagination: r)),
      );
    }
  }
}
