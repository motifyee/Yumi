import 'dart:convert';

import 'package:yumi/domain/categories/entity/category.dart';
import 'package:yumi/core/exceptions.dart';
import 'package:yumi/domain/categories/data/source/categories_src.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/pagination.dart';

class CategoriesRemoteSrc implements CategoriesSrc {
  @override
  Future<Pagination<Category>> getCategories({
    bool isPreOrder = false,
    Pagination? pagination,
  }) async {
    try {
      final res = await DioClient.simpleDio().get(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.categories),
        queryParameters: {
          ...?pagination?.toJson(),
          'isPreOrder': isPreOrder,
        }..removeWhere((key, value) => value == null),
      );

      final data = jsonDecode(res.toString());

      return Pagination(
        data: data['data'].map((v) => Category.fromJson(v)).toList(),
        pageNumber: data['pagination']['page'],
        lastPage: data['pagination']['pages'],
        isLoading: false,
      );
    } catch (e) {
      throw ServerException(e);
    }
  }

  @override
  Future<Pagination<Category>> getChefCategories({
    bool isPreOrder = false,
    Pagination? pagination,
  }) async {
    try {
      final res = await DioClient.simpleDio().get(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.categoriesForChef),
        queryParameters: {
          ...?pagination?.toJson(),
          'isPreOrder': isPreOrder,
        }..removeWhere((key, value) => value == null),
      );

      final data = jsonDecode(res.toString());

      return Pagination(
        data: data['data'].map((v) => Category.fromJson(v)).toList(),
        pageNumber: data['pagination']['page'],
        lastPage: data['pagination']['pages'],
        isLoading: false,
      );
    } catch (e) {
      throw ServerException(e);
    }
  }

  @override
  Future<Pagination<Category>> getCustomerCategories({
    bool isPreOrder = false,
    double? latitude,
    double? longitude,
    Pagination? pagination,
  }) async {
    try {
      final res = await DioClient.simpleDio().get(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.categoriesForCustomer),
        queryParameters: {
          ...?pagination?.toJson(),
          'isPreOrder': isPreOrder,
          'latitude': latitude,
          'longitude': longitude,
        }..removeWhere((key, value) => value == null),
      );

      final data = jsonDecode(res.toString());

      return Pagination(
        data: data['data'].map((v) => Category.fromJson(v)).toList(),
        pageNumber: data['pagination']['page'],
        lastPage: data['pagination']['pages'],
        isLoading: false,
      );
    } catch (e) {
      throw ServerException(e);
    }
  }

  @override
  Future<Pagination<Category>> getCustomerCategoriesByChefId({
    required String chefId,
    bool isPreOrder = false,
    Pagination? pagination,
  }) async {
    try {
      final res = await DioClient.simpleDio().get(
        ApiKeys.getApiKeyString(apiKey: ApiKeys.categoriesForCustomer),
        queryParameters: {
          ...?pagination?.toJson(),
          'isPreOrder': isPreOrder,
          'chefId': chefId,
        }..removeWhere((key, value) => value == null),
      );

      final data = jsonDecode(res.toString());

      return Pagination(
        data: data['data'].map((v) => Category.fromJson(v)).toList(),
        pageNumber: data['pagination']['page'],
        lastPage: data['pagination']['pages'],
        isLoading: false,
      );
    } catch (e) {
      throw ServerException(e);
    }
  }
}
