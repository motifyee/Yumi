part of 'bankinfo_bloc.dart';

@immutable
abstract class BankInfoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class BankInfoInitEvent extends BankInfoEvent {
  final BuildContext context;

  BankInfoInitEvent({required this.context});
}

class BankInfoLoadingEvent extends BankInfoEvent {}

class BankInfoLoadedEvent extends BankInfoEvent {}

class BankInfoAddEvent extends BankInfoEvent {
  final BuildContext context;
  final BankInfo bankInfo;
  BankInfoAddEvent({required this.context, required this.bankInfo});

  @override
  List<Object> get props => [bankInfo];
}

class BankInfoUpdateEvent extends BankInfoEvent {
  final BuildContext context;
  final BankInfo bankInfo;
  BankInfoUpdateEvent({required this.context, required this.bankInfo});

  @override
  List<Object> get props => [bankInfo];
}

class BankInfoFormSavedEvent extends BankInfoEvent {
  final BankInfo bankInfo;
  BankInfoFormSavedEvent(this.bankInfo);

  @override
  List<Object> get props => [bankInfo];
}

class BankInfoFormResetEvent extends BankInfoEvent {}
