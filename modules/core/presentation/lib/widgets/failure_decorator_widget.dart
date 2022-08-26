import 'package:core_domain/core_domain.dart';
import 'package:core_presentation/core_presentation.dart';

class FailureDecoratorWidget extends StatelessWidget {
  const FailureDecoratorWidget(
    this.failure, {
    super.key,
  });

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    if (failure.type == BackendFailureType.notFound ||
        failure.type == StorageExceptionType.notFound) {
      return NotFoundScreen();
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(elevation: 0),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 50,
              color: context.palette.colorRed,
            ),
            SizedBox(height: 10),
            Text(
              context.localizations.errorText,
              style: context.textStyle.body,
            ),
            SizedBox(height: 5),
            Text(
              context.localizations.errorCodeText("${failure.type}"),
              textAlign: TextAlign.center,
              style: context.textStyle.subhead,
            ),
          ],
        ),
      ),
    );
  }
}
