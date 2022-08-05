import 'package:todo_app/modules/task/domain/domain.dart';

extension TaskStreamExtensions<T> on Stream<Either<Failure, T>> {
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
