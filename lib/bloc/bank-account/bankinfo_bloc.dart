import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/model/bankinfo_model.dart';
import 'package:yumi/service/bankinfo_service.dart';

part 'bankinfo_event.dart';
part 'bankinfo_state.dart';

class BankInfoBloc extends Bloc<BankInfoEvent, BankInfoState> {
  BankInfoBloc() : super(BankInfoState(banks: [BankInfo()])) {
    on<BankInfoEvent>((event, emit) async {
      final List<dynamic> banks =
          await BankInfoService.getBankInfo(context: event.context);

      final List<BankInfo> arr = [];
      for (var i = 0; i < banks.length; i++) {
        arr.add(BankInfo.fromJson(value: banks[i]));
      }

      emit(state.copyWith(banks: arr));
    });

    on<BankInfoAddEvent>((event, emit) async {
      state.banks.add(event.bankInfo);
      emit(state.copyWith(banks: state.banks));
    });
  }
}
