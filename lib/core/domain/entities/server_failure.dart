import 'package:todo_app/core/domain/domain.dart';

enum ServerFailureType {
  unsynchronizedData,
  notAuthorized,
  notFound,
  serverError,
  connection,
  unexpected,
}

class ServerFailure extends Failure<ServerFailureType> {
  const ServerFailure(super.type, {required super.exception});
}
