import 'package:common_code/common_code.dart';
import 'package:common_code/core/failures.dart';
import 'package:common_code/domain/address/entity/address.dart';
import 'package:common_code/domain/entities/paginatedData.dart';
import 'package:fpdart/src/task_either.dart';
import 'package:yumi/domain/address/data/repo/address_repo.dart';
import 'package:yumi/domain/address/data/source/address_source.dart';

class AddressRemoteRepo extends AddressRepo {
  final AddressSource addressSource;

  AddressRemoteRepo({AddressSource? addressSource})
      : addressSource = addressSource ?? getIt<AddressSource>();

  @override
  TaskEither<Failure, PaginatedData<Address>> deleteAddresses(
      {required PaginatedData<Address> pagination,
      required Address address,
      Map<String, dynamic>? queryParameters}) {
    return TaskEither.tryCatch(
        () => addressSource.deleteAddresses(
            pagination: pagination,
            address: address,
            queryParameters: queryParameters),
        (error, stackTrace) => ServerFailure((error as CException).error));
  }

  @override
  TaskEither<Failure, PaginatedData<Address>> getAddresses(
      {required PaginatedData<Address> pagination,
      Map<String, dynamic>? queryParameters}) {
    return TaskEither.tryCatch(
        () => addressSource.getAddresses(
            pagination: pagination, queryParameters: queryParameters),
        (error, stackTrace) => ServerFailure((error as CException).error));
  }

  @override
  TaskEither<Failure, PaginatedData<Address>> updateDefaultAddresses(
      {required PaginatedData<Address> pagination,
      required Address address,
      Map<String, dynamic>? queryParameters}) {
    return TaskEither.tryCatch(
        () => addressSource.updateDefaultAddresses(
            pagination: pagination,
            address: address,
            queryParameters: queryParameters),
        (error, stackTrace) => ServerFailure((error as CException).error));
  }
}
