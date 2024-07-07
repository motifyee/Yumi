import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/extensions/datetime_toIso8601string_converter.dart';

part 'voucher.g.dart';

part 'voucher.freezed.dart';

@freezed
class Voucher with _$Voucher {
  const factory Voucher({
    required String id,
    @JsonKey(name: 'voucher_Name') required String voucherName,
    required double amount,
    @DateTimeToIso8601StringConverter() @JsonKey(name: 'start_Date') required DateTime startDate,
    @DateTimeToIso8601StringConverter() @JsonKey(name: 'end_Date') required DateTime endDate,
    required String status,
  }) = _Voucher;

  const Voucher._();

  bool get isValid => status == 'Voucher Valid';

  factory Voucher.fromJson(Map<String, dynamic> json) => _$VoucherFromJson(json);
}
