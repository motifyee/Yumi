part of 'address_bloc.dart';

@freezed
class AddressState with _$AddressState {
  factory AddressState({
    required List<Address> addressList,
    required Pagination pagination,
  }) = _AddressState;

  factory AddressState.initial() {
    return AddressState(
      addressList: [],
      pagination: Pagination(
        isLoading: false,
        lastPage: 1,
        pageNumber: 0,
        pageSize: 20,
      ),
    );
  }
}
