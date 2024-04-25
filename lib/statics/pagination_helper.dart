import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_helper.freezed.dart';
part 'pagination_helper.g.dart';

@freezed
class PaginationHelper<T> with _$PaginationHelper {
  const factory PaginationHelper({
    @Default(0) @JsonKey(toJson: _pageNumberToJson) int pageNumber,
    @Default(1) int pageSize,
    @Default(20) @JsonKey(includeFromJson: false) int lastPage,
    @Default(false) @JsonKey(includeFromJson: false) bool isLoading,
    @Default([])
    @JsonKey(includeToJson: false, includeFromJson: false)
    List<T> data,
  }) = _PaginationHelper;

  const PaginationHelper._();

  bool get canRequest => pageNumber != lastPage && !isLoading;

  factory PaginationHelper.fromJson(Map<String, dynamic> json) =>
      _$PaginationHelperFromJson(json);
}

int _pageNumberToJson(int value) {
  return value + 1;
}
