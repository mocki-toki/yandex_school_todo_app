import 'package:core_domain/core_domain.dart';
import 'package:core_infrastructure/core_infrastructure.dart';

class FirebaseAnalyticsServiceImpl implements FirebaseAnalyticsService {
  FirebaseAnalyticsServiceImpl(this._analytics);

  final FirebaseAnalytics _analytics;

  @override
  Future<void> sendEvent(AnalyticsEvent event) async {
    await _analytics.logEvent(name: event.name, parameters: event.parameters);

    Logger('$runtimeType').info('Event sent: $event');
  }
}
