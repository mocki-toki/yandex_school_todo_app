import 'package:todo_app/modules/task/presentation/presentation.dart';

class TaskListItemSwiper extends StatefulWidget {
  const TaskListItemSwiper({
    super.key,
    required this.child,
    this.onChecked,
    this.onDeleted,
  });

  final Widget child;

  final VoidCallback? onChecked;
  final VoidCallback? onDeleted;

  @override
  State<TaskListItemSwiper> createState() => _TaskListItemSwiperState();
}

class _TaskListItemSwiperState extends State<TaskListItemSwiper>
    with TickerProviderStateMixin {
  bool locked = false;
  double dragExtent = 0.0;

  late AnimationController moveAnimationController;
  late Animation<Offset> moveAnimation;
  late Animation<double> backgroundSizeAnimation;

  late AnimationController backgroundFadeAnimationController;
  late Animation<double> backgroundFadeAnimation;

  @override
  void initState() {
    super.initState();

    moveAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    moveAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.0, 0.0),
    ).animate(moveAnimationController);
    backgroundSizeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(moveAnimationController);

    backgroundFadeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    backgroundFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(backgroundFadeAnimationController);
  }

  @override
  void dispose() {
    moveAnimationController.dispose();
    backgroundFadeAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[
      Positioned.fill(
        child: ClipRect(
          clipper: _Clipper(moveAnimation: moveAnimation),
          child: ColoredBox(
            color: dragExtent < 0
                ? context.theme.colorRed
                : context.theme.colorGreen,
          ),
        ),
      ),
      if (dragExtent > 0)
        SizeTransition(
          axisAlignment: 1,
          axis: Axis.horizontal,
          sizeFactor: backgroundSizeAnimation,
          child: const _CheckBackground(),
        ),
      if (dragExtent < 0)
        SizeTransition(
          axisAlignment: -1,
          axis: Axis.horizontal,
          sizeFactor: backgroundSizeAnimation,
          child: const _DeleteBackground(),
        ),
      SlideTransition(
        position: moveAnimation,
        child: ColoredBox(
          color: context.theme.cardColor,
          child: widget.child,
        ),
      ),
      FadeTransition(
        opacity: backgroundFadeAnimation,
        child: ColoredBox(
          color: context.theme.cardColor,
          child: widget.child,
        ),
      ),
    ];

    return IgnorePointer(
      ignoring: locked,
      child: GestureDetector(
        onHorizontalDragUpdate: _handleDragUpdate,
        onHorizontalDragEnd: _handleDragEnd,
        onHorizontalDragCancel: _handleDragEnd,
        behavior: HitTestBehavior.opaque,
        child: Stack(
          alignment:
              dragExtent < 0 ? Alignment.centerRight : Alignment.centerLeft,
          children: children,
        ),
      ),
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    var delta = details.primaryDelta!;
    var oldDragExtent = dragExtent;
    dragExtent += delta;

    if (oldDragExtent.sign != dragExtent.sign) {
      var end = dragExtent.sign;
      setState(() {
        moveAnimation =
            Tween<Offset>(begin: const Offset(0.0, 0.0), end: Offset(end, 0.0))
                .animate(moveAnimationController);
      });
    }

    var newPos = dragExtent.abs() / context.size!.width;

    moveAnimationController.value = newPos;
  }

  void _handleDragEnd([DragEndDetails? details]) {
    if (details != null) {
      var velocity = details.velocity.pixelsPerSecond.dx;

      var endVelocity = velocity.abs() / context.size!.width;
      var endPos = dragExtent.abs() / context.size!.width;

      var endValue = endPos;

      if (endVelocity > 3) {
        endValue = 1;
      } else {
        endValue = endPos.round().toDouble();
      }

      if (endValue == 1) {
        if (dragExtent < 0) {
          _successSwiperAnimation(() => widget.onDeleted?.call());
        } else {
          _successSwiperAnimation(() => widget.onChecked?.call());
        }
      } else {
        dragExtent = 0.0;
      }

      moveAnimationController.animateTo(
        endValue,
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    } else {
      moveAnimationController.animateTo(
        0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );

      dragExtent = 0.0;
    }
  }

  Future<void> _successSwiperAnimation(VoidCallback onCompleted) async {
    setState(() {
      locked = true;
    });

    await Future.delayed(const Duration(milliseconds: 300));

    onCompleted();

    await backgroundFadeAnimationController.animateTo(
      1,
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );

    backgroundFadeAnimationController.reset();
    moveAnimationController.reset();

    setState(() {
      dragExtent = 0.0;
      locked = false;
    });
  }
}

class _CheckBackground extends StatelessWidget {
  const _CheckBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Icon(
        Icons.check,
        color: context.theme.colorWhite,
      ),
    );
  }
}

class _DeleteBackground extends StatelessWidget {
  const _DeleteBackground();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Icon(
        Icons.delete,
        color: context.theme.colorWhite,
      ),
    );
  }
}

class _Clipper extends CustomClipper<Rect> {
  _Clipper({
    required this.moveAnimation,
  }) : super(reclip: moveAnimation);

  final Animation<Offset> moveAnimation;

  @override
  Rect getClip(Size size) {
    final double offset = moveAnimation.value.dx * size.width;
    if (offset < 0) {
      return Rect.fromLTRB(size.width + offset, 0.0, size.width, size.height);
    }
    return Rect.fromLTRB(0.0, 0.0, offset, size.height);
  }

  @override
  Rect getApproximateClipRect(Size size) => getClip(size);

  @override
  bool shouldReclip(_Clipper oldClipper) {
    return oldClipper.moveAnimation.value != moveAnimation.value;
  }
}
