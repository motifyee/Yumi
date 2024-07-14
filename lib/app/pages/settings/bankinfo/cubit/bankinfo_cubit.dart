import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common_code/core/failures.dart';
import 'package:common_code/core/use_cases.dart';
import 'package:yumi/domain/bank_info/entities/bankinfo_model.dart';
import 'package:yumi/domain/bank_info/use_cases/add_bank_info.dart';
import 'package:yumi/domain/bank_info/use_cases/get_bank_info.dart';
import 'package:yumi/domain/bank_info/use_cases/update_bank_info.dart';

part 'bankinfo_cubit.freezed.dart';

@freezed
class BankInfoState with _$BankInfoState {
  const factory BankInfoState({
    @Default(BankInfo()) BankInfo bankInfo,
    @Default(BankInfo()) BankInfo bankInfoForm,
    @Default(false) bool isLoading,
    @Default('') String error,
  }) = _Initial;
}

class BankInfoCubit extends Cubit<BankInfoState> {
  BankInfoCubit() : super(const BankInfoState());

  Future<void> getBankInfo() async {
    emit(state.copyWith(isLoading: true, error: 'xz'));

    GetBankInfo().call(NoParams()).then(
          (v) => v.fold(
            (l) => emit(state.copyWith(
              error: l.toString(),
              isLoading: false,
            )),
            (r) => emit(
              state.copyWith(
                bankInfo: r,
                bankInfoForm: r,
                isLoading: false,
              ),
            ),
          ),
        );
  }

  Future<Either<Failure, String>> updateBankInfo() async {
    if (state.bankInfoForm.id.isEmpty) return await _addBankInfo();

    return await _updateBankInfo();
  }

  Future<Either<Failure, String>> _addBankInfo() async {
    emit(state.copyWith(isLoading: true));

    AddBankInfoParams params = AddBankInfoParams(state.bankInfoForm);
    final task = await AddBankInfo().call(params);

    emit(state.copyWith(isLoading: false));

    return task;
  }

  Future<Either<Failure, String>> _updateBankInfo() async {
    emit(state.copyWith(isLoading: true));

    final params = UpdateBankInfoParams(state.bankInfoForm);
    final task = await UpdateBankInfo().call(params);

    emit(state.copyWith(isLoading: false));

    return task;
  }

  void updateForm(BankInfo Function(BankInfo) update) => emit(
        state.copyWith(
          bankInfoForm: update(state.bankInfoForm),
        ),
      );

  void resetForm() {
    emit(state.copyWith(bankInfoForm: const BankInfo()));
  }
}
