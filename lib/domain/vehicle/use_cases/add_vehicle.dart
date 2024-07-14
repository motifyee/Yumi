import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/vehicle/data/repos/vehicle_repo.dart';
import 'package:yumi/domain/vehicle/entities/vehicle.dart';

class AddVehicle extends UseCase<String, AddVehicleParams> {
  final VehicleRepo repo;

  AddVehicle({VehicleRepo? transactionRepo})
      : repo = transactionRepo ?? getIt<VehicleRepo>();

  @override
  Future<Either<Failure, String>> call(AddVehicleParams params) =>
      repo.addVehicle(params.vehicle).run();
}

class AddVehicleParams extends Params {
  final Vehicle vehicle;

  AddVehicleParams({required this.vehicle});

  @override
  List<Object?> get props => [vehicle];
}
