// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
class Pagination<T> with _$Pagination {
  const factory Pagination({
    @Default(0) @JsonKey(toJson: _pageNumberToJson) int pageNumber,
    @Default(20) int pageSize,
    @Default(1) @JsonKey(includeFromJson: false) int lastPage,
    @Default(0) @JsonKey(includeFromJson: false) int total,
    @Default(false) @JsonKey(includeFromJson: false) bool isLoading,
    @Default([])
    @JsonKey(includeToJson: false, includeFromJson: false)
    List<T> data,
  }) = _Pagination;

  const Pagination._();

  bool get canRequest => pageNumber != lastPage && !isLoading;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

int _pageNumberToJson(int value) {
  return value + 1;
}