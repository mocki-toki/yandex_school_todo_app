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

class _TaskListPage extends StatefulWidget {
  const _TaskListPage();

  @override
  State<_TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<_TaskListPage>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<TaskListViewModel>().synchronizeStorageWithNetwork();
      Logger("TaskListPage").info('App resumed');
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListViewModel, TaskListState>(
      builder: (context, state) => state.maybeWhen(
        loaded: (data, visibleDoneTasks, syncState) => Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () => _onAddTask(context),
          ),
          body: _TaskListPageLoaded(
            data,
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
    context.navigateTo(AppRoutes.editTask);
  }
}

class _TaskListPageLoaded extends StatelessWidget {
  const _TaskListPageLoaded(
    this.data,
    this.visibleDoneTasks,
    this.syncState,
  );

  final TaskListData data;
  final bool visibleDoneTasks;
  final TaskListSyncState syncState;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          delegate: TaskListHeader(
            taskCompletedCount: data.completedTasksCount,
            statusBarHeight: context.mediaQuery.viewPadding.top,
            visibilityButtonValue: visibleDoneTasks,
            onVisibilityButtonChanged:
                context.read<TaskListViewModel>().changeVisibilityDoneTasks,
            syncState: syncState,
          ),
          pinned: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8)
              .copyWith(top: 4, bottom: 100),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == data.sortedTasks.length) {
                  return TaskListItemDecorator(
                    isFirst: index == 0,
                    isLast: true,
                    child: TaskQuickCreator(
                      onCreate:
                          context.read<TaskListViewModel>().quickCreateTask,
                    ),
                  );
                }

                return TaskListItemDecorator(
                  isFirst: index == 0,
                  isLast: false,
                  child: TaskListItem(
                    data.sortedTasks[index],
                    onDeleted: context.read<TaskListViewModel>().deleteTask,
                    onCompleted: context.read<TaskListViewModel>().setDoneTask,
                  ),
                );
              },
              childCount: data.sortedTasks.length + 1,
            ),
          ),
        ),
      ],
    );
  }
}
