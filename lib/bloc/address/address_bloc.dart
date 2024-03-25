import 'package:bloc/bloc.dart';
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
        resetAddressListEvent: (_) => emit(AddressState.initial()),
      );
    });
  }

  _updateAddressList({required event, required emit}) async {
    if (state.paginationHelper.pageNumber < state.paginationHelper.lastPage &&
        !state.paginationHelper.isLoading) {
      emit(state.copyWith(
          paginationHelper: state.paginationHelper.copyWith(isLoading: true)));

      dynamic res = await AddressService.getAddresses(
          context: event.context, pagination: state.paginationHelper.toJson());

      List<Address> data = [];
      data = res['data'].map<Address>((value) {
        return Address.fromJson(value);
      }).toList();

      emit(
        state.copyWith(
          addressList: [...state.addressList, ...data],
          paginationHelper: state.paginationHelper.copyWith(
            pageNumber: res['pagination']['page'],
            lastPage: res['pagination']['pages'],
            isLoading: false,
          ),
        ),
      );
    }
  }
}
