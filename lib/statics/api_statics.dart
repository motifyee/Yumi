import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/bloc/user/user_bloc.dart';

// const originApi = 'https://10.99.77.247:5012';
const originApi = 'https://0cb4-81-10-105-81.ngrok-free.app';

class DioClient {
  static Dio simpleDio(BuildContext context) {
    var token = context.read<UserBloc>().state.user.accessToken;
    // final prefs = await SharedPreferences.getInstance();
    // final token = await prefs.getString('token');

    Dio dio = Dio(
      BaseOptions(baseUrl: originApi, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer $token',
      }),
    );

    if (kIsWeb) return dio;

    /// this is for local network ssl. problem
    /// must be commented in publish
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      HttpClient dioClient = HttpClient();
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    return dio;
  }
}

class ApiKeys {
  static String getApiKeyString({required String apiKey}) {
    return apiKey.replaceAll("_", AppTarget.user.name);
  }

  /// user ( _ ) where
  /// chefs || customers || drivers
  /// at in api end point

  static String login = '/accounts/_/login';
  static String signup = '/accounts/_/register';
  static String profile = '/accounts/_';
  static String info = '/_';
  static String categories = '/products/setting/categories';
  static String categoriesForChef = '/meals/categories/chef';
  static String categoriesForCustomer = '/meals/categories';
  static String ingredient = '/Product/Ingredients';
  static String meal = '/Product/_/meal';
  static String getMeal = '/meals';
  static String getMealByCategory = '/meals/category';
  static String getMealByChef = '/meals/chef';
  static String getMealByChefByCategory = '/meals/category/chef';
  static String mealCalories = '/Product/_/calories';
  static String chefs = '/accounts/chefs';
  static String chefsOrder = '/accounts/chefs/Order';
  static String chefsPreOrder = '/accounts/chefs/PreOrder';
  static String preOrderDelivery = '/preorder/delivery';
  static String preOrderPickUp = '/preorder/pickup';
}
