import 'package:equatable/equatable.dart';

sealed class Failure {
  Object? error;
  StackTrace? stackTrace;
}

// -----------------------------------------------------------------------------

class NetworkFailure extends Failure with EquatableMixin {
  NetworkFailure(this.error, this.stackTrace);

  @override
  final Object? error;
  @override
  final StackTrace? stackTrace;

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
