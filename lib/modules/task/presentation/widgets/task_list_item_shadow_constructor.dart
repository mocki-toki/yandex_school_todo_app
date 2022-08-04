import 'package:todo_app/modules/task/presentation/presentation.dart';

class TaskListItemShadowConstructor extends StatelessWidget {
  const TaskListItemShadowConstructor({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.child,
  });

  final bool isFirst;
  final bool isLast;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.vertical(
          top: isFirst ? const Radius.circular(8) : Radius.zero,
          bottom: isLast ? const Radius.circular(8) : Radius.zero,
        ),
        boxShadow: [
          BoxShadow(
            color: context.theme.shadowColor.withOpacity(0.12),
            offset: Offset(0, isFirst || isLast ? 2 : 5),
            blurRadius: 2,
          ),
          BoxShadow(
            color: context.theme.shadowColor.withOpacity(0.06),
            offset: const Offset(0, 2),
            blurRadius: 2,
          ),
          if (!isFirst)
            BoxShadow(
              color: context.theme.cardColor,
              offset: const Offset(0, -2),
              blurRadius: 0,
            ),
        ],
      ),
      padding: !isFirst ? null : const EdgeInsets.only(top: 2),
      child: Material(
        type: MaterialType.transparency,
        child: child,
      ),
    );
  }
}
