part of 'address_bloc.dart';

@freezed
class AddressEvent with _$AddressEvent {
  const factory AddressEvent.updateAddressListEvent(
      {required BuildContext context}) = _updateAddressListEvent;
  const factory AddressEvent.resetAddressListEvent() = _resetAddressListEvent;
}
