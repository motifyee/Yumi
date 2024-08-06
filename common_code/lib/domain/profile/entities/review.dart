// ignore_for_file: invalid_annotation_target

import 'package:common_code/domain/food_delivery/chef/entity/chef.dart';
import 'package:dependencies/dependencies.dart';

part 'review.freezed.dart';
part 'review.g.dart';

// "id":"04313795-5429-42f8-85aa-20bd47937c80",
//"code":"123658774",
//"buddies_User_ID":"32766173-4706-4ae9-9dc3-832504f77857",
//"customerName":"cc  ",
//"rate":4.5,
//"review_Comment":""
@freezed
class Review with _$Review {
  const factory Review({
    @Default('') String id,
    @Default('') String code,
    //
    @Default('') @JsonKey(name: 'buddies_User_ID') String buddiesUserId,
    @Default('') String customerName,
    @Default(0) double rate,
    @Default('') @JsonKey(name: 'review_Comment') String comment,
    @JsonKey(includeToJson: false) Chef? chef,
  }) = _Review;

  const Review._();

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
