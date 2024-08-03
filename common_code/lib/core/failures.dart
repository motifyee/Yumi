import 'package:equatable/equatable.dart';
import 'package:common_code/core/exceptions.dart';

abstract class Failure {
  final String? error;

  Failure(this.error);

  bool get isNetworkFailure => this is NetworkFailure;

  bool get isServerFailure => this is ServerFailure;

  bool get isGenericFailure => this is GenericFailure;

  bool get isCacheFailure => this is CacheFailure;

  bool get isSignalrFailure => this is SignalrFailure;

  static Failure fromException(Object error) {
    if (error is! CException) return GenericFailure(error.toString());

    return switch (error) {
      ServerException() => ServerFailure(error.toString()),
      NetworkException() => NetworkFailure(error.toString()),
      CacheException() => CacheFailure(error.toString()),
      GenericException() => GenericFailure(error.toString()),
      SignalRException() => SignalrFailure(error.toString()),
    };
  }
}

// -----------------------------------------------------------------------------

class NetworkFailure extends Failure with EquatableMixin {
  NetworkFailure([super.error]);

  @override
  toString() => error.toString();

  @override
  List<Object?> get props => [error];
}

// -----------------------------------------------------------------------------

class ServerFailure extends Failure with EquatableMixin {
  ServerFailure([super.error]);

  @override
  toString() => error ?? '';

  @override
  List<Object?> get props => [error];
}

// -----------------------------------------------------------------------------

class GenericFailure extends Failure with EquatableMixin {
  GenericFailure([super.error]);

  @override
  toString() => error ?? '';

  @override
  List<Object?> get props => [error];
}

// -----------------------------------------------------------------------------

class CacheFailure extends Failure with EquatableMixin {
  CacheFailure([super.error]);

  @override
  toString() => error ?? '';

  @override
  List<Object?> get props => [error];
}

// -----------------------------------------------------------------------------

class SignalrFailure extends Failure with EquatableMixin {
  SignalrFailure([super.error]);

  @override
  toString() => error ?? '';

  @override
  List<Object?> get props => [error];
}
