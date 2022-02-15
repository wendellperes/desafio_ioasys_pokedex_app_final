import 'dart:async';

import 'package:dartz/dartz.dart';

abstract class IUseCase<M, Params> {
  FutureOr<Either<Exception, M>> call(Params params);
}
