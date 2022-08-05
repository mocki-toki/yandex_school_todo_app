import 'dart:math';
import 'dart:ui' as ui;

import 'package:todo_app/modules/task/presentation/presentation.dart';

class TaskListHeader extends SliverPersistentHeaderDelegate {
  const TaskListHeader({
    required this.taskCompletedCount,
    required this.statusBarHeight,
    required this.visibilityButtonValue,
    required this.onVisibilityButtonChanged,
    required this.syncState,
  });

  final int taskCompletedCount;
  final double statusBarHeight;
  final bool visibilityButtonValue;
  final ValueChanged<bool> onVisibilityButtonChanged;
  final TaskListSyncState syncState;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = min(1, shrinkOffset / (maxExtent - minExtent)).toDouble();

    return Card(
      color: Colors.transparent,
      elevation: progress != 1 ? 0 : 4,
      margin: EdgeInsets.zero,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        color: progress != 1
            ? context.theme.scaffoldBackgroundColor
            : context.theme.appBarTheme.backgroundColor,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.lerp(
                Alignment.bottomLeft,
                Alignment.centerLeft,
                progress,
              )!,
              child: Padding(
                padding: EdgeInsets.only(
                  top: statusBarHeight,
                  bottom: ui.lerpDouble(kToolbarHeight - 12, 0, progress)!,
                  left: ui.lerpDouble(60, 16, progress)!,
                ),
                child: Text(
                  context.localizations.myTasks,
                  style: TextStyle.lerp(
                    context.textTheme.headlineLarge!,
                    context.textTheme.headline6!,
                    progress,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 60,
              bottom: kToolbarHeight / 3,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: progress != 0 ? 0 : 1,
                child: Text(
                  context.localizations.tasksCompleted(taskCompletedCount),
                  style: context.textTheme.bodyText1!
                      .copyWith(color: context.theme.hintColor),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    icon: Icon(
                      _getSyncStateIconData(),
                      color: context.theme.dividerColor,
                    ),
                    onPressed: null,
                  ),
                  IconButton(
                    icon: Icon(
                      !visibilityButtonValue
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: context.theme.primaryColor,
                    ),
                    onPressed: _onVisibilityButtonPressed,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 180;

  @override
  double get minExtent => statusBarHeight + kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  void _onVisibilityButtonPressed() {
    onVisibilityButtonChanged(!visibilityButtonValue);
  }

  IconData _getSyncStateIconData() {
    switch (syncState) {
      case TaskListSyncState.loading:
        return Icons.cloud_download_outlined;
      case TaskListSyncState.loaded:
        return Icons.cloud_done_outlined;
      case TaskListSyncState.error:
        return Icons.cloud_off_outlined;
    }
  }
}
