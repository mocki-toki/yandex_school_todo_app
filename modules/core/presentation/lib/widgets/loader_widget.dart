import 'package:core_presentation/core_presentation.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
