import 'package:task_presentation/task_presentation.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen>
    with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      context.read<TaskListViewModel>().synchronizeStorageWithNetwork();
      getLogger().info('App resumed');
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
    return TaskListViewModelProvider(
      child: BlocBuilder<TaskListViewModel, TaskListState>(
        builder: (context, state) => state.maybeMap(
          loaded: (state) => Scaffold(
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => _onAddTask(context),
            ),
            body: _TaskListPage(
              state.data,
              state.visibleDoneTasks,
              state.syncState,
            ),
          ),
          error: (state) {
            return Scaffold(
              body: FailureDecoratorWidget(state.failure),
            );
          },
          orElse: () {
            return const Scaffold(
              body: LoaderWidget(),
            );
          },
        ),
      ),
    );
  }

  void _onAddTask(BuildContext context) {
    context.sp.getRequired<TaskNavigatorMixin>().createTask();
  }
}

class _TaskListPage extends StatelessWidget {
  const _TaskListPage(
    this.data,
    this.visibleDoneTasks,
    this.syncState,
  );

  final TaskListData data;
  final bool visibleDoneTasks;
  final TaskListSyncState syncState;

// TODO: анимация добавления удаления изменения тасков
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        TaskListHeader(
          taskCompletedCount: data.completedTasksCount,
          visibilityButtonValue: visibleDoneTasks,
          onVisibilityButtonChanged:
              context.read<TaskListViewModel>().changeVisibilityDoneTasks,
          syncState: syncState,
        ),
        SliverPadding(
          padding: EdgeInsetsConstants.listCardMargin.edgeInsets,
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
