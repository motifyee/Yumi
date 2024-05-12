import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/global.dart';
import 'package:yumi/route/route.gr.dart';

// const originApi = 'https://10.99.77.247:5012';
const originApi = 'https://vroot.tarabia.online';

class DioClient {
  static Dio get dio => simpleDio();
  static Dio simpleDio([BuildContext? context]) {
    var token = G.cContext.read<UserBloc>().state.user.accessToken;
    // final prefs = await SharedPreferences.getInstance();
    // final token = await prefs.getString('token');

    Dio dio = Dio(
      BaseOptions(baseUrl: originApi, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Bearer $token',
      }),
    )..interceptors.add(InterceptorsWrapper(
        onError: (error, handler) {
          debugPrint('dio error >>>>>>>>>>>>>>>>>>>>>>>>');
          debugPrint('error code : ${error.response?.statusCode.toString()}');
          debugPrint('error type : ${error.type}');
          debugPrint('error error : ${error.error}');
          debugPrint('error response: ${error.response.toString()}');
          debugPrint('dio error <<<<<<<<<<<<<<<<<<<<<<<<');

          if (error.response?.statusCode == 401) {
            G.context.read<UserBloc>().add(UserResetEvent());
            G.context.router.replaceAll([LoginRoute()]);
          }
          handler.next(error);
        },
      ));

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
    return apiKey.replaceAll("_", G.appName);
  }

  static String actionApiKeyString(
      {required String apiKey, required String id}) {
    return apiKey.replaceAll("_", id);
  }

  /// user ( _ ) where
  /// chefs || customers || drivers
  /// at in api end point

  static String login = '/accounts/_/login';
  static String signup = '/accounts/_/register';
  static String profile = '/accounts/_';
  static String info = '/_';
  static String address = '/accounts/address';
  static String userStatus = '/accounts/status';
  static String notifications = '/notifications';
  static String transactions = '/account/transactions';
  static String wallet = '/account/balance';

  static String categories = '/categories';
  static String categoriesForChef = '/meals/categories/chef';
  static String categoriesForCustomer = '/meals/categories';
  static String categoriesForCustomerByChefId = '/meals/categories/chef';
  static String ingredient = '/Product/Ingredients';

  static String meal = '/Product/_/meal'; // _ => chefs
  static String getMeal = '/meals';
  static String getMealById = '/product/meal/_'; // _ => id
  static String getMealByCategory = '/meals/category';
  static String getMealByChef = '/meals/chef';
  static String getMealByChefByCategory = '/meals/category/chef';
  static String favoriteMeals = '/meals/favorite';
  static String mealCalories = '/Product/_/calories';

  static String chefs = '/accounts/chefs';
  static String chefsOrder = '/accounts/chefs/Order';
  static String chefsPreOrder = '/accounts/chefs/PreOrder';
  static String favoriteChefs = '/accounts/favorite';

  static String preOrderDelivery = '/preorder/delivery';
  static String preOrderPickUp = '/preorder/pickup';
  static String orderDelivery = '/order/delivery';
  static String orderPickUp = '/order/pickup';
  static String order = '/order';

  // get order && get preOrder X(
  static String preOrderCustomerActive = '/preorder/customer/active';
  static String preOrderCustomerClosed = '/preorder/customer/closed';
  static String orderCustomerActive = '/order/customer/active';
  static String orderCustomerClosed = '/order/customer/closed';
  static String orderDriverAvailable = '/order/driver/available';
  static String orderDriverActive = '/order/driver/active';
  static String orderDriverClosed = '/order/driver/closed';
  static String preOrderDriverAvailable = '/preorder/driver/available';
  static String preOrderDriverActive = '/preorder/driver/active';
  static String preOrderDriverClosed = '/preorder/driver/closed';
  static String orderDriverAvailableById = '/order/driver/available/';
  static String orderChefReceived = '/order/chef/received';
  static String orderChefPreparing = '/order/chef/preparing';
  static String orderChefReady = '/order/chef/ready';
  static String orderChefClosed = '/order/chef/closed';
  static String preOrderChefReceived = '/preorder/chef/received';
  static String preOrderChefAccepted = '/preorder/chef/accepted';
  static String preOrderChefPreparing = '/preorder/chef/preparing';
  static String preOrderChefReady = '/preorder/chef/ready';
  static String preOrderChefClosed = '/preorder/chef/closed';

  // action order && preOrder
  /// replace ( _ ) with order id
  static String orderDriverAccept = '/order/_/driver/accept';
  static String orderDriverReceived = '/order/_/driver/received';
  static String orderDriverDelivered = '/order/delivery/driver/delivered';
  static String preOrderDriverAccept = '/preorder/_/driver/accept';
  static String preOrderDriverReceived = '/preorder/_/driver/received';
  static String preOrderDriverDelivered = '/preorder/delivery/driver/delivered';

  static String orderChefDeliveryStart = '/order/_/chef/start';
  static String orderChefDeliveryFinished = '/order/_/chef/finished';
  static String orderChefPickUpStart = '/order/_/chef/pickup/start';
  static String orderChefPickUpFinished = '/order/_/chef/pickup/finished';
  static String orderChefPickUpDelivered = '/order/pickup/chef/delivered';

  static String preOrderChefDeliveryAccept = '/preorder/_/chef/accept';
  static String preOrderChefDeliveryStart = '/preorder/_/chef/start';
  static String preOrderChefDeliveryFinished = '/preorder/_/chef/finished';
  static String preOrderChefPickUpAccept = '/preorder/_/chef/pickup/accept';
  static String preOrderChefPickUpStart = '/preorder/_/chef/pickup/start';
  static String preOrderChefPickUpFinished = '/preorder/_/chef/pickup/finished';
  static String preOrderChefPickUpDelivered = '/preorder/pickup/chef/delivered';

  static String waitChefOrder = '/order/wait/chef';
  static String cancelChefOrder = '/order/cancel/chef';
  static String waitDriverOrder = '/order/wait/driver';
  static String cancelDriverOrder = '/order/cancel/driver';

  static String updateInvoice = '/api/Invoices/UpdateRestaurantInvoice/_/48';

  static String review = '/accounts/review';
}
