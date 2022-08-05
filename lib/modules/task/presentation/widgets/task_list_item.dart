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
      key: UniqueKey(),
      confirmDismiss: _onDismissed,
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
            Expanded(
              child: Padding(
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

  Future<bool> _onDismissed(DismissDirection direction) async {
    if (direction == DismissDirection.endToStart) {
      onDeleted(task);
      return true;
    }

    if (direction == DismissDirection.startToEnd) {
      onCompleted(task, !task.done);
    }

    return false;
  }

  void _onEdit(BuildContext context) {
    context.navigateTo(AppRoutes.editTask, arguments: task);
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
    );

    if (importance == Importance.high) {
      widget = SvgPicture.asset(
        AppIcons.highPriority,
        color: getHighImportanceColor(context),
        width: 10,
        height: 16,
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
