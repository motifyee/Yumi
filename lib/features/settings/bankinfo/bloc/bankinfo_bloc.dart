import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/util/status.dart';
import 'package:yumi/model/bankinfo_model.dart';
import 'package:yumi/features/settings/bankinfo/bankinfo_service.dart';

part 'bankinfo_event.dart';
part 'bankinfo_state.dart';

class BankInfoBloc extends Bloc<BankInfoEvent, BankInfoState> {
  BankInfoBloc() : super(const BankInfoState(banks: [])) {
    on<BankInfoInitEvent>(_initBankInfo);

    on<BankInfoAddEvent>(_addBankInfo);

    on<BankInfoUpdateEvent>(_updateBankInfo);

    on<BankInfoLoadingEvent>(
        (_, emit) => emit(state.copyWith(status: BlocStatus.loading)));

    on<BankInfoLoadedEvent>(
        (_, emit) => emit(state.copyWith(status: BlocStatus.loaded)));

    on<BankInfoFormSavedEvent>(_saveBankInfoForm);

    on<BankInfoFormResetEvent>(_resetBankInfoForm);
  }

  _initBankInfo(BankInfoInitEvent event, emit) async {
    emit(state.copyWith(status: BlocStatus.init));
    emit(state.copyWith(status: BlocStatus.loading));

    await BankInfoService.getBankInfo(context: event.context).then((banks) {
      final List<BankInfo> arr = [];

      for (var i = 0; i < banks.length; i++) {
        arr.add(BankInfo.fromJson(value: banks[i]));
      }

      emit(state.copyWith(banks: arr, status: BlocStatus.initSuccess));
    }).catchError(
      (error) => emit(state.copyWith(status: BlocStatus.initSuccess)),
    );
  }

  _addBankInfo(BankInfoAddEvent event, emit) async {
    emit(state.copyWith(status: BlocStatus.loading));

    await BankInfoService.updateBankInfo(
      context: event.context,
      data: event.bankInfo.toJson(),
    ).then((res) {
      emit(state.copyWith(status: BlocStatus.loaded));

      if (res == null || res == false) {
        emit(state.copyWith(status: BlocStatus.error));
      }

      emit(
        state.copyWith(
          status: BlocStatus.loaded,
          banks: [...state.banks, BankInfo.fromJson(value: res)],
        ),
      );
    }).catchError(
      (error) => emit(state.copyWith(status: BlocStatus.error)),
    );
  }

  _updateBankInfo(BankInfoUpdateEvent event, emit) async {
    emit(state.copyWith(status: BlocStatus.loading));

    await BankInfoService.addBankInfo(
      context: event.context,
      data: event.bankInfo.toJson(),
    ).then((res) {
      emit(state.copyWith(status: BlocStatus.loaded));

      if (res == null || res == false) {
        return emit(state.copyWith(status: BlocStatus.error));
      }

      emit(
        state.copyWith(
          status: BlocStatus.loaded,
          banks: [...state.banks, BankInfo.fromJson(value: res)],
        ),
      );
    }).catchError(
      (error) => emit(state.copyWith(status: BlocStatus.error)),
    );
  }

  _saveBankInfoForm(BankInfoFormSavedEvent event, emit) async {
    emit(
      state.copyWith(
        bankInfoForm: event.bankInfo,
        status: BlocStatus.formSaved,
      ),
    );
  }

  _resetBankInfoForm(BankInfoFormResetEvent event, emit) async {
    emit(
      state.copyWith(
        bankInfoForm: const BankInfo(),
        status: BlocStatus.formReset,
      ),
    );
  }
}
