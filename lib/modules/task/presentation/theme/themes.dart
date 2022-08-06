import 'package:todo_app/modules/task/infrastructure/infrastructure.dart';
import 'package:todo_app/modules/task/presentation/presentation.dart';

const _otherHighImportanceColor = Color(0xFF793cd8);

Color getHighImportanceColor(BuildContext context) {
  return context.read<SwitchPriorityColorConfig>().value
      ? _otherHighImportanceColor
      : context.theme.colorRed;
}
