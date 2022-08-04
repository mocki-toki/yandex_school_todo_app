import 'package:todo_app/modules/task/presentation/presentation.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('404', style: context.textTheme.headline6),
            const SizedBox(height: 4),
            Text(context.localizations.notFoundText),
          ],
        ),
      ),
    );
  }
}
