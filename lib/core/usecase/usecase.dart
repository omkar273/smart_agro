import 'package:fpdart/fpdart.dart';
import 'package:smart_agro/core/error/failure.dart';

abstract interface class Usecase<ReturnType, ParamType> {
  Future<Either<Failure, ReturnType>> call(ParamType param);
}

class NoParams {}

class NoReturnType {}
