import 'package:common_code/common_code.dart';
import 'package:dio/dio.dart';
import 'package:yumi/domain/address/data/source/address_source.dart';

class AddressRemoteSource extends AddressSource {
  @override
  Future<PaginatedData<Address>> deleteAddresses({
    required PaginatedData<Address> pagination,
    required Address address,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      await APIClient().delete(
        Endpoints().address,
        queryParameters: {'addressid': address.id, ...?queryParameters},
      );
    } catch (e) {
      throw ServerException(e as DioException);
    }

    final List<Address> addressList = pagination.data.map((e) {
      return e.id == address.id ? e.copyWith(isDeleted: true) : e;
    }).toList() as List<Address>;

    return pagination.copyWith(data: addressList, isLoading: false)
        as PaginatedData<Address>;
  }

  @override
  Future<PaginatedData<Address>> getAddresses({
    required PaginatedData<Address> pagination,
    Map<String, dynamic>? queryParameters,
  }) async {
    Response res;
    try {
      res = await APIClient().get(
        Endpoints().address,
        queryParameters: {...pagination.toJson(), ...?queryParameters},
      );
    } catch (e) {
      throw ServerException(e as DioException);
    }
    final List<Address> addressList = res.data.map<Address>((value) {
      return Address.fromJson(value);
    }).toList();

    return pagination.copyWith(
      data: addressList,
      isLoading: false,
      lastPage: 1,
      pageNumber: 1,
    ) as PaginatedData<Address>;
  }

  @override
  Future<PaginatedData<Address>> updateDefaultAddresses({
    required PaginatedData<Address> pagination,
    required Address address,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      await APIClient().put(
        Endpoints().address,
        data: address.toJson(),
        queryParameters: {'addressid': address.id, ...?queryParameters},
      );
    } catch (e) {
      throw ServerException(e as DioException);
    }

    List<Address> addressList;
    try {
      addressList = pagination.data.map<Address>((e) {
        return e.id == address.id
            ? e.copyWith(isDefault: true)
            : e.copyWith(isDefault: false);
      }).toList();
    } catch (e) {
      throw GenericException(e.toString());
    }

    return pagination.copyWith(
      data: <Address>[...addressList],
      isLoading: false,
    ) as PaginatedData<Address>;
  }
}
