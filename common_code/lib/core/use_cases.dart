import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:common_code/core/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}
