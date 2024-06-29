/// Custom Exception
sealed class CException implements Exception {}

class NetworkException extends CException {
  final String? error;

  NetworkException([this.error]);

  @override
  String toString() => error ?? '';
}

// -----------------------------------------------------------------------------

class ServerException extends CException {
  final dynamic error;

  ServerException([this.error]);
  @override
  String toString() {
    try {
      return error.response.data['message'];
    } catch (e) {
      return error.toString();
    }
  }
}

// -----------------------------------------------------------------------------

class CacheException implements CException {
  final String? error;

  CacheException([this.error]);

  @override
  String toString() => error ?? '';
}

class CacheUserFoundException implements CacheException {
  @override
  final String? error;

  CacheUserFoundException([this.error]);

  @override
  String toString() => error ?? '';
}

// -----------------------------------------------------------------------------

class GenericException implements CException {
  final String? error;

  GenericException([this.error]);

  @override
  String toString() => error ?? '';
}

// -----------------------------------------------------------------------------

class SignalRException implements CException {
  final String? error;

  SignalRException([this.error]);

  @override
  String toString() => error ?? '';
}
