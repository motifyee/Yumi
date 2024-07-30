import 'package:dio/dio.dart';
import 'package:common_code/domain/food_delivery/chef/data/sources/chef_src.dart';
import 'package:common_code/domain/food_delivery/chef/entity/chef.dart';
import 'package:common_code/domain/food_delivery/chef/entity/chef_work_status.dart';
import 'package:common_code/common_code.dart';

import 'package:common_code/domain/entities/pagination.dart';

class ChefRemoteSrc implements ChefSrc {
  @override
  Future<bool> addFavouriteChef(String chefId) async {
    try {
      final res = await APIClient().post<String>(
        EndPoints.favoriteChefs,
        data: {'code': CodeGenerator.getRandomCode(codeLength: 15)},
        queryParameters: {'chefId': chefId},
      );

      return res.statusCode == 200 ? true : false;
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }

  @override
  Future<ChefWorkStatus> getChefWorkStatus(String chefId) async {
    final Response res;

    try {
      res = await APIClient().get(
        EndPoints.chefStatus,
        queryParameters: {'accountId': chefId},
      );
    } catch (e) {
      throw ServerException(e as DioException);
    }

    if (res.statusCode != 200) throw ServerException();

    return ChefWorkStatus.values.firstWhere(
      (e) => e.index == res.data['statusWork'],
      orElse: () => throw GenericException(),
    );
  }

  @override
  Future<PaginatedData<Chef>> getChefs({
    required bool isPreOrder,
    required ChefWorkStatus? workStatus,
    required double latitude,
    required double longitude,
    required Pagination pagination,
  }) async {
    try {
      final Response res = await APIClient().get(
          EndPoints.getApiKeyString(
            apiKey: isPreOrder ? EndPoints.chefsPreOrder : EndPoints.chefsOrder,
          ),
          queryParameters: {...pagination.toJson(), 'status_Work': isPreOrder ? null : workStatus?.index ?? ChefWorkStatus.open.index, 'latitude': latitude, 'longitude': longitude}..removeWhere((key, value) => value == null));

      final chefs = (res.data['data'] as List<dynamic>).map((e) => Chef.fromJson({...e, ...e['chef']})).toList();

      return PaginatedData<Chef>(
        data: chefs,
        total: res.data['pagination']['total'],
        pageNumber: res.data['pagination']['page'],
        lastPage: res.data['pagination']['pages'],
      );
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }

  @override
  Future<PaginatedData<Chef>> getFavouriteChefs(
    Pagination pagination,
  ) async {
    try {
      final res = await APIClient().get(
        EndPoints.favoriteChefs,
        queryParameters: {...pagination.toJson()},
      );

      List<Chef> chefs = res.data['data'].map<Chef>((e) => Chef.fromJson({...e, ...e['chef']})).toList();

      return PaginatedData<Chef>(
        data: chefs,
        isLoading: false,
        pageNumber: res.data['pagination']['page'],
        lastPage: res.data['pagination']['pages'],
        total: res.data['pagination']['total'],
      );
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }

  @override
  Future<bool> isFavouriteChef(String chefId) async {
    try {
      final res = await APIClient().get(
        EndPoints.favoriteChef,
        queryParameters: {'chefId': chefId},
      );

      return res.data['isChefFavorit'] as bool;
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }

  @override
  Future<bool> removeFavouriteChef(String chefId) async {
    try {
      final res = await APIClient().delete(
        EndPoints.favoriteChefs,
        queryParameters: {'chefId': chefId},
      );

      return res.statusCode == 200 ? true : false;
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }
}
