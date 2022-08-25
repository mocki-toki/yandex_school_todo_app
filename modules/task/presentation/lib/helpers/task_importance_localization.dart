import 'package:task_domain/task_domain.dart';
import 'package:task_presentation/task_presentation.dart';

class TaskImportanceLocalization {
  static String localize(BuildContext context, Importance importance) {
    switch (importance) {
      case Importance.none:
        return context.localizations.none;
      case Importance.low:
        return context.localizations.low;
      case Importance.high:
        return context.localizations.high;
    }
  }
}
