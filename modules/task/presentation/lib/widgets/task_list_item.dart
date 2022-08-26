import 'package:task_domain/task_domain.dart';
import 'package:task_presentation/task_presentation.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem(
    this.task, {
    super.key,
    required this.onDeleted,
    required this.onCompleted,
  });

  final Task task;
  final void Function(Task task) onDeleted;
  final void Function(Task task, bool value) onCompleted;

  @override
  Widget build(BuildContext context) {
    return TaskListItemSwiper(
      onChecked: () => onCompleted(task, !task.done),
      onDeleted: () => onDeleted(task),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _TaskListItemCheckbox(
              task,
              onCompleted: onCompleted,
            ),
            Expanded(
              child: _TaskListItemText(task),
            ),
            SizedBox(
              width: 50,
              child: IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () => _onEdit(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onEdit(BuildContext context) {
    context.sp.getRequired<TaskNavigatorMixin>().editTask(
          taskId: task.id,
          cachedTask: task,
        );
  }
}

class _TaskListItemCheckbox extends StatelessWidget {
  const _TaskListItemCheckbox(
    this.task, {
    required this.onCompleted,
  });

  final Task task;
  final void Function(Task task, bool value) onCompleted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (task.importance == Importance.high)
            Container(
              color: getHighImportanceColor(context).withOpacity(0.1),
              height: 15,
              width: 15,
            ),
          Checkbox(
            value: task.done,
            onChanged: (value) => onCompleted(task, value!),
            activeColor: _getCheckboxBorderColor(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
            checkColor: context.theme.cardColor,
            side: BorderSide(
              color: _getCheckboxBorderColor(context),
              width: 2,
            ),
          ),
        ],
      ),
    );
  }

  Color _getCheckboxBorderColor(BuildContext context) {
    if (task.done) return context.theme.colorGreen;

    switch (task.importance) {
      case Importance.high:
        return getHighImportanceColor(context);
      default:
        return context.theme.dividerColor;
    }
  }
}

class _TaskListItemText extends StatelessWidget {
  const _TaskListItemText(this.task);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Text.rich(
        TextSpan(
          children: [
            if (!task.done && task.importance != Importance.none)
              WidgetSpan(
                child: _PrefixIcon(importance: task.importance),
                alignment: PlaceholderAlignment.middle,
              ),
            TextSpan(text: _getFormattedText()),
            if (task.deadline != null)
              TextSpan(
                text: _getFormattedDeadlineText(context),
                style: context.textTheme.bodyText2,
              ),
          ],
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: _getTextStyle(context),
      ),
    );
  }

  String _getFormattedDeadlineText(BuildContext context) =>
      '\n${DateFormat.yMMMMd(context.localizations.locale).format(task.deadline!)}';

  TextStyle _getTextStyle(BuildContext context) {
    if (task.done) {
      return context.textTheme.bodyText1!.copyWith(
        decoration: TextDecoration.lineThrough,
        color: context.textTheme.bodyText2!.color,
      );
    }

    return context.textTheme.bodyText1!;
  }

  String _getFormattedText() => task.text.replaceAll('\n', ' ');
}

class _PrefixIcon extends StatelessWidget {
  const _PrefixIcon({required this.importance});

  final Importance importance;

  @override
  Widget build(BuildContext context) {
    var widget = SvgPicture.asset(
      AppIcons.lowPriority,
      width: 10,
      height: 16,
      package: 'core_presentation',
    );

    if (importance == Importance.high) {
      widget = SvgPicture.asset(
        AppIcons.highPriority,
        color: getHighImportanceColor(context),
        width: 10,
        height: 16,
        package: 'core_presentation',
      );
    }

    return Container(
      width: 20,
      height: 16,
      padding: const EdgeInsets.only(right: 6),
      child: widget,
    );
  }
}
