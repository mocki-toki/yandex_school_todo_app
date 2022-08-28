abstract class Failure<T> {
  const Failure(
    this.type, {
    this.exception,
  });

  final T type;
  final dynamic exception;
}
