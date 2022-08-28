import 'dart:math';
import 'dart:ui';

import 'package:task_presentation/task_presentation.dart';

class TaskListHeader extends StatelessWidget {
  const TaskListHeader({
    super.key,
    required this.taskCompletedCount,
    required this.visibilityButtonValue,
    required this.onVisibilityButtonChanged,
    required this.syncState,
  });

  final int taskCompletedCount;
  final bool visibilityButtonValue;
  final ValueChanged<bool> onVisibilityButtonChanged;
  final TaskListSyncState syncState;

  @override
  Widget build(BuildContext context) {
    final expanded = context.mediaQuery.orientation == Orientation.portrait;
    return SliverPersistentHeader(
      delegate: _Header(
        taskCompletedCount,
        context.mediaQuery.viewPadding.top,
        visibilityButtonValue,
        onVisibilityButtonChanged,
        syncState,
        expanded: expanded,
      ),
      pinned: true,
    );
  }
}

class _Header extends SliverPersistentHeaderDelegate {
  const _Header(
    this.taskCompletedCount,
    this.statusBarHeight,
    this.visibilityButtonValue,
    this.onVisibilityButtonChanged,
    this.syncState, {
    required this.expanded,
  });

  final int taskCompletedCount;
  final double statusBarHeight;
  final bool visibilityButtonValue;
  final ValueChanged<bool> onVisibilityButtonChanged;
  final TaskListSyncState syncState;
  final bool expanded;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = expanded
        ? min(1, shrinkOffset / (maxExtent - minExtent)).toDouble()
        : 1.0;

    final elevation = (expanded ? progress != 1 : shrinkOffset == 0)
        ? 0.0
        : ElevationConstants.appBar.value;

    final color = (expanded ? progress != 1 : shrinkOffset == 0)
        ? context.palette.colorBackPrimary
        : context.theme.appBarTheme.backgroundColor;

    return Card(
      color: Colors.transparent,
      elevation: elevation,
      margin: EdgeInsets.zero,
      child: AnimatedContainer(
        duration: DurationConstants.standartAnimation.duration,
        color: color,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: statusBarHeight,
                left: lerpDouble(
                  EdgeInsetsConstants.expandedAppBarPadding.edgeInsets.left,
                  EdgeInsetsConstants.appBarElementPadding.edgeInsets.left,
                  progress,
                )!,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  context.localizations.myTasks,
                  style: TextStyle.lerp(
                    context.textStyle.largeTitle,
                    context.textStyle.title,
                    progress,
                  ),
                ),
              ),
            ),
            Positioned(
              left: EdgeInsetsConstants.expandedAppBarPadding.edgeInsets.left,
              bottom: kToolbarHeight / 3,
              child: AnimatedOpacity(
                duration: DurationConstants.standartAnimation.duration,
                opacity: progress != 0 ? 0 : 1,
                child: Text(
                  context.localizations.tasksCompleted(taskCompletedCount),
                  style: context.textStyle.body
                      .copyWith(color: context.palette.colorLabelTertiary),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: lerpDouble(
                EdgeInsetsConstants.expandedAppBarPadding.edgeInsets.right,
                0,
                progress,
              )!,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  IconButton(
                    icon: Icon(
                      _getSyncStateIconData(),
                      color: context.palette.colorSupportSeparator,
                    ),
                    onPressed: null,
                  ),
                  IconButton(
                    icon: Icon(
                      !visibilityButtonValue
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: context.palette.colorBlue,
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
  double get maxExtent => expanded ? 156 : minExtent;

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
