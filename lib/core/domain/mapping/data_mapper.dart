import 'package:todo_app/core/domain/domain.dart';

extension DataMapper<T> on Future<T> {
  Future<Either<Failure, R>> toEntity<R>([R Function(T data)? extract]) async {
    try {
      final response = await this;
      return Right(extract?.call(response) ?? response as R);
    } on DioError catch (e) {
      ServerFailureType failureType;
      final statusCode = e.response?.statusCode;

      switch (statusCode) {
        case 400:
          if (e.response?.data == 'unsynchronizedData') {
            failureType = ServerFailureType.unsynchronizedData;
          } else {
            failureType = ServerFailureType.unexpected;
          }
          break;
        case 401:
          failureType = ServerFailureType.notAuthorized;
          break;
        case 404:
          failureType = ServerFailureType.notFound;
          break;
        case 500:
          failureType = ServerFailureType.serverError;
          break;
        default:
          failureType = ServerFailureType.unexpected;
          break;
      }

      return Left(ServerFailure(
        failureType,
        exception: e,
      ));
    } catch (e) {
      return Left(DomainFailure(
        DomainFailureType.unexpected,
        exception: e,
      ));
    }
  }
}
