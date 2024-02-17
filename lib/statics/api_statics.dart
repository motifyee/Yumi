import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:yumi/statics/app_target.dart';

const originApi = 'https://10.99.77.247:5012';

class DioClient {
  Dio _dio = Dio();

  static Dio simpleDio() {
    Dio dio = Dio(
      BaseOptions(
          baseUrl: originApi,
          headers: {'Content-Type': 'application/json; charset=UTF-8'}),
    );
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      HttpClient dioClient = HttpClient();
      dioClient.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };
    return dio;
  }

  static Dio dioWithCookie(String cookie) {
    return Dio(BaseOptions(baseUrl: originApi, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Cookie': cookie
    }));
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
}
