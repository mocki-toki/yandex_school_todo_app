import 'package:todo_app/core/domain/domain.dart';

enum DomainFailureType {
  unexpected,
}

class DomainFailure extends Failure<DomainFailureType> {
  const DomainFailure(super.type, {required super.exception});
}
