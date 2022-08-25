import 'package:core_domain/core_domain.dart';

enum DomainFailureType {
  unexpected,
}

class DomainFailure extends Failure<DomainFailureType> {
  const DomainFailure(super.type, {required super.exception});
}
