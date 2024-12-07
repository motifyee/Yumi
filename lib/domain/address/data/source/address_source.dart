import 'package:common_code/common_code.dart';

abstract class AddressSource {
  Future<PaginatedData<Address>> getAddresses(
      {required PaginatedData<Address> pagination,
      Map<String, dynamic>? queryParameters});
  Future<PaginatedData<Address>> updateDefaultAddresses(
      {required PaginatedData<Address> pagination,
      required Address address,
      Map<String, dynamic>? queryParameters});
  Future<PaginatedData<Address>> deleteAddresses(
      {required PaginatedData<Address> pagination,
      required Address address,
      Map<String, dynamic>? queryParameters});
}
