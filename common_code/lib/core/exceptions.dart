import 'package:dio/dio.dart';

/// Custom Exception
sealed class CException implements Exception {
  late String? error;

  CException([String? error = '']) {
    print('CException .........');
    print(error);
    this.error = error;
  }

  @override
  String toString() => error ?? '';
}

class NetworkException extends CException {
  NetworkException([super.error = '']);
}

// -----------------------------------------------------------------------------

class ServerException extends CException {
  ServerException([DioException? error]) : super(error?.response?.data.runtimeType == String ? error?.response?.data : error?.response?.data?['message'] ?? '');
}

// -----------------------------------------------------------------------------

class CacheException extends CException {
  CacheException([super.error = '']);
}

class CacheUserFoundException extends CacheException {
  CacheUserFoundException([super.error = '']);
}

// -----------------------------------------------------------------------------

class GenericException extends CException {
  GenericException([super.error = '']);
}

// -----------------------------------------------------------------------------

class SignalRException extends CException {
  SignalRException([super.error = '']);
}
