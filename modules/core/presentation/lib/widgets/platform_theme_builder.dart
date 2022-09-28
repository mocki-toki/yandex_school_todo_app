import 'package:core_presentation/core_presentation.dart';

class PlatformBrightnessBuilder extends StatefulWidget {
  const PlatformBrightnessBuilder({super.key, required this.builder});

  final Widget Function(BuildContext context, Brightness platformBrightness)
      builder;

  @override
  State<PlatformBrightnessBuilder> createState() =>
      _PlatformBrightnessBuilderState();
}

class _PlatformBrightnessBuilderState extends State<PlatformBrightnessBuilder> {
  Brightness platformBrightness = Brightness.light;

  @override
  void initState() {
    super.initState();

    final window = WidgetsBinding.instance.window;
    platformBrightness = window.platformBrightness;

    window.onPlatformBrightnessChanged = () {
      setState(() => platformBrightness = window.platformBrightness);
    };
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, platformBrightness);
  }
}
