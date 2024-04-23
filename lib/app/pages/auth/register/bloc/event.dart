part of 'bloc.dart';

@freezed
class RegEvent with _$RegEvent {
  const factory RegEvent.init() = _init;
  const factory RegEvent.loading() = _loading;
  const factory RegEvent.loaded() = _loaded;
  const factory RegEvent.next(BuildContext ctx) = _next;
  const factory RegEvent.previous(BuildContext ctx) = _previous;
  const factory RegEvent.goto(int step, BuildContext ctx) = _goto;

  const factory RegEvent.setAccount(
      RegisterationForm signupData, BuildContext ctx) = _setAccount;
  const factory RegEvent.setPhone(String phone, BuildContext ctx) = _setPhone;
  const factory RegEvent.setOTP(String otp, BuildContext ctx) = _setOTP;
  const factory RegEvent.saveLocation(BuildContext ctx,
      {Function({required Address address})? routeFn}) = _setLocation;
  const factory RegEvent.updateLocation(Address address) = _updateLocation;
}
