// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common_code/domain/food_delivery/chef/entity/chef.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    @Default('') String id,
    @Default('') String code,
    //
    @Default('') @JsonKey(name: 'buddies_User_ID') String buddiesUserId,
    @Default('') @JsonKey(includeToJson: false) String customerName,
    @Default(0.0) double rate,
    @Default('') @JsonKey(name: 'review_Comment') String reviewComment,
    @JsonKey(includeToJson: false) Chef? chef,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
