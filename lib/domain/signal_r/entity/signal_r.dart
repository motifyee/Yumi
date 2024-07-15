import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common_code/core/setup/signalr.dart';

part 'signal_r.freezed.dart';
part 'signal_r.g.dart';

@freezed
class SignalRM with _$SignalRM {
  const factory SignalRM({
    required Signals type,
    dynamic message,
  }) = _SignalRM;

  factory SignalRM.fromJson(Map<String, dynamic> json) => _$SignalRMFromJson(json);
}
