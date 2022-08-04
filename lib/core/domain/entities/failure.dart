abstract class Failure<T> {
  const Failure(
    this.type, {
    required this.exception,
  });

  final T type;
  final dynamic exception;
}
