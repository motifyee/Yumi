import 'package:equatable/equatable.dart';
import 'package:yumi/core/exceptions.dart';

abstract class Failure {
  String? error;
  StackTrace? stackTrace;
  bool get isNetworkFailure => this is NetworkFailure;

  bool get isServerFailure => this is ServerFailure;

  bool get isGenericFailure => this is GenericFailure;

  bool get isCacheFailure => this is CacheFailure;

  bool get isSignalrFailure => this is SignalrFailure;

  static Failure fromException(String? error) {
    return switch (error as CException) {
      ServerException() => ServerFailure(error),
      NetworkException() => NetworkFailure(error),
      CacheException() => CacheFailure(error),
      GenericException() => GenericFailure(error),
      SignalRException() => SignalrFailure(error),
    } as Failure;
  }
}

// -----------------------------------------------------------------------------

class NetworkFailure extends Failure with EquatableMixin {
  NetworkFailure(this.error);

  @override
  final String? error;

  @override
  toString() => error.toString();

  @override
  List<Object?> get props => [error, stackTrace];
}

// -----------------------------------------------------------------------------

class ServerFailure extends Failure with EquatableMixin {
  ServerFailure(this.error);

  @override
  final String? error;

  @override
  toString() => error ?? '';

  @override
  List<Object?> get props => [error];
}

// -----------------------------------------------------------------------------

class GenericFailure extends Failure with EquatableMixin {
  GenericFailure(this.error);

  @override
  final String? error;

  @override
  toString() => error ?? '';

  @override
  List<Object?> get props => [error];
}

// -----------------------------------------------------------------------------

class CacheFailure extends Failure with EquatableMixin {
  CacheFailure(this.error);

  @override
  final String? error;

  @override
  toString() => error ?? '';

  @override
  List<Object?> get props => [error, stackTrace];
}

// -----------------------------------------------------------------------------

class SignalrFailure extends Failure with EquatableMixin {
  SignalrFailure(this.error);

  @override
  final String? error;

  @override
  toString() => error ?? '';

  @override
  List<Object?> get props => [error, stackTrace];
}
