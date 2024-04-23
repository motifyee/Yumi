import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/model/bankinfo_model.dart';
import 'package:yumi/app/pages/settings/bankinfo/bankinfo_service.dart';

part 'bankinfo_event.dart';
part 'bankinfo_state.dart';

class BankInfoBloc extends Bloc<BankInfoEvent, BankInfoState> {
  BankInfoBloc() : super(const BankInfoState(banks: [])) {
    on<BankInfoInitEvent>(_initBankInfo);

    on<BankInfoAddEvent>(_addBankInfo);

    on<BankInfoUpdateEvent>(_updateBankInfo);

    on<BankInfoLoadingEvent>(
        (_, emit) => emit(state.copyWith(status: ObseleteStatusEnum.loading)));

    on<BankInfoLoadedEvent>(
        (_, emit) => emit(state.copyWith(status: ObseleteStatusEnum.idle)));

    on<BankInfoFormSavedEvent>(_saveBankInfoForm);

    on<BankInfoFormResetEvent>(_resetBankInfoForm);
  }

  _initBankInfo(BankInfoInitEvent event, emit) async {
    emit(state.copyWith(status: ObseleteStatusEnum.init));
    emit(state.copyWith(status: ObseleteStatusEnum.loading));

    await BankInfoService.getBankInfo(context: event.context).then((banks) {
      final List<BankInfo> arr = [];

      for (var i = 0; i < banks.length; i++) {
        arr.add(BankInfo.fromJson(banks[i]));
      }

      emit(state.copyWith(banks: arr, status: ObseleteStatusEnum.initSuccess));
    }).catchError(
      (error) => emit(state.copyWith(status: ObseleteStatusEnum.initSuccess)),
    );
  }

  _addBankInfo(BankInfoAddEvent event, emit) async {
    emit(state.copyWith(status: ObseleteStatusEnum.loading));

    await BankInfoService.updateBankInfo(
      context: event.context,
      data: event.bankInfo.toJson(),
    ).then((res) {
      emit(state.copyWith(status: ObseleteStatusEnum.idle));

      if (res == null || res == false) {
        emit(state.copyWith(status: ObseleteStatusEnum.error));
      }

      emit(
        state.copyWith(
          status: ObseleteStatusEnum.idle,
          banks: [...state.banks, BankInfo.fromJson(res)],
        ),
      );
    }).catchError(
      (error) => emit(state.copyWith(status: ObseleteStatusEnum.error)),
    );
  }

  _updateBankInfo(BankInfoUpdateEvent event, emit) async {
    emit(state.copyWith(status: ObseleteStatusEnum.loading));

    await BankInfoService.addBankInfo(
      context: event.context,
      data: event.bankInfo.toJson(),
    ).then((res) {
      emit(state.copyWith(status: ObseleteStatusEnum.idle));

      if (res == null || res == false) {
        return emit(state.copyWith(status: ObseleteStatusEnum.error));
      }

      emit(
        state.copyWith(
          status: ObseleteStatusEnum.idle,
          banks: [...state.banks, BankInfo.fromJson(res)],
        ),
      );
    }).catchError(
      (error) => emit(state.copyWith(status: ObseleteStatusEnum.error)),
    );
  }

  _saveBankInfoForm(BankInfoFormSavedEvent event, emit) async {
    emit(
      state.copyWith(
        bankInfoForm: event.bankInfo,
        status: ObseleteStatusEnum.formSaved,
      ),
    );
  }

  _resetBankInfoForm(BankInfoFormResetEvent event, emit) async {
    emit(
      state.copyWith(
        bankInfoForm: const BankInfo(),
        status: ObseleteStatusEnum.formReset,
      ),
    );
  }
}
