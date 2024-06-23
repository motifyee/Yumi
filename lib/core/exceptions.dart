sealed class CException implements Exception {}

class NetworkException extends CException {}

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

class UserNotFoundException extends ServerException {
  final String id;

  UserNotFoundException({required this.id});
}

// -----------------------------------------------------------------------------

class CacheException implements CException {}

class CacheUserFoundException implements CacheException {}

// -----------------------------------------------------------------------------

class GenericException implements CException {}

// -----------------------------------------------------------------------------

class SignalRException implements CException {}
