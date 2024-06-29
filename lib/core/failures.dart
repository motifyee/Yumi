import 'package:equatable/equatable.dart';
import 'package:yumi/core/exceptions.dart';

sealed class Failure {
  Object? error;
  StackTrace? stackTrace;
}

extension FailureX on Failure {
  bool get isNetworkFailure => this is NetworkFailure;

  bool get isServerFailure => this is ServerFailure;

  bool get isGenericFailure => this is GenericFailure;

  bool get isCacheFailure => this is CacheFailure;

  bool get isSignalrFailure => this is SignalrFailure;

  static Failure fromException(Object? error, StackTrace? stackTrace) {
    return switch (error as CException) {
      ServerException() => ServerFailure(error, stackTrace),
      NetworkException() => NetworkFailure(error, stackTrace),
      CacheException() => CacheFailure(error, stackTrace),
      GenericException() => GenericFailure(error, stackTrace),
      SignalRException() => SignalrFailure(error, stackTrace),
    } as Failure;
  }
}

// -----------------------------------------------------------------------------

class NetworkFailure extends Failure with EquatableMixin {
  NetworkFailure(this.error, this.stackTrace);

  @override
  final Object? error;
  @override
  final StackTrace? stackTrace;

  @override
  toString() => error.toString();

  @override
  List<Object?> get props => [stackTrace];
}

// -----------------------------------------------------------------------------

class ServerFailure extends Failure with EquatableMixin {
  ServerFailure(this.error, this.stackTrace);

  @override
  final Object? error;
  @override
  final StackTrace? stackTrace;

  @override
  toString() => error.toString();

  @override
  List<Object?> get props => [stackTrace];
}

// -----------------------------------------------------------------------------

class GenericFailure extends Failure with EquatableMixin {
  GenericFailure(this.error, this.stackTrace);

  @override
  final Object? error;
  @override
  final StackTrace? stackTrace;

  @override
  toString() => error.toString();

  @override
  List<Object?> get props => [stackTrace];
}

// -----------------------------------------------------------------------------

class CacheFailure extends Failure with EquatableMixin {
  CacheFailure(this.error, this.stackTrace);

  @override
  final Object? error;
  @override
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}

// -----------------------------------------------------------------------------

class SignalrFailure extends Failure with EquatableMixin {
  SignalrFailure(this.error, this.stackTrace);

  @override
  final Object? error;
  @override
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}
