import 'package:core_presentation/core_presentation.dart';

typedef DesignBuilder = Widget Function(
  BuildContext context,
  ThemeData theme,
);

class Design extends StatelessWidget {
  const Design({
    super.key,
    required this.data,
    required this.builder,
  });

  final DesignData data;
  final DesignBuilder builder;

  @override
  Widget build(BuildContext context) {
    return DesignProvider(
      data,
      child: Builder(
        builder: (context) => builder(context, data.themeData),
      ),
    );
  }
}
