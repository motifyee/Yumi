part of 'bankinfo_bloc.dart';

@immutable
class BankInfoState extends Equatable {
  final List<BankInfo> banks;
  BankInfo get selectedBank => banks.firstOrNull ?? const BankInfo();
  final BankInfo? bankInfoForm;

  final ObseleteStatusEnum status;
  final StatusSet statusSet;

  const BankInfoState({
    this.banks = const [],
    this.bankInfoForm,
    this.status = ObseleteStatusEnum.init,
    this.statusSet = const {},
  });

  BankInfoState copyWith({
    List<BankInfo>? banks,
    BankInfo? selectedBank,
    BankInfo? bankInfoForm,
    ObseleteStatusEnum? status,
  }) {
    return BankInfoState(
      banks: banks ?? this.banks,
      bankInfoForm: bankInfoForm ?? this.bankInfoForm,
      status: status ?? this.status,
      statusSet: status != null ? {...statusSet, status} : statusSet,
    );
  }

  @override
  List<Object?> get props => [banks, status, bankInfoForm];
}
