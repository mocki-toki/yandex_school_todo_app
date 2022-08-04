import 'dart:async';

extension StreamExtensions<T> on Stream<T> {
  Future<R> handleFirstEvent<R>(FutureOr<R> Function(T event) onValue) {
    final completer = Completer<R>();

    take(1).listen((_) => completer.complete(onValue(_)));

    return completer.future;
  }
}
