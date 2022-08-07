import 'package:flutter/foundation.dart';
import 'package:todo_app/core/infrastructure/infrastructure.dart';

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
