import 'package:common_code/common_code.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'voucher.freezed.dart';
part 'voucher.g.dart';

@freezed
class Voucher with _$Voucher {
  const factory Voucher({
    required String id,
    @JsonKey(name: 'voucher_Name') required String voucherName,
    required double amount,
    @DateTimeToIso8601StringConverter()
    @JsonKey(name: 'start_Date')
    required DateTime startDate,
    @DateTimeToIso8601StringConverter()
    @JsonKey(name: 'end_Date')
    required DateTime endDate,
    required String status,
  }) = _Voucher;

  const Voucher._();

  bool get isValid => status == 'Voucher Valid';

  factory Voucher.fromJson(Map<String, dynamic> json) =>
      _$VoucherFromJson(json);
}
