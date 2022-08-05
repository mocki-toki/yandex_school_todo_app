import 'package:todo_app/modules/task/presentation/presentation.dart';

class TaskQuickCreator extends StatefulWidget {
  const TaskQuickCreator({
    super.key,
    required this.onCreate,
  });

  final void Function(String text, bool done) onCreate;

  @override
  State<TaskQuickCreator> createState() => _TaskQuickCreatorState();
}

class _TaskQuickCreatorState extends State<TaskQuickCreator> {
  final _textController = TextEditingController();

  var taskDone = false;
  var creatorMode = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      if (mounted) {
        setState(() => creatorMode = _textController.text.isNotEmpty);
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            maintainState: true,
            maintainAnimation: true,
            maintainSize: true,
            visible: creatorMode,
            child: Checkbox(
              value: taskDone,
              onChanged: (value) => onCompleted(value!),
              activeColor: context.theme.colorGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              checkColor: context.theme.cardColor,
              side: BorderSide(
                color: context.theme.dividerColor,
                width: 2,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              style: context.textTheme.bodyText1,
              controller: _textController,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: context.localizations.newTask,
                hintStyle: context.textTheme.bodyText1!.copyWith(
                  color: context.textTheme.bodyText2!.color,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          Visibility(
            visible: creatorMode,
            child: IconButton(
              icon: const Icon(Icons.add_circle),
              onPressed: () => _onCreate(context),
            ),
          ),
        ],
      ),
    );
  }

  void onCompleted(bool value) {
    setState(() => taskDone = value);
  }

  void _onCreate(BuildContext context) async {
    widget.onCreate(_textController.text, taskDone);
    _textController.clear();
  }
}
