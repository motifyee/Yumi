import 'package:equatable/equatable.dart';

class EntityStatus extends Equatable {
  // TODO dosn't work with serializable, figure away to do so.
  // TODO cooperate with freezed deep copyWith
  // final T? value;

  final String message;
  final Status status;
  final StatusSet statusSet;
  final StatusHistory statusHistory;

  const EntityStatus({
    // this.value,
    this.status = Status.idle,
    this.message = '',
    this.statusSet = const {},
    this.statusHistory = const [],
  });

  messageOrMapStatus({
    bool message = true,
    String? init,
    String? initSuccess,
    String? initError,
    String? loading,
    String? success,
    String? error,
    String? idle,
    String? formSaved,
    String? formReset,
    String? selected,
  }) {
    if (message && this.message.isNotEmpty) return message;

    return switch (status) {
      Status.initSuccess => initSuccess ?? 'Initialising Success',
      Status.init => init ?? 'Initialising',
      Status.initError => initError ?? 'Initialising Error',
      Status.loading => loading ?? 'Loading',
      Status.success => success ?? 'Success',
      Status.error => error ?? 'Error',
      Status.idle => idle ?? 'Idle',
      Status.formSaved => formSaved ?? 'Form Saved',
      Status.formReset => formReset ?? 'Form Reset',
      Status.selected => selected ?? 'Selected',
    };
  }

  // const factory Status({
  //   T? value,
  //   @Default('') String message,
  //   @Default(ObseleteStatusEnum.idle) ObseleteStatusEnum status,
  //   @Default({}) StatusSet statusSet,
  //   @Default([]) StatusHistory statusHistory,
  // }) = _Status;
  // const Status._();

  EntityStatus copyWith({
    // T? value,
    String? message,
    Status? status,
    StatusSet? statusSet,
    StatusHistory? statusHistory,
  }) =>
      EntityStatus(
        // value: value ?? this.value,
        message: message ?? this.message,
        status: status ?? this.status,
        statusSet: statusSet ?? {...this.statusSet, status ?? this.status},
        statusHistory:
            statusHistory ?? [...this.statusHistory, status ?? this.status],
      );

  //
  bool get isInit => status == Status.init;
  bool get isInitSucces => status == Status.initSuccess;
  bool get isInitError => status == Status.initError;
  bool get isLoading => status == Status.loading;
  bool get isSuccess => status == Status.success;
  bool get isError => status == Status.error;
  bool get isIdle => status == Status.idle;
  bool get isSaved => status == Status.formSaved;
  bool get isReset => status == Status.formReset;
  bool get isSelected => status == Status.selected;

  //
  bool get hasInit => statusSet.contains(Status.init);
  bool get hasInitSuccess => statusSet.contains(Status.initSuccess);
  bool get hasInitError => statusSet.contains(Status.initError);
  bool get hasLoading => statusSet.contains(Status.loading);
  bool get hasSuccess => statusSet.contains(Status.success);
  bool get hasError => statusSet.contains(Status.error);
  bool get hasIdle => statusSet.contains(Status.idle);
  bool get hasSaved => statusSet.contains(Status.formSaved);
  bool get hasReset => statusSet.contains(Status.formReset);
  bool get hasSelected => statusSet.contains(Status.selected);

  @override
  List<Object?> get props => [message, status, statusHistory];
}

// Todo set as a private enum
enum Status {
  init,
  initSuccess,
  initError,
  //
  loading,
  success,
  error,
  //
  idle,
  //
  formSaved,
  formReset,
  //
  selected
}

extension BlocStatusX on Status {
  bool get isInit => this == Status.init;
  bool get isInitSucces => this == Status.initSuccess;
  bool get isInitError => this == Status.initError;
  bool get isSuccess => this == Status.success;
  bool get isError => this == Status.error;
  bool get isLoading => this == Status.loading;
  bool get isIdle => this == Status.idle;
  bool get isSaved => this == Status.formSaved;
  bool get isReset => this == Status.formReset;
  bool get isSelected => this == Status.selected;
}

typedef StatusHistory = List<Status>;

extension BlocStatusHistoryX on StatusHistory {
  bool get hasInit => contains(Status.init);
  bool get hasInitSuccess => contains(Status.initSuccess);
  bool get hasInitError => contains(Status.initError);
  bool get hasSuccess => contains(Status.success);
  bool get hasError => contains(Status.error);
  bool get hasLoading => contains(Status.loading);
  bool get hasIdle => contains(Status.idle);
  bool get hasSaved => contains(Status.formSaved);
  bool get hasReset => contains(Status.formReset);
  bool get hasSelected => contains(Status.selected);
}

typedef StatusSet = Set<Status>;

extension StatusSetX on StatusSet {
  bool get hasInit => contains(Status.init);
  bool get hasInitSuccess => contains(Status.initSuccess);
  bool get hasInitError => contains(Status.initError);
  bool get hasSuccess => contains(Status.success);
  bool get hasError => contains(Status.error);
  bool get hasLoading => contains(Status.loading);
  bool get hasLoaded => contains(Status.idle);
  bool get hasSaved => contains(Status.formSaved);
  bool get hasReset => contains(Status.formReset);
  bool get hasSelected => contains(Status.selected);
}
