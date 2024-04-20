import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/model/chef_model.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    @Default('') String id,
    @Default('') @JsonKey(name: 'buddies_User_ID') String buddiesUserId,
    @Default('') String code,
    @Default('') @JsonKey(name: 'review_Comment') String reviewComment,
    @Default(0.0) double rate,
    @Default('') @JsonKey(includeToJson: false) String customerName,
    @JsonKey(includeToJson: false) ChefModel? chef,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
