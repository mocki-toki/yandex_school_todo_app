// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../../core/presentation/presentation.dart' as _i4;
import '../../modules/task/domain/domain.dart' as _i5;
import '../app.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    TaskListRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.TaskListScreen());
    },
    TaskEditRoute.name: (routeData) {
      final args = routeData.argsAs<TaskEditRouteArgs>(
          orElse: () => const TaskEditRouteArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.TaskEditScreen(key: args.key, task: args.task));
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig('/#redirect',
            path: '/', redirectTo: '/tasks', fullMatch: true),
        _i2.RouteConfig(TaskListRoute.name, path: '/tasks'),
        _i2.RouteConfig(TaskEditRoute.name, path: '/task')
      ];
}

/// generated route for
/// [_i1.TaskListScreen]
class TaskListRoute extends _i2.PageRouteInfo<void> {
  const TaskListRoute() : super(TaskListRoute.name, path: '/tasks');

  static const String name = 'TaskListRoute';
}

/// generated route for
/// [_i1.TaskEditScreen]
class TaskEditRoute extends _i2.PageRouteInfo<TaskEditRouteArgs> {
  TaskEditRoute({_i4.Key? key, _i5.Task? task})
      : super(TaskEditRoute.name,
            path: '/task', args: TaskEditRouteArgs(key: key, task: task));

  static const String name = 'TaskEditRoute';
}

class TaskEditRouteArgs {
  const TaskEditRouteArgs({this.key, this.task});

  final _i4.Key? key;

  final _i5.Task? task;

  @override
  String toString() {
    return 'TaskEditRouteArgs{key: $key, task: $task}';
  }
}
