import 'package:dio/dio.dart';
import 'package:yumi/core/exceptions.dart';
import 'package:yumi/domain/chef/data/sources/chef_src.dart';
import 'package:yumi/domain/chef/entity/chef.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/code_generator.dart';
import 'package:yumi/statics/pagination.dart';

class ChefRemoteSrc implements ChefSrc {
  @override
  Future<bool> addFavouriteChef(String chefId) async {
    try {
      final res = await DioClient.simpleDio().post<String>(
        ApiKeys.favoriteChefs,
        data: {'code': CodeGenerator.getRandomCode(codeLength: 15)},
        queryParameters: {'chefId': chefId},
      );

      return res.statusCode == 200 ? true : false;
    } catch (e) {
      throw ServerException(e);
    }
  }

  @override
  Future<ChefWorkStatus> getChefWorkStatus(String chefId) async {
    final Response res;

    try {
      res = await DioClient.simpleDio().get(
        ApiKeys.chefStatus,
        queryParameters: {'accountId': chefId},
      );
    } catch (e) {
      throw ServerException(e);
    }

    if (res.statusCode != 200) throw ServerException();

    return ChefWorkStatus.values.firstWhere(
      (e) => e == res.data['statusWork'],
      orElse: () => throw GenericException(),
    );
  }

  @override
  Future<Pagination<Chef>> getChefs({
    required bool isPreOrder,
    required double latitude,
    required double longitude,
    required ChefWorkStatus status,
    required Pagination pagination,
  }) async {
    try {
      final Response res = await DioClient.simpleDio().get(
          ApiKeys.getApiKeyString(
            apiKey: isPreOrder ? ApiKeys.chefsPreOrder : ApiKeys.chefsOrder,
          ),
          queryParameters: {
            ...pagination.toJson(),
            'status_Work': isPreOrder ? null : status.index,
            'latitude': latitude,
            'longitude': longitude
          }..removeWhere((key, value) => value == null));

      final chefs = (res.data['data'] as List<dynamic>)
          .map((e) => Chef.fromJson({...e, ...e['chef']}))
          .toList();

      return Pagination(
        data: chefs,
        total: res.data['total'],
        pageNumber: res.data['pagination']['page'],
        lastPage: res.data['pagination']['pages'],
      );
    } catch (e) {
      throw ServerException(e);
    }
  }

  @override
  Future<Pagination<Chef>> getFavouriteChefs(Pagination pagination) async {
    try {
      final res = await DioClient.simpleDio().get(
        ApiKeys.favoriteChefs,
        queryParameters: {...pagination.toJson()},
      );

      final chefs = (res.data['data'] as List<dynamic>)
          .map<Chef>((e) => Chef.fromJson({...e, ...e['chef']}))
          .toList();

      return Pagination(
        data: chefs,
        isLoading: false,
        pageNumber: res.data['pagination']['page'],
        lastPage: res.data['pagination']['pages'],
        total: res.data['count'],
      );
    } catch (e) {
      throw ServerException(e);
    }
  }

  @override
  Future<bool> isFavouriteChef(String chefId) async {
    try {
      final res = await DioClient.simpleDio().get(
        ApiKeys.favoriteChef,
        queryParameters: {'chefId': chefId},
      );

      return res.data['isChefFavorit'] as bool;
    } catch (e) {
      throw ServerException(e);
    }
  }

  @override
  Future<bool> removeFavouriteChef(String chefId) async {
    try {
      final res = await DioClient.simpleDio().delete(
        ApiKeys.favoriteChefs,
        queryParameters: {'chefId': chefId},
      );

      return res.statusCode == 200 ? true : false;
    } catch (e) {
      throw ServerException(e);
    }
  }
}
