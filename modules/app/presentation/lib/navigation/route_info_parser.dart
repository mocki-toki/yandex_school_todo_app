import 'package:app_domain/app_domain.dart';
import 'package:app_presentation/app_presentation.dart';

class AppRouteInformationParser
    extends RouteInformationParser<AppRouterConfig> {
  @override
  Future<AppRouterConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');

    if (uri.pathSegments.isEmpty) {
      return AppRouterConfig.taskList();
    }

    switch (uri.pathSegments[0]) {
      case AppRouterPaths.task:
        try {
          return AppRouterConfig.editTask(UuidValue(
            uri.pathSegments.length > 1 ? uri.pathSegments[1] : '',
          ));
        } catch (e) {
          return AppRouterConfig.createTask();
        }

      case AppRouterPaths.tasks:
        return AppRouterConfig.taskList();

      default:
        return AppRouterConfig.notFound();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(AppRouterConfig configuration) {
    if (configuration.isNotFound) {
      return const RouteInformation(location: AppRouterPaths.notFound);
    }

    if (!configuration.isTask) {
      return const RouteInformation(location: "/${AppRouterPaths.tasks}");
    }

    if (configuration.isTask && configuration.taskId == null) {
      return const RouteInformation(
        location: "/${AppRouterPaths.createTask}",
      );
    }

    return RouteInformation(
      location: "/${AppRouterPaths.task}/${configuration.taskId}",
    );
  }
}
