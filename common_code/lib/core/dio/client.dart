import 'dart:io';

import 'package:common_code/common_code.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

class APIClient {
  late final Dio _dio;

  static APIClient _instance = APIClient._init();

  factory APIClient() => _instance;

  APIClient._init() {
    _dio = Dio(
      BaseOptions(baseUrl: baseUrl),
    )..interceptors.addAll([
        ...interceptors,
      ]);

    if (kIsWeb || !kReleaseMode) return;

    // this is for local network ssl certificate error
    // must be removed in production
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      HttpClient dioClient = HttpClient();

      // (X509Certificate cert, String host, int port) => true;
      dioClient.badCertificateCallback = ((_, __, ___) => true);
      return dioClient;
    };
  }

  // config
  static String _baseUrl = 'https://vroot.tarabia.online';
  // static String _baseUrl = 'https://beat.vroot.com:8099';
  static String get baseUrl => _baseUrl;
  static set baseUrl(String baseUrl) {
    _baseUrl = baseUrl;
    _instance = APIClient._init();
  }

  static String Function() _getToken = () => '';
  static String Function() get getToken => _getToken;
  static set getToken(String Function() getToken) {
    _getToken = getToken;
    _instance = APIClient._init();
  }

  static String? _token;
  static String? get token => _token;
  static set token(String? token) {
    _token = token;
    _instance = APIClient._init();
  }

  static List<Interceptor> interceptors = [];
  static void addInterceptor(Interceptor interceptor) {
    interceptors.add(interceptor);
    _instance = APIClient._init();
  }

  static void removeInterceptor(Interceptor interceptor) {
    interceptors.removeWhere((e) => e == interceptor);
    _instance = APIClient._init();
  }

  Future<Response<T>> get<T>(
    String url, {
    dynamic queryParameters,
    bool throwOnEmptyToken = false,
  }) async {
    if (throwOnEmptyToken && getToken().isEmpty) throw GenericException();

    return await _instance._dio.get(url, queryParameters: queryParameters);
  }

  Future<Response<T>> post<T>(
    String url, {
    dynamic data,
    dynamic queryParameters,
    bool throwOnEmptyToken = false,
  }) async {
    if (throwOnEmptyToken && getToken().isEmpty) throw GenericException();

    return await _instance._dio.post(
      url,
      queryParameters: queryParameters,
      data: data,
    );
  }

  Future<Response<T>> put<T>(
    String url, {
    dynamic data,
    dynamic queryParameters,
    bool throwOnEmptyToken = false,
  }) async {
    if (throwOnEmptyToken && getToken().isEmpty) throw GenericException();

    return await _instance._dio.put(
      url,
      queryParameters: queryParameters,
      data: data,
    );
  }

  Future<Response<T>> delete<T>(
    String url, {
    dynamic data,
    dynamic queryParameters,
    bool throwOnEmptyToken = false,
  }) async {
    if (throwOnEmptyToken && getToken().isEmpty) throw GenericException();

    return await _instance._dio.delete(
      url,
      queryParameters: queryParameters,
    );
  }
}
