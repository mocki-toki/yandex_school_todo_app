import 'package:task_presentation/task_presentation.dart';

class TaskListItemDecorator extends StatelessWidget {
  const TaskListItemDecorator({
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
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: context.palette.colorBackSecondary,
        borderRadius: BorderRadius.vertical(
          top: isFirst
              ? BorderRadiusConstants.card.borderRadiusTop
              : Radius.zero,
          bottom: isLast
              ? BorderRadiusConstants.card.borderRadiusBottom
              : Radius.zero,
        ),
        boxShadow: [
          BoxShadow(
            color: ShadowConstants.cardPart1.boxShadow.color,
            offset: Offset(0, isFirst || isLast ? 2 : 5),
            blurRadius: ShadowConstants.cardPart1.boxShadow.blurRadius,
          ),
          ShadowConstants.cardPart2.boxShadow,
          if (!isFirst)
            BoxShadow(
              color: context.palette.colorBackSecondary,
              offset: const Offset(0, -2),
            ),
        ],
      ),
      padding: isFirst
          ? EdgeInsets.only(
              top: EdgeInsetsConstants.listCardPadding.edgeInsets.top,
            )
          : isLast
              ? EdgeInsets.only(
                  bottom: EdgeInsetsConstants.listCardPadding.edgeInsets.bottom,
                )
              : const EdgeInsets.only(top: 2),
      child: child,
    );
  }
}
