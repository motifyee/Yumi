import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yumi/bloc/user/user_bloc.dart';
import 'package:yumi/statics/app_target.dart';

const originApi = 'https://10.99.77.247:5012';

class DioClient {
  static Dio simpleDio(BuildContext context) {
    Dio dio = Dio(
      BaseOptions(baseUrl: originApi, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization':
            'Bearer ${context.read<UserBloc>().state.user.accessToken}',
      }),
    );

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
  static String categories = '/products/setting/categories';
}
