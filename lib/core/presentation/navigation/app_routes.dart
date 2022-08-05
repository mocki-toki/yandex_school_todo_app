import 'package:todo_app/app/app.dart';
import 'package:todo_app/core/presentation/presentation.dart';
import 'package:todo_app/modules/task/domain/domain.dart';

class AppRoutes {
  static const String taskList = '/';
  static const String editTask = '/task';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    Logger('AppRoutes.onGenerateRoute').info("RouteSettings: $settings");
    switch (settings.name) {
      case AppRoutes.taskList:
        return MaterialPageRoute(
          builder: (_) => const TaskListScreen(),
          maintainState: false,
        );
      case AppRoutes.editTask:
        return MaterialPageRoute(
          builder: (_) => TaskEditScreen(
            task: settings.arguments as Task?,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
