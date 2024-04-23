import 'package:equatable/equatable.dart';

class Status<T> extends Equatable {
  // TODO dosn't work with serializable, figure away to do so.
  // TODO cooperate with freezed deep copyWith
  final T? value;

  final String message;
  final ObseleteStatusEnum status;
  final StatusSet statusSet;
  final StatusHistory statusHistory;

  const Status({
    this.value,
    this.status = ObseleteStatusEnum.idle,
    this.message = '',
    this.statusSet = const {},
    this.statusHistory = const [],
  });

  // const factory Status({
  //   T? value,
  //   @Default('') String message,
  //   @Default(ObseleteStatusEnum.idle) ObseleteStatusEnum status,
  //   @Default({}) StatusSet statusSet,
  //   @Default([]) StatusHistory statusHistory,
  // }) = _Status;
  // const Status._();

  Status<T> copyWith({
    T? value,
    String? message,
    ObseleteStatusEnum? status,
    StatusSet? statusSet,
    StatusHistory? statusHistory,
  }) =>
      Status(
        value: value ?? this.value,
        message: message ?? this.message,
        status: status ?? this.status,
        statusSet: statusSet ?? {...this.statusSet, status ?? this.status},
        statusHistory:
            statusHistory ?? [...this.statusHistory, status ?? this.status],
      );

  //
  bool get isInit => status == ObseleteStatusEnum.init;
  bool get isInitSucces => status == ObseleteStatusEnum.initSuccess;
  bool get isInitError => status == ObseleteStatusEnum.initError;
  bool get isLoading => status == ObseleteStatusEnum.loading;
  bool get isSuccess => status == ObseleteStatusEnum.success;
  bool get isError => status == ObseleteStatusEnum.error;
  bool get isIdle => status == ObseleteStatusEnum.idle;
  bool get isSaved => status == ObseleteStatusEnum.formSaved;
  bool get isReset => status == ObseleteStatusEnum.formReset;
  bool get isSelected => status == ObseleteStatusEnum.selected;

  //
  bool get hasInit => statusSet.contains(ObseleteStatusEnum.init);
  bool get hasInitSuccess => statusSet.contains(ObseleteStatusEnum.initSuccess);
  bool get hasInitError => statusSet.contains(ObseleteStatusEnum.initError);
  bool get hasLoading => statusSet.contains(ObseleteStatusEnum.loading);
  bool get hasSuccess => statusSet.contains(ObseleteStatusEnum.success);
  bool get hasError => statusSet.contains(ObseleteStatusEnum.error);
  bool get hasIdle => statusSet.contains(ObseleteStatusEnum.idle);
  bool get hasSaved => statusSet.contains(ObseleteStatusEnum.formSaved);
  bool get hasReset => statusSet.contains(ObseleteStatusEnum.formReset);
  bool get hasSelected => statusSet.contains(ObseleteStatusEnum.selected);

  @override
  List<Object?> get props => [value, message, status, statusHistory];
}

// Todo set as a private enum
enum ObseleteStatusEnum {
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

extension BlocStatusX on ObseleteStatusEnum {
  bool get isInit => this == ObseleteStatusEnum.init;
  bool get isInitSucces => this == ObseleteStatusEnum.initSuccess;
  bool get isInitError => this == ObseleteStatusEnum.initError;
  bool get isSuccess => this == ObseleteStatusEnum.success;
  bool get isError => this == ObseleteStatusEnum.error;
  bool get isLoading => this == ObseleteStatusEnum.loading;
  bool get isIdle => this == ObseleteStatusEnum.idle;
  bool get isSaved => this == ObseleteStatusEnum.formSaved;
  bool get isReset => this == ObseleteStatusEnum.formReset;
  bool get isSelected => this == ObseleteStatusEnum.selected;
}

typedef StatusHistory = List<ObseleteStatusEnum>;

extension BlocStatusHistoryX on StatusHistory {
  bool get hasInit => contains(ObseleteStatusEnum.init);
  bool get hasInitSuccess => contains(ObseleteStatusEnum.initSuccess);
  bool get hasInitError => contains(ObseleteStatusEnum.initError);
  bool get hasSuccess => contains(ObseleteStatusEnum.success);
  bool get hasError => contains(ObseleteStatusEnum.error);
  bool get hasLoading => contains(ObseleteStatusEnum.loading);
  bool get hasIdle => contains(ObseleteStatusEnum.idle);
  bool get hasSaved => contains(ObseleteStatusEnum.formSaved);
  bool get hasReset => contains(ObseleteStatusEnum.formReset);
  bool get hasSelected => contains(ObseleteStatusEnum.selected);
}

typedef StatusSet = Set<ObseleteStatusEnum>;

extension StatusSetX on StatusSet {
  bool get hasInit => contains(ObseleteStatusEnum.init);
  bool get hasInitSuccess => contains(ObseleteStatusEnum.initSuccess);
  bool get hasInitError => contains(ObseleteStatusEnum.initError);
  bool get hasSuccess => contains(ObseleteStatusEnum.success);
  bool get hasError => contains(ObseleteStatusEnum.error);
  bool get hasLoading => contains(ObseleteStatusEnum.loading);
  bool get hasLoaded => contains(ObseleteStatusEnum.idle);
  bool get hasSaved => contains(ObseleteStatusEnum.formSaved);
  bool get hasReset => contains(ObseleteStatusEnum.formReset);
  bool get hasSelected => contains(ObseleteStatusEnum.selected);
}
