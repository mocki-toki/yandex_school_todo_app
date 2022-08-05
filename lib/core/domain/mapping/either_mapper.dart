import 'dart:async';

import 'package:todo_app/core/domain/domain.dart';

extension EitherMapper<T> on Either<Failure, T> {
  void onData(void Function(T data) onData) {
    if (isRight()) {
      onData(getRight().toNullable() as T);
    }
  }

  void onFailure(void Function(Failure failure) onFailure) {
    if (isLeft()) {
      onFailure(getLeft().toNullable() as Failure);
    }
  }

  FutureOr<Either<Failure, T>> mapData(
    FutureOr<Either<Failure, T>> Function(T data) onData,
  ) {
    return fold(
      (failure) => Left(failure),
      (data) {
        return onData(data);
      },
    );
  }

  Either<Failure, T> mapFailure(Failure Function(Failure failure) onFailure) {
    return fold(
      (failure) => Left(onFailure(failure)),
      (data) => Right(data),
    );
  }
}
