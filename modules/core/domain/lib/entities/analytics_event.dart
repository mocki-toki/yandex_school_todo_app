abstract class AnalyticsEvent {
  AnalyticsEvent({
    required this.name,
    required this.parameters,
  });

  final String name;
  final Map<String, Object?>? parameters;

  @override
  String toString() => "$name ($parameters)";
}
