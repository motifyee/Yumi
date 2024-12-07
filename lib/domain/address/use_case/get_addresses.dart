import 'package:common_code/common_code.dart';
import 'package:fpdart/src/either.dart';
import 'package:yumi/domain/address/data/repo/address_repo.dart';

class GetAddresses extends UseCase<PaginatedData<Address>, GetAddressesParams> {
  final AddressRepo addressRepo;

  GetAddresses({AddressRepo? addressRepo})
      : addressRepo = addressRepo ?? getIt<AddressRepo>();

  @override
  Future<Either<Failure, PaginatedData<Address>>> call(
      GetAddressesParams params) async {
    return await addressRepo
        .getAddresses(
            pagination: params.pagination,
            queryParameters: params.queryParameters)
        .run();
  }
}

class GetAddressesParams extends Params {
  final PaginatedData<Address> pagination;
  final Map<String, dynamic>? queryParameters;

  GetAddressesParams({required this.pagination, required this.queryParameters});

  @override
  List<Object?> get props => [pagination, queryParameters];
}
