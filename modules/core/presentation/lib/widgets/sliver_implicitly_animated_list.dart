import 'package:core_presentation/core_presentation.dart';

import 'package:diffutil_sliverlist/diffutil_sliverlist.dart';

class SliverImplicitlyAnimatedList<T> extends StatelessWidget {
  const SliverImplicitlyAnimatedList({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.equalityChecker,
  });

  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final bool Function(T, T) equalityChecker;

  @override
  Widget build(BuildContext context) {
    return DiffUtilSliverList<T>(
      items: items,
      builder: itemBuilder,
      equalityChecker: equalityChecker,
      insertAnimationBuilder: (_, animation, child) =>
          _AnimatedItem(animation, child),
      removeAnimationBuilder: (_, animation, child) =>
          _AnimatedItem(animation, child),
      insertAnimationDuration: DurationConstants.longAnimation.duration,
      removeAnimationDuration: DurationConstants.longAnimation.duration,
    );
  }
}

class _AnimatedItem extends StatelessWidget {
  const _AnimatedItem(this.animation, this.child);

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animation,
        curve: const Interval(0.0, 0.7, curve: Curves.easeInOut),
        reverseCurve: const Interval(0.0, 0.5, curve: Curves.easeInOutSine),
      ),
      child: FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: const Interval(0.8, 1, curve: Curves.linearToEaseOut),
        ),
        child: ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: const Interval(0.5, 1, curve: Curves.linearToEaseOut),
          ),
          child: child,
        ),
      ),
    );
  }
}
