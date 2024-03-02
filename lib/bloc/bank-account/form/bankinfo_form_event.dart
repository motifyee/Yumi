part of 'bankinfo_form_bloc.dart';

@immutable
abstract class BankInfoFormEvent extends Equatable {
  const BankInfoFormEvent([List props = const []]) : super();
}

class BankInfoFormUpdateEvent implements BankInfoFormEvent {
  final BankInfo? bankInfo;
  final bool? loading;

  const BankInfoFormUpdateEvent({this.bankInfo, this.loading});

  @override
  List<Object> get props => [bankInfo!, loading!];

  @override
  bool? get stringify => true; //'${bankInfo?.id ?? ''}-${loading ?? false}';
}
