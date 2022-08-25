import 'dart:async';

import 'package:task_presentation/task_presentation.dart';

class TaskQuickCreator extends StatefulWidget {
  const TaskQuickCreator({
    super.key,
    required this.onCreate,
  });

  final void Function(String text) onCreate;

  @override
  State<TaskQuickCreator> createState() => _TaskQuickCreatorState();
}

class _TaskQuickCreatorState extends State<TaskQuickCreator> {
  final textController = TextEditingController();
  late StreamSubscription<bool> keyboardVisiblitySubscription;

  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    keyboardVisiblitySubscription =
        KeyboardVisibilityController().onChange.listen(
      (visible) {
        if (!visible) {
          focusNode.unfocus();
        }

        if (!visible && textController.text.isNotEmpty) {
          widget.onCreate(textController.text);
          textController.clear();
        }
      },
    );
  }

  @override
  void dispose() {
    textController.dispose();
    keyboardVisiblitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 50,
          ),
          Expanded(
            child: TextField(
              focusNode: focusNode,
              style: context.textTheme.bodyText1,
              controller: textController,
              maxLines: null,
              keyboardType: TextInputType.text,
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
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
