import 'dart:async';
import 'dart:io';

import 'package:todo_app/core/domain/domain.dart';

extension DataMapper<T> on T {
  Either<Failure, R> toEntity<R>([R Function(T data)? extract]) {
    try {
      final response = this;
      return Right(extract?.call(response) ?? response as R);
    } on DioError catch (e) {
      return Left(_catchDioError(e));
    } on StorageException catch (e) {
      return Left(_catchStorageException(e));
    } catch (e) {
      return Left(_catchUnexpectedException(e));
    }
  }
}

extension FutureDataMapper<T> on Future<T> {
  Future<Either<Failure, R>> toEntity<R>([R Function(T data)? extract]) async {
    try {
      final response = await this;
      return Right(extract?.call(response) ?? response as R);
    } on DioError catch (e) {
      return Left(_catchDioError(e));
    } on StorageException catch (e) {
      return Left(_catchStorageException(e));
    } catch (e) {
      return Left(_catchUnexpectedException(e));
    }
  }
}

Failure _catchDioError(DioError e) {
  late BackendFailureType failureType;
  final statusCode = e.response?.statusCode;

  switch (statusCode) {
    case 400:
      if (e.response?.data == 'duplicate item') {
        failureType = BackendFailureType.duplicateItem;
      } else if (e.response?.data == 'unsynchronized data') {
        failureType = BackendFailureType.unsynchronizedData;
      } else {
        failureType = BackendFailureType.unexpected;
      }
      break;
    case 404:
      failureType = BackendFailureType.notFound;
      break;
    case 503:
    case 500:
      failureType = BackendFailureType.serverError;
      break;
    default:
      failureType = BackendFailureType.unexpected;
      break;
  }

  if (e.error is SocketException) {
    failureType = BackendFailureType.connectionError;
  }

  return BackendFailure(
    failureType,
    exception: e,
  );
}

Failure _catchStorageException(StorageException e) {
  late BackendFailureType failureType;

  switch (e.type) {
    case StorageExceptionType.notFound:
      failureType = BackendFailureType.notFound;
      break;
    case StorageExceptionType.duplicateItem:
      failureType = BackendFailureType.duplicateItem;
      break;
    case StorageExceptionType.unexpected:
      failureType = BackendFailureType.unexpected;
      break;
  }
  return BackendFailure(
    failureType,
    exception: e,
  );
}

Failure _catchUnexpectedException(Object e) {
  return BackendFailure(
    BackendFailureType.unexpected,
    exception: e,
  );
}
