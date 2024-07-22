import 'package:common_code/util/random_string.dart';
import 'package:dio/dio.dart';
import 'package:common_code/domain/user/cubit/user_cubit.dart';
import 'package:common_code/domain/vehicle/data/sources/vehicle_src.dart';
import 'package:common_code/domain/vehicle/entities/vehicle.dart';
import 'package:common_code/common_code.dart';

class VehicleRemoteSrc implements VehicleSrc {
  @override
  Future<String> addVehicle(Vehicle vehicle) async {
    var v = vehicle.copyWith(code: getRandomString(15)).toJson();

    try {
      final Response res = await APIClient().post(
        '/drivers/vehicle',
        data: v,
      );

      return res.data;
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }

  @override
  Future<Vehicle> getVehicle() async {
    try {
      final Response res = await APIClient().get(
        '/drivers/vehicle',
      );

      return Vehicle.fromJson(res.data);
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }

  @override
  Future<String> updateVehicle(Vehicle vehicle, String userId) async {
    var v = vehicle.toJson();

    v.remove('code');
    if (v['Other_Type'] == null) v['Other_Type'] = '';

    try {
      final Response res = await APIClient().put(
        '/drivers/vehicle/$userId',
        data: vehicle.toJson(),
      );

      return res.data;
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }
}
