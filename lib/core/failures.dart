import 'package:equatable/equatable.dart';

abstract class Failure {}

// -----------------------------------------------------------------------------

class ApiFailure extends Failure with EquatableMixin {
  ApiFailure(this.error, this.stackTrace);

  final Object? error;
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}

// -----------------------------------------------------------------------------

class GenericFailure extends Failure with EquatableMixin {
  GenericFailure(this.error, this.stackTrace);

  final Object? error;
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}

// -----------------------------------------------------------------------------

class CacheFailure extends Failure with EquatableMixin {
  CacheFailure(this.error, this.stackTrace);

  final Object? error;
  final StackTrace? stackTrace;

  @override
  List<Object?> get props => [stackTrace];
}
