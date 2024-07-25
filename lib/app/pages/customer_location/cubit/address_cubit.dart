import 'package:bloc/bloc.dart';
import 'package:common_code/common_code.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:common_code/util/global_context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumi/domain/address/use_case/delete_address.dart';
import 'package:yumi/domain/address/use_case/get_addresses.dart';
import 'package:yumi/domain/address/use_case/update_default_address.dart';
import 'package:yumi/generated/l10n.dart';

part 'address_cubit.freezed.dart';
part 'address_cubit.g.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    required PaginatedData<Address> pagination,
  }) = _AddressState;

  factory AddressState.initial() {
    return AddressState(pagination: const PaginatedData<Address>(data: []));
  }

  factory AddressState.fromJson(Map<String, dynamic> json) => _$AddressStateFromJson(json);
}

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressState.initial());

  getAddresses({String? id}) async {
    if (!state.pagination.canRequest) return;
    emit(state.copyWith.pagination(isLoading: true));
    final task = await GetAddresses().call(GetAddressesParams(pagination: state.pagination, queryParameters: {'id': id}));
    task.fold((l) => GlobalContext().snackBar(l.error ?? S.current.apiError), (r) => emit(state.copyWith(pagination: r)));
  }

  updateDefaultAddress({required Address address}) async {
    if (state.pagination.isLoading) return;
    emit(state.copyWith.pagination(isLoading: true));
    final task = await UpdateDefaultAddress().call(UpdateDefaultAddressParams(pagination: state.pagination, address: address, queryParameters: null));
    task.fold((l) => GlobalContext().snackBar(l.error ?? S.current.apiError), (r) {
      GlobalContext().context.read<UserCubit>().saveLocation(address);
      emit(state.copyWith(pagination: r));
    });
  }

  deleteAddress({required Address address}) async {
    if (state.pagination.isLoading) return;
    emit(state.copyWith.pagination(isLoading: true));
    final task = await DeleteAddress().call(DeleteAddressParams(pagination: state.pagination, address: address, queryParameters: null));
    task.fold((l) => GlobalContext().snackBar(l.error ?? S.current.apiError), (r) => emit(state.copyWith(pagination: r)));
  }
}
