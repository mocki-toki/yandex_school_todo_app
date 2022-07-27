import 'package:logging/logging.dart';
import 'package:todo_app/core/domain/domain.dart';

extension EitherMapper<T> on Either<Failure, T> {
  S toState<S>(
    S Function(T data) onSuccess,
    S Function(Failure failure) onFailure,
  ) {
    return fold<S>(onFailure, onSuccess);
  }

  void log(Logger logger) {
    fold(
      (failure) {
        final prefix = 'Failure: ${failure.type}';
        final url = failure.exception is DioError &&
                failure.exception.requestOptions.path != null
            ? '\nPath: ${failure.exception.requestOptions.path}'
            : '';

        logger.warning("$prefix$url\n${failure.exception?.message}");
      },
      (response) {
        final prefix = 'Success: ${response.runtimeType}';
        logger.info("$prefix\n$response");
      },
    );
  }
}
