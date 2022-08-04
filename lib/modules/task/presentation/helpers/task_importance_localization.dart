import 'package:todo_app/modules/task/domain/domain.dart';
import 'package:todo_app/modules/task/presentation/presentation.dart';

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
