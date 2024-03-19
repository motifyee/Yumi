part of 'bloc.dart';

@freezed
class RegisterationState with _$RegisterationState {
  const factory RegisterationState({
    @Default(0) double index,
    LatLng? latLng,
    String? address,
    String? phone,
    String? otp,
  }) = Initial;
}

// class Registeration with _$Registeration{
//   const factory Registeration({
//     @Default(0) double index,
//   }) = Initial;
// }
