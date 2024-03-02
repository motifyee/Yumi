part of 'bankinfo_form_bloc.dart';

@immutable
class BankInfoFormState extends Equatable {
  final BankInfo bankInfo;
  final bool loading;

  const BankInfoFormState({required this.bankInfo, this.loading = false});

  BankInfoFormState copyWith({BankInfo? bankInfo, bool? loading}) {
    return BankInfoFormState(
        bankInfo: bankInfo ?? this.bankInfo, loading: loading ?? this.loading);
  }

  @override
  List<Object?> get props => [bankInfo];
}
