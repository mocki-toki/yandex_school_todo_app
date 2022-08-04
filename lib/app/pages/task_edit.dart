import 'package:todo_app/modules/task/domain/domain.dart';
import 'package:todo_app/modules/task/presentation/presentation.dart';

class TaskEditScreen extends StatelessWidget {
  const TaskEditScreen({
    super.key,
    this.task,
  });

  final Task? task;

  @override
  Widget build(BuildContext context) {
    return TaskEditViewModelProvider(
      editedTask: task,
      child: const _TaskEditPage(),
    );
  }
}

class _TaskEditPage extends StatelessWidget {
  const _TaskEditPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskEditViewModel, TaskEditState>(
      builder: (context, state) {
        return state.when(
          editTask: (editedTask, textController, importance, deadline) {
            return Scaffold(
              body: SafeArea(
                child: _TaskEditPageDefault(
                  editedTask,
                  textController,
                  importance,
                  deadline,
                ),
              ),
            );
          },
          newTask: (textController, importance, deadline) {
            return Scaffold(
              body: SafeArea(
                child: _TaskEditPageDefault(
                  null,
                  textController,
                  importance,
                  deadline,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _TaskEditPageDefault extends StatelessWidget {
  const _TaskEditPageDefault(
    this.task,
    this.textController,
    this.importance,
    this.deadline,
  );

  final Task? task;
  final TextEditingController textController;
  final Importance importance;
  final DateTime? deadline;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => onClose(context),
            ),
            const Spacer(),
            TextButton(
              onPressed: () => onSaveTask(context),
              child: Text(context.localizations.saveTask.toUpperCase()),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              _Editor(textController: textController),
              // TODO: сделать dropdown
              ListTile(
                title: Text(context.localizations.taskImportance),
                subtitle: Text(context.localizations.taskImportanceBasic),
              ),
              const Divider(
                indent: 16,
                endIndent: 16,
              ),
              SwitchListTile(
                value: deadline != null,
                onChanged: (value) => onDeadlineChanged(context, value),
                title: Text(context.localizations.taskDeadline),
                subtitle: getFormattedDeadlineTextWidget(context),
              ),
              const Divider(),
              ListTile(
                enabled: task != null,
                iconColor: context.theme.colorRed,
                textColor: context.theme.colorRed,
                leading: const Icon(Icons.delete),
                title: Text(context.localizations.taskDelete),
                onTap: () => onDeleteTask(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // TODO: виджеты в виде функций
  Widget? getFormattedDeadlineTextWidget(BuildContext context) {
    if (deadline == null) {
      return null;
    } else {
      return Text(
        DateFormat.yMMMMd(context.localizations.locale).format(deadline!),
        style: context.textTheme.bodyText2!.copyWith(
          color: context.theme.colorBlue,
        ),
      );
    }
  }

  void onClose(BuildContext context) => context.navigateBack();

  void onSaveTask(BuildContext context) => context.navigateBack();

  void onDeleteTask(BuildContext context) => context.navigateBack();

  void onDeadlineChanged(BuildContext context, bool value) async {
    FocusScope.of(context).unfocus();

    final viewModel = context.read<TaskEditViewModel>();
    if (value) {
      final dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 100)),
        lastDate: DateTime.now().add(const Duration(days: 100)),
      );

      return viewModel.setDeadline(dateTime);
    }

    viewModel.setDeadline(null);
  }
}

class _Editor extends StatelessWidget {
  const _Editor({
    required this.textController,
  });

  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: TextField(
        controller: textController,
        autofocus: true,
        maxLines: null,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          border: InputBorder.none,
          hintText: context.localizations.taskEditHint,
          // TODO: magic numbers
          constraints: const BoxConstraints(minHeight: 104),
        ),
      ),
    );
  }
}
