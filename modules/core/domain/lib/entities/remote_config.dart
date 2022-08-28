abstract class RemoteConfig<T> {
  RemoteConfig({
    required this.name,
    required this.defaultValue,
  });

  final String name;
  final T defaultValue;
  T? currentValue;

  T get value => currentValue ?? defaultValue;
}
