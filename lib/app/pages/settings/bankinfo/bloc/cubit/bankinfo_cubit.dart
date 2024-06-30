import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/core/use_cases.dart';
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

  void getBankInfo() async {
    emit(state.copyWith(isLoading: true));

    (await GetBankInfo().call(NoParams())).fold(
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
    );
  }

  Future<String?> updateBankInfo() async {
    if (state.bankInfoForm.id.isEmpty) return await _addBankInfo();

    return await _updateBankInfo();
  }

  Future<String?> _addBankInfo() async {
    emit(state.copyWith(isLoading: true));

    AddBankInfoParams params = AddBankInfoParams(state.bankInfoForm);
    final task = await AddBankInfo().call(params);

    return task.fold(
      (l) {
        emit(state.copyWith(isLoading: false));
        return l.toString();
      },
      (r) {
        emit(state.copyWith(isLoading: false));
        return null;
      },
    );
  }

  Future<String?> _updateBankInfo() async {
    emit(state.copyWith(isLoading: true));

    final params = UpdateBankInfoParams(state.bankInfoForm);
    final task = await UpdateBankInfo().call(params);

    return task.fold(
      (l) {
        emit(state.copyWith(isLoading: false));
        return l.toString();
      },
      (r) {
        emit(state.copyWith(bankInfo: r, isLoading: false));
        return null;
      },
    );
  }

  void updateForm(BankInfo Function(BankInfo) update) => emit(
        state.copyWith(
          bankInfoForm: update(state.bankInfoForm),
        ),
      );

  void resetForm() {
    emit(const BankInfoState());
  }
}
