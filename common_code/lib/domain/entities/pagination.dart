// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

/// A class that holds pure pagination information.
@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    @Default(0) @JsonKey(toJson: _pageNumberToJson) int pageNumber,
    @Default(20) int pageSize,
    @Default(false) bool isLoading,
    @Default(1) @JsonKey(includeFromJson: false) int lastPage,
    @Default(0) @JsonKey(includeFromJson: false) int total,
  }) = _Pagination;

  const Pagination._();

  bool get canRequest => pageNumber != lastPage && !isLoading;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

int _pageNumberToJson(int value) {
  return value + 1;
}
