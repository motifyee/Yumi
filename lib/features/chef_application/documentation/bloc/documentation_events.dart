part of 'documentation_bloc.dart';

class DocsEvents extends Equatable {
  const DocsEvents();
  @override
  List<Object?> get props => [];
}

class DocsInitEvent extends DocsEvents {}

class DocsInitSuccessEvent extends DocsEvents {
  final Profile profile;
  const DocsInitSuccessEvent(this.profile);
  @override
  List<Object?> get props => [profile];
}

class DocsInitFailedEvent extends DocsEvents {
  const DocsInitFailedEvent();
}

class UploadHygieneEvent extends DocsEvents {
  final String data;
  const UploadHygieneEvent(this.data);
  @override
  List<Object?> get props => [data];
}

class UploadHygieneSuccessEvent extends DocsEvents {}

class UploadHygieneErrorEvent extends DocsEvents {}

class UploadRegisterationEvent extends DocsEvents {
  final String data;
  const UploadRegisterationEvent(this.data);
  @override
  List<Object?> get props => [data];
}

class UploadRegisterationSuccessEvent extends DocsEvents {}

class UploadRegisterationErrorEvent extends DocsEvents {}

class UploadRiskEvent extends DocsEvents {
  final String data;
  const UploadRiskEvent(this.data);
  @override
  List<Object?> get props => [data];
}

class UploadRiskSuccessEvent extends DocsEvents {}

class UploadRiskErrorEvent extends DocsEvents {}

class UploadIDEvent extends DocsEvents {
  final String data;
  const UploadIDEvent(this.data);
  @override
  List<Object?> get props => [data];
}

class UploadIDSuccessEvent extends DocsEvents {}

class UploadIDErrorEvent extends DocsEvents {}

class UploadCompleteEvent extends DocsEvents {}
