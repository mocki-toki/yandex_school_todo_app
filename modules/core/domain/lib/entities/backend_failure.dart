import 'package:core_domain/core_domain.dart';

enum BackendFailureType {
  duplicateItem,
  unsynchronizedData,

  notFound,
  serverError,
  connectionError,
  unexpected,
}

class BackendFailure extends Failure<BackendFailureType> {
  const BackendFailure(super.type, {super.exception});
}
