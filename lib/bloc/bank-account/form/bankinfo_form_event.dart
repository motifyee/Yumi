part of 'bankinfo_form_bloc.dart';

@immutable
abstract class BankInfoFormEvent {}

class BankInfoFormUpdateEvent implements BankInfoFormEvent {
  final BankInfo bankInfo;

  const BankInfoFormUpdateEvent({required this.bankInfo});
}

class ProfileFormResetEvent implements BankInfoFormEvent {
  final BankInfo bankInfo;

  const ProfileFormResetEvent({required this.bankInfo});
}
