import 'package:dependencies/dependencies.dart';
import 'package:common_code/core/setup/signalr.dart';

part 'signal_r.freezed.dart';
part 'signal_r.g.dart';

@freezed
class SignalRM with _$SignalRM {
  const factory SignalRM({
    required Signal type,
    message,
  }) = _SignalRM;

  factory SignalRM.fromJson(Map<String, dynamic> json) =>
      _$SignalRMFromJson(json);
}
