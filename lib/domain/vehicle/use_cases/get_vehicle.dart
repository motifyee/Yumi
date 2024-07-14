import 'package:fpdart/fpdart.dart';
import 'package:common_code/common_code.dart';
import 'package:yumi/domain/vehicle/data/repos/vehicle_repo.dart';
import 'package:yumi/domain/vehicle/entities/vehicle.dart';

class GetVehicle extends UseCase<Vehicle, NoParams> {
  final VehicleRepo repo;

  GetVehicle({VehicleRepo? transactionRepo})
      : repo = transactionRepo ?? getIt<VehicleRepo>();

  @override
  Future<Either<Failure, Vehicle>> call(NoParams params) =>
      repo.getVehicle().run();
}
