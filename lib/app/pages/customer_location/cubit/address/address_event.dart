part of 'address_bloc.dart';

@freezed
class AddressEvent with _$AddressEvent {
  const factory AddressEvent.updateAddressListEvent(
      {required List<Address> address}) = _updateAddressListEvent;
  const factory AddressEvent.getAddressListEvent(
      {required BuildContext context, String? id}) = _getAddressListEvent;
  const factory AddressEvent.resetAddressListEvent() = _resetAddressListEvent;
  const factory AddressEvent.deleteAddressEvent(
      {required BuildContext context,
      required Address address}) = _deleteAddressEvent;
  const factory AddressEvent.editAddressEvent(
      {required BuildContext context,
      required Address address}) = _editAddressEvent;
}
