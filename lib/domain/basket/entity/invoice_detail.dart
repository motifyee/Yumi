import 'package:common_code/common_code.dart';
import 'package:dependencies/dependencies.dart';

part 'invoice_detail.freezed.dart';
part 'invoice_detail.g.dart';

@freezed
class InvoiceDetail with _$InvoiceDetail {
  const factory InvoiceDetail({
    int? productVarintId,
    @Default("0") @StringToDoubleAsIntStringConverter() String quantity,
    @Default(0) double productVarintPrice,
    @Default(1205) int discountListId,
    @Default('') String note,
    @JsonKey(includeToJson: false) Meal? meal,
  }) = _InvoiceDetail;

  factory InvoiceDetail.fromMeal({required Meal meal}) {
    return InvoiceDetail(
      productVarintId: meal.productVariantID,
      quantity: '1',
      productVarintPrice: meal.price1 ?? 0,
      discountListId: 1205,
      note: '',
      meal: meal,
    );
  }

  factory InvoiceDetail.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailFromJson(json);
}
