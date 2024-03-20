part of 'bloc.dart';

//** State.flowIndex:
// * * * * * * * * *
// it manages automatically navigating between  screens
//
//! -1: Not instantiated ()
// 0: Register
// 1: Phone
// 2: OTP
// 3: Address
// 4: Finished
// */

@freezed
class RegState with _$RegState {
  const factory RegState({
    @Default(0) int step,
    RegisterationForm? singupData,
    String? phone,
    String? otp,
    @Default(Address(isDefault: true)) Address address,
    @Default(BlocStatus.init) BlocStatus addressStatus,
  }) = _initial;

  const RegState._();

  // <Type>
  List<PageRouteInfo<void>> get screens => [
        SignUpRoute(),
        const AddPhoneRoute(),
        LocationRoute(),
        const OTPRoute(),
      ];

  List<String> get screenNames => [
        'signup',
        'addPhone',
        'otp',
        'location',
        'signup',
      ];

  PageRouteInfo? get routeScreen =>
      step >= 0 && step < 5 ? screens[step] : null;
}
