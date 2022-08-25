import 'package:core_domain/core_domain.dart';

abstract class FirebaseAnalyticsService {
  Future<void> sendEvent(AnalyticsEvent event);
}
