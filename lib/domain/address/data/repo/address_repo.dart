import 'package:common_code/common_code.dart';
import 'package:fpdart/fpdart.dart';

abstract class AddressRepo {
  TaskEither<Failure, PaginatedData<Address>> getAddresses(
      {required PaginatedData<Address> pagination,
      Map<String, dynamic>? queryParameters});
  TaskEither<Failure, PaginatedData<Address>> updateDefaultAddresses(
      {required PaginatedData<Address> pagination,
      required Address address,
      Map<String, dynamic>? queryParameters});
  TaskEither<Failure, PaginatedData<Address>> deleteAddresses(
      {required PaginatedData<Address> pagination,
      required Address address,
      Map<String, dynamic>? queryParameters});
}
