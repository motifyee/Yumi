// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pager.freezed.dart';
part 'pager.g.dart';

@freezed
class Pager<T> with _$Pager {
  const factory Pager({
    @Default(0) @JsonKey(toJson: _pageNumberToJson) int pageNumber,
    @Default(20) int pageSize,
    @Default(1) @JsonKey(includeFromJson: false) int lastPage,
    @Default(0) @JsonKey(includeFromJson: false) int total,
    @Default(false) @JsonKey(includeFromJson: false) bool isLoading,
    @Default([])
    @JsonKey(includeToJson: false, includeFromJson: false)
    List<T> data,
  }) = _Pager;

  const Pager._();

  bool get canRequest => pageNumber != lastPage && !isLoading;

  factory Pager.fromJson(Map<String, dynamic> json) => _$PagerFromJson(json);
}

int _pageNumberToJson(int value) {
  return value + 1;
}
