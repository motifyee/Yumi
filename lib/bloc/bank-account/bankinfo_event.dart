part of 'bankinfo_bloc.dart';

@immutable
class BankInfoEvent {
  final BuildContext context;
  const BankInfoEvent({required this.context});
}

class BankInfoAddEvent implements BankInfoEvent {
  @override
  final BuildContext context;
  final BankInfo bankInfo;

  const BankInfoAddEvent({required this.bankInfo, required this.context});
}
