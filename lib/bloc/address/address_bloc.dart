import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/app/pages/auth/registeration/model/address.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/extensions/unique_list_extension.dart';
import 'package:yumi/global.dart';
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
      required Emitter<AddressState> emit}) {
    List<Address> address =
        [...event.address, ...state.addressList].unique((x) => x.id);

    G.builderKey.currentContext?.read<UserBloc>().add(UserUpdateLocationEvent(
        address: address.firstWhere((e) => e.isDefault == true)));

    emit(
      state.copyWith(
        addressList: address,
        paginationHelper: state.paginationHelper.copyWith(
          pageNumber: 1,
          lastPage: 1,
          isLoading: false,
        ),
      ),
    );
  }

  _getAddressList({
    required _getAddressListEvent event,
    required Emitter<AddressState> emit,
  }) async {
    if (state.paginationHelper.pageNumber < state.paginationHelper.lastPage &&
        !state.paginationHelper.isLoading) {
      emit(state.copyWith(
          paginationHelper: state.paginationHelper.copyWith(isLoading: true)));

      Response res = await AddressService.getAddresses(
          context: event.context,
          pagination: {...state.paginationHelper.toJson(), 'id': event.id}
            ..removeWhere((e, v) => v == null));
      print(res.data);

      List<Address> data = [];
      data = res.data.map<Address>((value) {
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

    List<Address> addressList = state.addressList.map((e) {
      return e.id == event.address.id
          ? e.copyWith(isDefault: true)
          : e.copyWith(isDefault: false);
    }).toList();

    if (res.statusCode == 200) {
      add(AddressEvent.updateAddressListEvent(address: addressList));
    }
  }

  _deleteAddress(
      {required _deleteAddressEvent event,
      required Emitter<AddressState> emit}) async {
    emit(state.copyWith(
        paginationHelper: state.paginationHelper.copyWith(isLoading: true)));

    Response res = await AddressService.deleteAddresses(
      context: event.context,
      address: event.address,
    );

    List<Address> addressList = state.addressList.map((e) {
      return e.id == event.address.id ? e.copyWith(isDeleted: true) : e;
    }).toList();

    if (res.statusCode == 200) {
      add(AddressEvent.updateAddressListEvent(address: addressList));
    }
  }
}
