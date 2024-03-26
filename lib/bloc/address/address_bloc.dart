import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/features/registeration/model/address.dart';
import 'package:yumi/service/address_service.dart';
import 'package:yumi/statics/pagination_helper.dart';

part 'address_bloc.freezed.dart';
part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressState.initial()) {
    on<AddressEvent>((event, emit) {
      event.map(
        updateAddressListEvent: (evt) =>
            _updateAddressList(event: evt, emit: emit),
        getAddressListEvent: (evt) => _getAddressList(event: evt, emit: emit),
        resetAddressListEvent: (_) => emit(AddressState.initial()),
        editAddressEvent: (evt) => _editAddress(event: evt, emit: emit),
        deleteAddressEvent: (evt) => _deleteAddress(event: evt, emit: emit),
      );
    });
  }

  _updateAddressList(
      {required _updateAddressListEvent event,
      required Emitter<AddressState> emit}) async {
    print('update ..............................................');
    print(event.address);
    emit(
      state.copyWith(
        addressList: [...state.addressList, ...event.address],
        paginationHelper: state.paginationHelper.copyWith(
          pageNumber: 1,
          lastPage: 1,
          isLoading: false,
        ),
      ),
    );
  }

  _getAddressList(
      {required _getAddressListEvent event,
      required Emitter<AddressState> emit}) async {
    if (state.paginationHelper.pageNumber < state.paginationHelper.lastPage &&
        !state.paginationHelper.isLoading) {
      emit(state.copyWith(
          paginationHelper: state.paginationHelper.copyWith(isLoading: true)));

      dynamic res = await AddressService.getAddresses(
          context: event.context, pagination: state.paginationHelper.toJson());

      List<Address> data = [];
      data = res.map<Address>((value) {
        return Address.fromJson(value);
      }).toList();

      add(AddressEvent.updateAddressListEvent(address: data));
    }
  }

  _editAddress(
      {required _editAddressEvent event,
      required Emitter<AddressState> emit}) async {
    emit(state.copyWith(
        paginationHelper: state.paginationHelper.copyWith(isLoading: true)));

    Response res = await AddressService.updateAddresses(
        context: event.context, address: event.address);

    List<Address> _addressList = state.addressList.map((e) {
      return e.id == event.address.id
          ? e.copyWith(isDefault: true)
          : e.copyWith(isDefault: false);
    }).toList();
    print('edit ************************************************');
    print(_addressList);

    if (res.statusCode == 200) {
      add(AddressEvent.updateAddressListEvent(address: _addressList));
    }
  }

  _deleteAddress(
      {required _deleteAddressEvent event,
      required Emitter<AddressState> emit}) {}
}
