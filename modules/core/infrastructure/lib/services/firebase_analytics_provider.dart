import 'package:core_domain/core_domain.dart';
import 'package:core_infrastructure/core_infrastructure.dart';

class FirebaseAnalyticsProvider implements Initializable {
  FirebaseAnalyticsProvider(this._deviceIdentifier);

  final DeviceIdentifier _deviceIdentifier;

  late final FirebaseAnalytics analytics;

  @override
  Future<void> initialize() async {
    analytics = FirebaseAnalytics.instance;
    await analytics.setUserId(id: _deviceIdentifier.deviceId);

    Logger('$runtimeType').info('Service initialized');
  }

  FirebaseAnalyticsObserver getObserver() {
    return FirebaseAnalyticsObserver(analytics: analytics);
  }
}
