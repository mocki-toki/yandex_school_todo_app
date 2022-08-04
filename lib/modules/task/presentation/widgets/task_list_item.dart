import 'package:todo_app/app/app.dart';
import 'package:todo_app/modules/task/domain/domain.dart';
import 'package:todo_app/modules/task/presentation/presentation.dart';

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
    return Dismissible(
      key: Key('${task.id}'),
      onDismissed: _onDismissed,
      background: const _DismissibleCheckBackground(),
      secondaryBackground: const _DismissibleDeleteBackground(),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                if (task.importance == Importance.important)
                  Container(
                    color: context.theme.colorRed.withOpacity(0.1),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text.rich(
                  TextSpan(
                    children: [
                      if (!task.done && task.importance != Importance.basic)
                        WidgetSpan(
                          child: _getPrefixIcon(context),
                          alignment: PlaceholderAlignment.middle,
                        ),
                      TextSpan(text: task.text),
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
              ),
            ),
            IconButton(
              icon: const Icon(Icons.info_outline),
              onPressed: () => _onEdit(context),
            ),
          ],
        ),
      ),
    );
  }

  String _getFormattedDeadlineText(BuildContext context) =>
      '\n${DateFormat.yMMMMd(context.localizations.locale).format(task.deadline!)}';

  void _onDismissed(DismissDirection direction) {
    if (direction == DismissDirection.endToStart) {
      //onDeleted(task);
    }

    if (direction == DismissDirection.startToEnd) {
      //onCompleted(task, true);
    }
  }

  void _onEdit(BuildContext context) {
    context.navigateTo(TaskEditRoute(task: task));
  }

  Color _getCheckboxBorderColor(BuildContext context) {
    if (task.done) return context.theme.colorGreen;

    switch (task.importance) {
      case Importance.important:
        return context.theme.colorRed;
      default:
        return context.theme.dividerColor;
    }
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (task.done) {
      return context.textTheme.bodyText1!.copyWith(
        decoration: TextDecoration.lineThrough,
        color: context.textTheme.bodyText2!.color,
      );
    }

    return context.textTheme.bodyText1!;
  }

  Widget _getPrefixIcon(BuildContext context) {
    var widget = Icon(
      Icons.arrow_downward,
      color: context.theme.colorGray,
      size: 20,
    );

    if (task.importance == Importance.important) {
      widget = Icon(
        Icons.priority_high,
        color: context.theme.colorRed,
        size: 20,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: widget,
    );
  }
}

class _DismissibleCheckBackground extends StatelessWidget {
  const _DismissibleCheckBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorGreen,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Icon(
          Icons.check,
          color: context.theme.colorWhite,
        ),
      ),
    );
  }
}

class _DismissibleDeleteBackground extends StatelessWidget {
  const _DismissibleDeleteBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorRed,
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Icon(
          Icons.delete,
          color: context.theme.colorWhite,
        ),
      ),
    );
  }
}
