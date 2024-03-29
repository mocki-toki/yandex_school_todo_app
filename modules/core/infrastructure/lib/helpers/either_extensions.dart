import 'package:core_domain/core_domain.dart';
import 'package:core_infrastructure/core_infrastructure.dart';

extension EitherExtensions<T> on Either<Failure, T> {
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
