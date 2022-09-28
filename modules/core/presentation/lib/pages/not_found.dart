import 'package:core_presentation/core_presentation.dart';

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
            Text('404', style: context.textStyle.largeTitle),
            const SizedBox(height: 4),
            Text(
              context.localizations.notFoundText,
              style: context.textStyle.subhead
                  .copyWith(color: context.palette.colorLabelSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
