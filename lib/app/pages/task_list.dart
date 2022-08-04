import 'package:todo_app/app/app.dart';
import 'package:todo_app/modules/task/domain/domain.dart';
import 'package:todo_app/modules/task/presentation/presentation.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TaskListViewModelProvider(
      child: const _TaskListPage(),
    );
  }
}

class _TaskListPage extends StatelessWidget {
  const _TaskListPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListViewModel, TaskListState>(
      builder: (context, state) => state.maybeWhen(
        loaded: (tasks, visibleDoneTasks, syncState) => Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => _onAddTask(context),
          ),
          body: _TaskListPageLoaded(
            tasks.toList(),
            visibleDoneTasks,
            syncState,
          ),
        ),
        error: (failure, _, __) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${failure.type}"),
            ),
          );
        },
        orElse: () {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  void _onAddTask(BuildContext context) {
    context.navigateTo(TaskEditRoute());
  }
}

class _TaskListPageLoaded extends StatelessWidget {
  const _TaskListPageLoaded(
    this.tasks,
    this.visibleDoneTasks,
    this.syncState,
  );

  final List<Task> tasks;
  final bool visibleDoneTasks;
  final TaskListSyncState syncState;

  @override
  Widget build(BuildContext context) {
    // TODO: рефакторить?
    final taskCompletedCount = tasks.where((task) => task.done).length;
    final tasksToShow =
        visibleDoneTasks ? tasks : tasks.where((task) => !task.done).toList();

    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: TaskListHeader(
            taskCompletedCount: taskCompletedCount,
            statusBarHeight: context.mediaQuery.viewPadding.top,
            visibilityButtonValue: visibleDoneTasks,
            onVisibilityButtonChanged:
                context.read<TaskListViewModel>().changeVisibilityDoneTasks,
            syncState: syncState,
          ),
          pinned: true,
        ),

        // TODO: сделать без shrinkWrap
        SliverToBoxAdapter(
          child: Card(
            clipBehavior: Clip.antiAlias,
            margin:
                const EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 100),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => TaskListItem(
                tasksToShow[index],
                onDeleted: context.read<TaskListViewModel>().deleteTask,
                onCompleted: context.read<TaskListViewModel>().setDoneTask,
              ),
              itemCount: tasksToShow.length,
            ),
          ),
        ),
      ],
    );
  }
}
