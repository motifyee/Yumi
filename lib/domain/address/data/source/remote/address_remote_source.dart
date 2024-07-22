import 'package:common_code/common_code.dart';
import 'package:common_code/domain/address/entity/address.dart';
import 'package:common_code/domain/entities/paginatedData.dart';
import 'package:dio/dio.dart';
import 'package:yumi/domain/address/data/source/address_source.dart';

class AddressRemoteSource extends AddressSource {
  @override
  Future<PaginatedData<Address>> deleteAddresses({required PaginatedData<Address> pagination, required Address address, Map<String, dynamic>? queryParameters}) async {
    try {
      await APIClient().delete(EndPoints.address, queryParameters: {'addressid': address.id, ...?queryParameters});
    } catch (e) {
      throw ServerException(e as DioException);
    }

    List<Address> addressList = pagination.data.map((e) {
      return e.id == address.id ? e.copyWith(isDeleted: true) : e;
    }).toList() as List<Address>;

    return pagination.copyWith(data: addressList, isLoading: false) as PaginatedData<Address>;
  }

  @override
  Future<PaginatedData<Address>> getAddresses({required PaginatedData<Address> pagination, Map<String, dynamic>? queryParameters}) async {
    Response res;
    try {
      res = await APIClient().get(EndPoints.address, queryParameters: {...pagination.toJson(), ...?queryParameters});
    } catch (e) {
      throw ServerException(e as DioException);
    }

    List<Address> addressList = res.data.map<Address>((value) {
      return Address.fromJson(value);
    }).toList();

    return pagination.copyWith(data: addressList, pageNumber: res.data['pagination']['page'], lastPage: res.data['pagination']['pages'], isLoading: false) as PaginatedData<Address>;
  }

  @override
  Future<PaginatedData<Address>> updateDefaultAddresses({required PaginatedData<Address> pagination, required Address address, Map<String, dynamic>? queryParameters}) async {
    try {
      await APIClient().put(EndPoints.address, data: address.toJson(), queryParameters: {'addressid': address.id, ...?queryParameters});
    } catch (e) {
      throw ServerException(e as DioException);
    }

    List<Address> addressList = pagination.data.map((e) {
      return e.id == address.id ? e.copyWith(isDefault: true) : e.copyWith(isDefault: false);
    }).toList() as List<Address>;

    return pagination.copyWith(data: addressList, isLoading: false) as PaginatedData<Address>;
  }
}
