import 'package:common_code/common_code.dart';
import 'package:fpdart/src/either.dart';
import 'package:yumi/domain/address/data/repo/address_repo.dart';

class DeleteAddress extends UseCase<PaginatedData<Address>, DeleteAddressParams> {
  final AddressRepo addressRepo;

  DeleteAddress({AddressRepo? addressRepo}) : addressRepo = addressRepo ?? getIt<AddressRepo>();
  @override
  Future<Either<Failure, PaginatedData<Address>>> call(DeleteAddressParams params) async {
    return await addressRepo.deleteAddresses(pagination: params.pagination, address: params.address, queryParameters: params.queryParameters).run();
  }
}

class DeleteAddressParams extends Params {
  final PaginatedData<Address> pagination;
  final Address address;
  final Map<String, dynamic>? queryParameters;

  DeleteAddressParams({required this.pagination, required this.address, required this.queryParameters});
  @override
  List<Object?> get props => [pagination, address, queryParameters];
}
