// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common_code/domain/entities/pagination.dart';

part 'paginatedData.freezed.dart';
part 'paginatedData.g.dart';

@freezed

/// A class that holds data with pagination information.
///
/// For purposes of returning both data and a pagination information together.
class PaginatedData<T> with _$PaginatedData {
  const factory PaginatedData({
    @Default(0) @JsonKey(toJson: _pageNumberToJson) int pageNumber,
    @Default(20) int pageSize,
    @Default(1) @JsonKey(includeFromJson: false) int lastPage,
    @Default(0) @JsonKey(includeFromJson: false) int total,
    @Default(false) @JsonKey(includeFromJson: false) bool isLoading,
    @Default([]) @JsonKey(includeToJson: false, includeFromJson: false) List<T> data,
  }) = _Pagination;

  const PaginatedData._();

  bool get canRequest => pageNumber < lastPage && !isLoading;

  Pagination get pagination => Pagination(
        pageNumber: pageNumber,
        pageSize: pageSize,
        lastPage: lastPage,
        total: total,
        isLoading: isLoading,
      );

  factory PaginatedData.fromJson(Map<String, dynamic> json) => _$PaginatedDataFromJson(json);
}

int _pageNumberToJson(int value) {
  return value + 1;
}
