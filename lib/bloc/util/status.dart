enum BlocStatus {
  init,
  initSuccess,
  initError,
  success,
  error,
  loading,
  loaded,
  formSaved,
  formReset,
  selected
}

extension BlocStatusX on BlocStatus {
  bool get isInit => this == BlocStatus.init;
  bool get isInitSucces => this == BlocStatus.initSuccess;
  bool get isInitError => this == BlocStatus.initError;
  bool get isSuccess => this == BlocStatus.success;
  bool get isError => this == BlocStatus.error;
  bool get isLoading => this == BlocStatus.loading;
  bool get isLoaded => this == BlocStatus.loaded;
  bool get isSaved => this == BlocStatus.formSaved;
  bool get isReset => this == BlocStatus.formReset;
  bool get isSelected => this == BlocStatus.selected;
}

typedef BlocStatusHistory = List<BlocStatus>;

extension BlocStatusHistoryX on BlocStatusHistory {
  bool get hasInit => contains(BlocStatus.init);
  bool get hasInitSuccess => contains(BlocStatus.initSuccess);
  bool get hasInitError => contains(BlocStatus.initError);
  bool get hasSuccess => contains(BlocStatus.success);
  bool get hasError => contains(BlocStatus.error);
  bool get hasLoading => contains(BlocStatus.loading);
  bool get hasLoaded => contains(BlocStatus.loaded);
  bool get hasSaved => contains(BlocStatus.formSaved);
  bool get hasReset => contains(BlocStatus.formReset);
  bool get hasSelected => contains(BlocStatus.selected);
}

typedef BlocStatusSet = Set<BlocStatus>;

extension BlocStatusSetX on BlocStatusSet {
  bool get hasInit => contains(BlocStatus.init);
  bool get hasInitSuccess => contains(BlocStatus.initSuccess);
  bool get hasInitError => contains(BlocStatus.initError);
  bool get hasSuccess => contains(BlocStatus.success);
  bool get hasError => contains(BlocStatus.error);
  bool get hasLoading => contains(BlocStatus.loading);
  bool get hasLoaded => contains(BlocStatus.loaded);
  bool get hasSaved => contains(BlocStatus.formSaved);
  bool get hasReset => contains(BlocStatus.formReset);
  bool get hasSelected => contains(BlocStatus.selected);
}
