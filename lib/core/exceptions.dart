class ApiException implements Exception {}

class UserNotFoundException implements ApiException {
  final String id;

  UserNotFoundException({required this.id});
}

// -----------------------------------------------------------------------------

class CacheException implements Exception {}

class CacheUserFoundException implements CacheException {}
