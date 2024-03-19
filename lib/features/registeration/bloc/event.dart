part of 'bloc.dart';

@freezed
class RegisterationEvent with _$RegisterationEvent {
  const factory RegisterationEvent.init() = _init;
  const factory RegisterationEvent.loading() = _loading;
  const factory RegisterationEvent.loaded() = _loaded;
  const factory RegisterationEvent.next() = _next;
}
