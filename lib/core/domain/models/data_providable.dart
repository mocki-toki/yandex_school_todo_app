abstract class DataProvidable<T> {
  const DataProvidable({
    this.element,
    this.list,
  }) : assert(
          element != null || list != null,
          'Either element or list must be provided',
        );

  final T? element;
  final Iterable<T>? list;
}
