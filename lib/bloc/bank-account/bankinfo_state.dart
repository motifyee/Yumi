part of 'bankinfo_bloc.dart';

@immutable
class BankInfoState extends Equatable {
  final List<BankInfo> banks;

  const BankInfoState({required this.banks});

  BankInfoState copyWith({required List<BankInfo> banks}) {
    return BankInfoState(banks: banks);
  }

  @override
  List<Object?> get props => [banks];
}
