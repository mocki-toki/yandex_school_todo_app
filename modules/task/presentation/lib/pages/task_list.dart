import 'package:task_domain/task_domain.dart';
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
          sliver: SliverStack(
            children: <Widget>[
              SliverPositioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.palette.colorBackSecondary,
                    boxShadow: [
                      ShadowConstants.cardPart1.boxShadow,
                      ShadowConstants.cardPart2.boxShadow,
                    ],
                    borderRadius: BorderRadiusConstants.card.borderRadius,
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsetsConstants.listCardPadding.edgeInsets,
                sliver: MultiSliver(
                  children: <Widget>[
                    SliverImplicitlyAnimatedList<Task>(
                      items: data.sortedTasks,
                      itemBuilder: (context, item) {
                        return TaskListItem(
                          key: ValueKey(item.id),
                          item,
                          onDeleted:
                              context.read<TaskListViewModel>().deleteTask,
                          onCompleted:
                              context.read<TaskListViewModel>().setDoneTask,
                        );
                      },
                      equalityChecker: (a, b) => a.id == b.id,
                    ),
                    TaskQuickCreator(
                      onCreate:
                          context.read<TaskListViewModel>().quickCreateTask,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
