import 'package:todo_app/app/app.dart';
import 'package:todo_app/core/presentation/presentation.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: TaskListScreen,
      // TODO: не работает
      maintainState: true,
      path: '/tasks',
      initial: true,
    ),
    AutoRoute(
      page: TaskEditScreen,
      path: '/task',
    ),
  ],
)
class $AppRouter {}
