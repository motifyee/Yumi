sealed class CException implements Exception {}

class NetworkException extends CException {}

// -----------------------------------------------------------------------------

class ServerException extends CException {
  final Object? error;

  ServerException([this.error]);
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
