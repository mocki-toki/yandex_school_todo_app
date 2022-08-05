import 'dart:async';

import 'package:logging/logging.dart';
import 'package:todo_app/core/domain/domain.dart';

extension EitherExtensions<T> on Either<Failure, T> {
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
      FutureOr<Either<Failure, T>> Function(T data) onData) {
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

  void log(Logger logger) {
    fold(
      (failure) {
        final prefix = 'Failure: ${failure.type}';
        var details = '';

        if (failure.exception is DioError &&
            failure.exception.requestOptions.path != null) {
          details = '\nPath: ${failure.exception.requestOptions.path}';
        }

        if (failure.type == DomainFailureType.unexpected) {
          details = '\n${failure.exception?.stackTrace}';
        }

        try {
          logger.warning("$prefix$details\n${failure.exception?.type}");
        } catch (_) {
          logger.warning("$prefix$details\n${failure.exception}");
        }
      },
      (response) {
        final prefix = 'Success: ${response.runtimeType}';
        logger.info("$prefix\n$response");
      },
    );
  }
}
