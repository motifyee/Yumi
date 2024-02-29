import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:yumi/bloc/profile/profile_bloc.dart';
import 'package:yumi/model/bankinfo_model.dart';
import 'package:yumi/model/profile_model.dart';

part 'bankinfo_form_event.dart';
part 'bankinfo_form_state.dart';

class BankInfoFormBloc extends Bloc<BankInfoFormEvent, BankInfoFormState> {
  BankInfoFormBloc() : super(BankInfoFormState(bankInfo: BankInfo())) {
    on<BankInfoFormUpdateEvent>((event, emit) {
      emit(state.copyWith(bankInfo: event.bankInfo));
    });
  }
}
