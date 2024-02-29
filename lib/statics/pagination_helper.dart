class PaginationHelper {
  int pageNumber;
  int pageSize;
  int lastPage;
  bool isLoading;

  PaginationHelper(
      {this.pageNumber = 0,
      this.lastPage = 1,
      this.pageSize = 20,
      this.isLoading = false});

  Map<String, dynamic> toJson({int pageNumberPlus = 1}) {
    return {
      'pageNumber': pageNumber + pageNumberPlus,
      'pageSize': pageSize,
    };
  }

  PaginationHelper copyWith({
    int? pageNumber,
    int? pageSize,
    int? lastPage,
    bool? isLoading,
  }) {
    return PaginationHelper(
        pageNumber: pageNumber ?? this.pageNumber,
        pageSize: pageSize ?? this.pageSize,
        lastPage: lastPage ?? this.lastPage,
        isLoading: isLoading ?? this.isLoading);
  }
}
