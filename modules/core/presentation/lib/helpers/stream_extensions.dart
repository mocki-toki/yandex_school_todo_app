import 'dart:async';

import 'package:core_domain/core_domain.dart';

extension StreamExtensions<T> on Stream<T> {
  Future<R> handleFirstEvent<R>(FutureOr<R> Function(T event) onValue) {
    final completer = Completer<R>();

    take(1).listen((_) => completer.complete(onValue(_)));

    return completer.future;
  }
}

extension DataStreamExtensions<T> on Stream<Either<Failure, T>> {
  Future<void> synchronizeData({
    void Function()? onSynchronized,
    void Function()? onSynchronizationError,
    required void Function() onUnsynchronized,
    void Function(Failure failure)? onFailure,
  }) async {
    try {
      final lastEvent = await last;

      lastEvent.fold(
        (failure) {
          if (failure.type == BackendFailureType.unsynchronizedData) {
            onUnsynchronized();
          } else {
            onFailure?.call(failure);
          }
        },
        (_) {
          onSynchronized?.call();
        },
      );
    } catch (e) {
      return onSynchronizationError?.call();
    }
  }
}
