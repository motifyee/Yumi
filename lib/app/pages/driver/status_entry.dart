import 'package:yumi/bloc/util/status.dart';

// part 'status_entry.freezed.dart';

// @freezed
// class StatusEntry<T> with _$StatusEntry {
//   const factory StatusEntry({
//     required T value,
//     @Default('') String message,
//     @Default(BlocStatus.init) status,
//   }) = _StatusEntryInitial;
// }
typedef SE<T> = StatusEntry<T>;

class StatusEntry<T> {
  final T value;
  final String message;
  final Status status;

  const StatusEntry({
    required this.value,
    this.message = '',
    this.status = Status.init,
  });

  StatusEntry<T> copyWith({
    T? value,
    String? message,
    Status? status,
  }) {
    return StatusEntry<T>(
      value: value ?? this.value,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
