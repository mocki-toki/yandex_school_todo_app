import 'package:core_infrastructure/core_infrastructure.dart';
import 'package:flutter/foundation.dart';

void initLogger() {
  Logger.root.level =
      CoreInfrastructureConstants.loggingEnabled ? Level.ALL : Level.OFF;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print('${record.level.name}: ${record.time}: ${record.loggerName}'
          '\n${record.message}');
    }
  });
}
