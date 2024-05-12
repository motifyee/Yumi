import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/service/transactions_service.dart';

part 'transaction_cubit.freezed.dart';
part 'transaction_cubit.g.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState({
    List<Transaction>? transaction,
    bool? loading,
  }) = _TransactionState;

  factory TransactionState.fromJson(Map<String, dynamic> json) =>
      _$TransactionStateFromJson(json);
}

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionState());

  getAllTransactions({required String userId}) async {
    if (state.loading == true) return;
    emit(state.copyWith(loading: true));
    Response res = await TransactionsService.getAllTransactions(userId: userId);

    List<Transaction> transaction = res.data['data']
        .map<Transaction>((json) => Transaction.fromJson(json))
        .toList();

    emit(state.copyWith(loading: false, transaction: transaction));
  }
}
