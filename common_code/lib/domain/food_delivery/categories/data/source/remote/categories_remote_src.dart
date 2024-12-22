import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:common_code/domain/food_delivery/categories/data/source/categories_src.dart';
import 'package:common_code/common_code.dart';

class CategoriesRemoteSrc implements CategoriesSrc {
  @override
  Future<PaginatedData<Category>> getCategories({
    bool isPreOrder = false,
    PaginatedData? pagination,
  }) async {
    try {
      final res = await APIClient().get(
        Endpoints().categories,
        queryParameters: {
          ...?pagination?.toJson(),
          'isPreOrder': isPreOrder,
        }..removeWhere((key, value) => value == null),
      );

      final data = jsonDecode(res.toString());
      final List<Category> categories = (data['data'] as List)
          .map<Category>((v) => Category.fromJson(v))
          .toList();

      return PaginatedData(
        data: categories,
        pageNumber: data['pagination']['page'],
        lastPage: data['pagination']['pages'],
      );
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }

  @override
  Future<PaginatedData<Category>> getChefCategories({
    bool isPreOrder = false,
    PaginatedData? pagination,
  }) async {
    try {
      final res = await APIClient().get(
        Endpoints().categoriesForChef,
        queryParameters: {
          ...?pagination?.toJson(),
          'isPreOrder': isPreOrder,
        }..removeWhere((key, value) => value == null),
      );

      final data = jsonDecode(res.toString());
      final List<Category> categories = (data['data'] as List)
          .map<Category>((v) => Category.fromJson(v))
          .toList();

      return PaginatedData(
        data: categories,
        pageNumber: data['pagination']['page'],
        lastPage: data['pagination']['pages'],
      );
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }

  @override
  Future<PaginatedData<Category>> getCustomerCategories({
    bool isPreOrder = false,
    double? latitude,
    double? longitude,
    PaginatedData? pagination,
  }) async {
    try {
      final res = await APIClient().get(
        Endpoints().categoriesForCustomer,
        queryParameters: {
          ...?pagination?.toJson(),
          'isPreOrder': isPreOrder,
          'latitude': latitude,
          'longitude': longitude,
        }..removeWhere((key, value) => value == null),
      );

      final data = jsonDecode(res.toString());
      final List<Category> categories = (data['data'] as List)
          .map<Category>((v) => Category.fromJson(v))
          .toList();

      return PaginatedData(
        data: categories,
        pageNumber: data['pagination']['page'],
        lastPage: data['pagination']['pages'],
      );
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }

  @override
  Future<PaginatedData<Category>> getCustomerCategoriesByChefId({
    required String chefId,
    bool isPreOrder = false,
    PaginatedData? pagination,
  }) async {
    try {
      final res = await APIClient().get(
        Endpoints().categoriesForCustomerByChefId,
        queryParameters: {
          ...?pagination?.toJson(),
          'isPreOrder': isPreOrder,
          'chefId': chefId,
        }..removeWhere((key, value) => value == null),
      );

      final data = jsonDecode(res.toString());
      final List<Category> categories = (data['data'] as List)
          .map<Category>((v) => Category.fromJson(v))
          .toList();

      return PaginatedData<Category>(
        data: categories,
        pageNumber: data['pagination']['page'],
        lastPage: data['pagination']['pages'],
      );
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }
}
