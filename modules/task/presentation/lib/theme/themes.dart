import 'package:task_domain/task_domain.dart';
import 'package:task_presentation/task_presentation.dart';

const _otherHighImportanceColor = Color(0xFF793cd8);

Color getHighImportanceColor(BuildContext context) {
  return context.sp.getRequired<SwitchPriorityColorRemoteConfig>().value
      ? _otherHighImportanceColor
      : context.theme.colorRed;
}
