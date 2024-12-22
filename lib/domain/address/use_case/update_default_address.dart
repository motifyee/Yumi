import 'package:common_code/common_code.dart';
import 'package:fpdart/src/either.dart';
import 'package:yumi/domain/address/data/repo/address_repo.dart';

class UpdateDefaultAddress
    extends UseCase<PaginatedData<Address>, UpdateDefaultAddressParams> {
  final AddressRepo addressRepo;

  UpdateDefaultAddress({AddressRepo? addressRepo})
      : addressRepo = addressRepo ?? getIt<AddressRepo>();
  @override
  Future<Either<Failure, PaginatedData<Address>>> call(
    UpdateDefaultAddressParams params,
  ) async {
    return await addressRepo
        .updateDefaultAddresses(
          pagination: params.pagination,
          address: params.address,
          queryParameters: params.queryParameters,
        )
        .run();
  }
}

class UpdateDefaultAddressParams extends Params {
  final PaginatedData<Address> pagination;
  final Address address;
  final Map<String, dynamic>? queryParameters;

  UpdateDefaultAddressParams({
    required this.pagination,
    required this.address,
    required this.queryParameters,
  });

  @override
  List<Object?> get props => [pagination, address, queryParameters];
}
