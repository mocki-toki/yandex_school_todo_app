import 'package:core_presentation/core_presentation.dart';

class DesignProvider extends InheritedWidget {
  const DesignProvider(
    this.design, {
    super.key,
    required super.child,
  });

  final DesignData design;

  static DesignData of(BuildContext context) {
    final DesignProvider? result =
        context.dependOnInheritedWidgetOfExactType<DesignProvider>();
    assert(result != null, "Design is not provided.");
    return result!.design;
  }

  @override
  bool updateShouldNotify(DesignProvider old) => design != old.design;
}
